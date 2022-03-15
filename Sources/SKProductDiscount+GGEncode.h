//
//  SKProductDiscount+Encode.h
//  Glassfy
//
//

#import "GlassfyGlue.h"
#import "GGCodableProtocol.h"


@interface SKProductDiscount (GGEncode) <GGEncodeProtocol>
- (id)encodedDictionary;
@end
