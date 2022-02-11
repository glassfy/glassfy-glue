//
//  GYOfferings+Encode.h
//  Glassfy
//
//

#import "GlassfyGlue.h"
#import "GGCodableProtocol.h"


@interface GYOffering (GGEncode) <GGEncodeProtocol>
- (id)encodedDictionary;
@end
