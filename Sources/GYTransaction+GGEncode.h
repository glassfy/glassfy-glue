//
//  GYOfferings+Encode.h
//  Glassfy
//
//

@import Glassfy;


#import "GGCodableProtocol.h"


@interface GYTransaction (GGEncode) <GGEncodeProtocol>
- (id)encodedDictionary;
@end
