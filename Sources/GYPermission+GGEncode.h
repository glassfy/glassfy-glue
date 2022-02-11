//
//  GYOfferings+Encode.h
//  Glassfy
//
//

#import "GlassfyGlue.h"
#import "GGCodableProtocol.h"


@interface GYPermission (GGEncode) <GGEncodeProtocol>
- (id)encodedDictionary;
@end
