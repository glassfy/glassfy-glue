//
//  GlassfyGlueCodableDictionarProtocol+GYStoresInfo.m
//  GlassfyGlue
//
//  Created by Marco Pifferi on 17/05/22.
//

#import "GYStoreInfo+GGEncode.h"

@implementation GYStoreInfoPaddle (GGEncode)

- (NSDictionary *)encodedDictionary
{
    NSMutableDictionary *dict = [super encodedDictionary];
    dict[@"userid"] = self.userId;
    dict[@"planId"] = self.planId;
    dict[@"subscriptionId"] = self.subscriptionId;
    dict[@"updateURL"] = self.updateURL.absoluteString;
    dict[@"cancelURL"] = self.cancelURL.absoluteString;
    
    return dict;
}

@end
