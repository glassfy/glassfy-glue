//
//  GYOfferings+Encode.m
//  Glassfy
//
//

#import "GYOfferings+GGEncode.h"
#import "GYOffering+GGEncode.h"
#import "GYSku+GGEncode.h"

@implementation GYOffering (GGEncode)

- (id)encodedDictionary
{
    NSMutableArray *skus = [[NSMutableArray alloc] init];

    for(GYSku *sku in self.skus) {
        [skus addObject:[sku encodedDictionary]];
    }

    return @{@"offeringId":self.offeringId,@"skus":skus};
}

@end
