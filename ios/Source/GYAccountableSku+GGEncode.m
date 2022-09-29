//
//  GYAccountableSku+GGEncode.m
//  GlassfyGlue
//
//  Created by Luca Garbolino on 29/09/22.
//

#import "GYAccountableSku+GGEncode.h"
#import "GYSkuBase+GGEncode.h"

@implementation GYAccountableSku (GGEncode)

- (id)encodedDictionary
{
    NSMutableDictionary *sku = [super encodedDictionary];
    
    sku[@"isInIntroOfferPeriod"] = [NSNumber numberWithBool:self.isInIntroOfferPeriod];
    sku[@"isInTrialPeriod"] = [NSNumber numberWithBool:self.isInTrialPeriod];
    
    return sku;
}

@end
