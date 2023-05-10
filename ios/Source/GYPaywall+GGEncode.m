//
//  GYPaywall+Encode.m
//  Glassfy
//
//

#import "GYPaywall+GGEncode.h"
#import "GYSku+GGEncode.h"

@implementation GYPaywall (GGEncode)

- (id)encodedDictionary
{
    NSMutableArray *skus = [[NSMutableArray alloc] init];
    for(GYSku *sku in self.skus) {
        [skus addObject:[sku encodedDictionary]];
    }
    
    return @{
        @"contentUrl": self.contentUrl.absoluteString,
        @"pwid": self.pwid,
        @"locale": self.locale.languageCode,
        @"skus": skus,
        @"config": [self config]
    };
}

@end
