//
//  SKPaymentDiscount+Encode.h
//  Glassfy
//
//

#import "GlassfyGlue.h"
#import "GGCodableProtocol.h"


@interface SKPaymentDiscount (GGEncode) <GGEncodeProtocol>
- (id)encodedDictionary;
@end
