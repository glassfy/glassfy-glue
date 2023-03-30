//
//  GYPurchaseHistory+GGEncode.h
//  Glassfy
//
//

#import "GlassfyGlue.h"
#import "GGCodableProtocol.h"


@interface GYPurchaseHistory (GGEncode) <GGEncodeProtocol>
- (id)encodedDictionary;
@end
