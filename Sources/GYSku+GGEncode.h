//
//  GYOfferings+Encode.h
//  Glassfy
//
//

#import "GlassfyGlue.h"
#import "GGCodableProtocol.h"


@interface GYSku (GGEncode) <GGEncodeProtocol>
- (id)encodedDictionary;
@end
