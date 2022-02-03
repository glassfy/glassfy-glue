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
    
    sku[@"identifier"] = self.identifier;
    sku[@"productId"] = self.productId;
    sku[@"introductoryEligibility"] = @(self.introductoryEligibility);
    sku[@"promotionalEligibility"] = @(self.promotionalEligibility);
    sku[@"extravars"] = self.extravars;
    
    return sku;
}

@end
