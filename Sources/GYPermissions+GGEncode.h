//
//  GYOfferings+Encode.h
//  Glassfy
//
//

#import "GlassfyGlue.h"
#import "GGCodableProtocol.h"


@interface GYPermissions (GGEncode) <GGEncodeProtocol>
- (id)encodedDictionary;
@end
