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
    sku[@"initialPrice"] = self.initialPrice;
    sku[@"initialPriceCode"] = self.initialPriceCode;
    sku[@"extravars"] = self.extravars;
    sku[@"recurringPrice"] = self.recurringPrice;
    sku[@"recurringPriceCode"] = self.recurringPriceCode;
    sku[@"extravars"] = self.extravars;

    return sku;
}

@end
