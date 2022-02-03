//
//  GYOfferings+Encode.h
//  Glassfy
//
//

@import Glassfy;


#import "GGCodableProtocol.h"


@interface GYOffering (GGEncode) <GGEncodeProtocol>
- (id)encodedDictionary;
@end
