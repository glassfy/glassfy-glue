//
//  GYOfferings+Encode.m
//  Glassfy
//
//

#import "GYSku+GGEncode.h"

@implementation GYSku (GGEncode)

- (id)encodedDictionary
{
    NSMutableDictionary *sku = [[NSMutableDictionary alloc]init];
    
    sku[@"skuId"] = self.skuId;
    sku[@"productId"] = self.productId;
    sku[@"introductoryEligibility"] = @(self.introductoryEligibility);
    sku[@"promotionalEligibility"] = @(self.promotionalEligibility);
    sku[@"extravars"] = self.extravars;
    
    return sku;
}

@end
