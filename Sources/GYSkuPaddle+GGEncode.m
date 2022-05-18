//
//  GYSkuPaddle+GGEncode.m
//  Glassfy
//
//

#import "GYSkuBase+GGEncode.h"
#import "GYSkuPaddle+GGEncode.h"

@implementation GYSkuPaddle (GGEncode)

- (id)encodedDictionary
{
    NSMutableDictionary *sku = [super encodedDictionary];
    
    sku[@"name"] = self.name;
    sku[@"initialPrice"] = @(self.initialPrice.floatValue);
    sku[@"localeIdentifier"] = self.initialPriceLocale.localeIdentifier;
    sku[@"initialPriceCode"] = self.initialPriceCode;

    sku[@"recurringPrice"] = @(self.recurringPrice.floatValue);
    sku[@"recurringPriceLocale"] = self.recurringPriceLocale.localeIdentifier;
    sku[@"recurringPriceCode"] = self.recurringPriceCode;
    sku[@"extravars"] = self.extravars;

    return sku;
}

@end
