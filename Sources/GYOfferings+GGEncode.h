//
//  GYOfferings+Encode.h
//  Glassfy
//
//

#import "GlassfyGlue.h"
#import "GGCodableProtocol.h"


@interface GYOfferings (GGEncode) <GGEncodeProtocol>
- (id)encodedDictionary;
@end
