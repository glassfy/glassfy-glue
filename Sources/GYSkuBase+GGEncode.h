//
//  GYSkuBase+GGEncode.h
//  Glassfy
//
//

#import "GlassfyGlue.h"
#import "GGCodableProtocol.h"


@interface GYSkuBase (GGEncode) <GGEncodeProtocol>
- (id)encodedDictionary;
@end
