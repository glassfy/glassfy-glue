//
//  GYPaywall+Encode.h
//  Glassfy
//
//

#import "GlassfyGlue.h"
#import "GGCodableProtocol.h"


@interface GYPaywall (GGEncode) <GGEncodeProtocol>
- (id)encodedDictionary;
@end
