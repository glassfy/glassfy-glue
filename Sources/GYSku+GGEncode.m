//
//  GYOfferings+Encode.m
//  Glassfy
//
//

#import "GYSku+GGEncode.h"
#import "SKProduct+GGEncode.h"
#import "SKProductDiscount+GGEncode.h"
#import "GYSkuBase+GGEncode.h"

@implementation GYSku (GGEncode)

- (id)encodedDictionary
{
    NSMutableDictionary *sku = [super encodedDictionary];
    
    sku[@"introductoryEligibility"] = @(self.introductoryEligibility);
    sku[@"promotionalEligibility"] = @(self.promotionalEligibility);
    sku[@"extravars"] = self.extravars;
    sku[@"product"] = [self.product encodedDictionary];
    if (@available(iOS 12.2, *)) {
        sku[@"discount"] = [self.discount encodedDictionary];
    } 

    return sku;
}

@end
