//
//  GYOfferings+Encode.m
//  Glassfy
//
//

#import "SKProduct+GGEncode.h"
#import "SKPaymentDiscount+GGEncode.h"
#import "SKProductDiscount+GGEncode.h"

@implementation SKProduct (GGEncode)

- (id)encodedDictionary
{
    NSMutableDictionary *product = [[NSMutableDictionary alloc]init];
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterCurrencyStyle;
    formatter.locale = self.priceLocale;
    
    product[@"identifier"] = self.productIdentifier ?: @"";
    product[@"description"] = self.localizedDescription ?: @"";
    product[@"title"] = self.localizedTitle ?: @"";
    product[@"price"] = self.price;
    product[@"currencyCode"] = self.priceLocale.currencyCode ?: @"";
    
    NSString *formattedSubscriptionPeriod = @"";
    if (@available(iOS 11.2, tvOS 11.2, macos 10.13.2, *)) {
        formattedSubscriptionPeriod = [SKProduct subscriptionPeriodISO8601:self.subscriptionPeriod];
        if (self.introductoryPrice) {
            product[@"introductoryPrice"] = [self.introductoryPrice encodedDictionary];
        }
    }
    product[@"period"] = formattedSubscriptionPeriod;
        
    if (@available(iOS 12.2, tvOS 12.2, macos 10.14.4, *)) {
        NSMutableArray *allDiscounts= [NSMutableArray new];
        for (SKProductDiscount* discount in self.discounts) {
            [allDiscounts addObject:[discount encodedDictionary]];
        }
        product[@"discounts"] = allDiscounts;
    }
    
    if (@available(iOS 12.0, tvOS 12.0, macos 10.14, *)) {
        product[@"subscriptionGroupIdentifier"] = self.subscriptionGroupIdentifier;
    }

    return product;
}

+ (NSString *)subscriptionPeriodISO8601 :(SKProductSubscriptionPeriod*)subscriptionPeriod API_AVAILABLE(ios(11.2), macos(10.13.2), tvos(11.2)) {
    
    if (subscriptionPeriod == nil) {
        return @"";
    }
    
    NSString *unit;
    switch (subscriptionPeriod.unit) {
        case SKProductPeriodUnitDay:
            unit = @"D";
            break;
        case SKProductPeriodUnitWeek:
            unit = @"W";
            break;
        case SKProductPeriodUnitMonth:
            unit = @"M";
            break;
        case SKProductPeriodUnitYear:
            unit = @"Y";
            break;
    }
    return [NSString stringWithFormat:@"P%@%@", @(subscriptionPeriod.numberOfUnits), unit];
}


@end
