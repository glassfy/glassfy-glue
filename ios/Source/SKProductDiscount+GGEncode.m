//
//  SKProductDiscount+Encode.m
//  Glassfy
//
//

#import "SKProductDiscount+GGEncode.h"
#import "SKProduct+GGEncode.h"


@implementation SKProductDiscount (RCPurchases)

- (NSDictionary *)encodedDictionary
{
    NSMutableDictionary *product = [[NSMutableDictionary alloc]init];

    if (@available(iOS 11.2, tvOS 11.2, macos 10.13.2, *)) {
        product[@"price"] = self.price;
        product[@"currencyCode"] = self.priceLocale.currencyCode;
        product[@"period"] = [SKProduct subscriptionPeriodISO8601:self.subscriptionPeriod];
        product[@"numberOfPeriods"] = @(self.numberOfPeriods);

        if (@available(iOS 12.2, tvOS 12.2, macOS 10.14.4, *)) {
            product[@"type"] = self.type == SKProductDiscountTypeIntroductory ? @"introductory" : @"subscription";
            if (self.identifier) {
                product[@"identifier"] = self.identifier;
            }
        }
    }
    return product;

}


@end 
