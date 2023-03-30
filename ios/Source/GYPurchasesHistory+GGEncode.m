//
//  GYPurchasesHistory+GGEncode.m
//  Glassfy
//
//

#import "GYPurchaseHistory+GGEncode.h"

@implementation GYPurchasesHistory (GGEncode)

- (id)encodedDictionary
{
    NSMutableDictionary *history = [[NSMutableDictionary alloc]init];    
    history[@"subscriberId"] = self.subscriberId;
    history[@"customId"] = self.customId;

    NSMutableArray *all = [[NSMutableArray alloc] init];
    for(GYPurchaseHistory *item in self.all) {
        [all addObject:[item encodedDictionary]];
    }
    history[@"all"] = all;
    return history;
}

@end
