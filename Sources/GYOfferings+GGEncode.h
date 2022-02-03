//
//  GYOfferings+Encode.h
//  Glassfy
//
//

@import Glassfy;


#import "GGCodableProtocol.h"


@interface GYOfferings (GGEncode) <GGEncodeProtocol>
- (id)encodedDictionary;
@end
