//
//  GYSkuPaddle+GGEncode.h
//  Glassfy
//
//

#import "GlassfyGlue.h"
#import "GGCodableProtocol.h"


@interface GYSkuPaddle (GGEncode) <GGEncodeProtocol>
- (id)encodedDictionary;
@end
