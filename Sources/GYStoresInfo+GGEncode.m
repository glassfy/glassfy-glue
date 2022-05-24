//
//  GlassfyGlueCodableDictionarProtocol+GYStoresInfo.m
//  GlassfyGlue
//
//  Created by Marco Pifferi on 17/05/22.
//

#import "GYStoresInfo+GGEncode.h"
#import "GYStoreInfo+GGEncode.h"

@implementation GYStoresInfo (GGEncode)

- (NSDictionary *)encodedDictionary
{
    NSMutableDictionary *storesInfo = [[NSMutableDictionary alloc]init];

    NSMutableArray *all = [[NSMutableArray alloc] init];
    for(GYStoreInfo *storeInfo in self.all) {
        [all addObject:[storeInfo encodedDictionary]];
    }

    storesInfo[@"all"] = all;
    return storesInfo;

}

@end
