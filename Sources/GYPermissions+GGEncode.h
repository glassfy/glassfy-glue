//
//  GYOfferings+Encode.h
//  Glassfy
//
//

@import Glassfy;


#import "GGCodableProtocol.h"


@interface GYPermissions (GGEncode) <GGEncodeProtocol>
- (id)encodedDictionary;
@end
