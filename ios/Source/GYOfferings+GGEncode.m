//
//  GYOfferings+Encode.m
//  Glassfy
//
//

#import "GYOffering+GGEncode.h"

@implementation GYOfferings (GGEncode)

- (id)encodedDictionary
{
    NSMutableArray *all = [[NSMutableArray alloc] init];

    for(GYOffering *offering in self.all) {
        [all addObject:[offering encodedDictionary]];
    }
    return @{@"all":all};

}

@end
