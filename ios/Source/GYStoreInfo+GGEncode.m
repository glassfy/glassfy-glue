//
//  GlassfyGlueCodableDictionarProtocol+GYStoresInfo.m
//  GlassfyGlue
//
//  Created by Marco Pifferi on 17/05/22.
//

#import "GYStoreInfo+GGEncode.h"

@implementation GYStoreInfo (GGEncode)

- (NSDictionary *)encodedDictionary
{
    NSMutableDictionary *storeInfo = [[NSMutableDictionary alloc]init];
    storeInfo[@"store"] = @(self.store);
    storeInfo[@"rawInfo"] = self.rawInfo;
    return storeInfo;
}

@end
