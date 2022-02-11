//
//  GYOfferings+Encode.h
//  Glassfy
//
//

#import "GlassfyGlue.h"
#import "GGCodableProtocol.h"


@interface GYTransaction (GGEncode) <GGEncodeProtocol>
- (id)encodedDictionary;
@end
