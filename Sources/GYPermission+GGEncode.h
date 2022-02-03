//
//  GYOfferings+Encode.h
//  Glassfy
//
//

@import Glassfy;


#import "GGCodableProtocol.h"


@interface GYPermission (GGEncode) <GGEncodeProtocol>
- (id)encodedDictionary;
@end
