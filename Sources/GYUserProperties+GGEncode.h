//
//  GYOfferings+Encode.h
//  Glassfy
//
//

#import "GlassfyGlue.h"
#import "GGCodableProtocol.h"


@interface GYUserProperties (GGEncode) <GGEncodeProtocol>
- (id)encodedDictionary;
@end
