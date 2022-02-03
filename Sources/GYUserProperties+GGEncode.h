//
//  GYOfferings+Encode.h
//  Glassfy
//
//

@import Glassfy;


#import "GGCodableProtocol.h"


@interface GYUserProperties (GGEncode) <GGEncodeProtocol>
- (id)encodedDictionary;
@end
