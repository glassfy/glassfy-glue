//
//  GYAccountableSku+GGEncode.h
//  GlassfyGlue
//
//  Created by Luca Garbolino on 29/09/22.
//



#import "GlassfyGlue.h"
#import "GGCodableProtocol.h"


@interface GYAccountableSku (GGEncode) <GGEncodeProtocol>
- (id)encodedDictionary;
@end
