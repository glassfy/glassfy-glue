//
//  GYOfferings+Encode.h
//  Glassfy
//
//

@import Glassfy;


#import "GGCodableProtocol.h"


@interface GYSku (GGEncode) <GGEncodeProtocol>
- (id)encodedDictionary;
@end
