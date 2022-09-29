//
//  GYSkuBase+GGEncode.m
//  Glassfy
//
//

#import "GYSkuBase+GGEncode.h"

@implementation GYSkuBase (GGEncode)

- (id)encodedDictionary
{
    NSMutableDictionary *skubase = [[NSMutableDictionary alloc]init];
    
    skubase[@"skuId"] = self.skuId;
    skubase[@"productId"] = self.productId;
    skubase[@"store"] = @(self.store);

    return skubase;
}

@end
