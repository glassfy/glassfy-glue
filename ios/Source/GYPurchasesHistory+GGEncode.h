//
//  GYPurchasesHistory+GGEncode.h
//  Glassfy
//
//

#import "GlassfyGlue.h"
#import "GGCodableProtocol.h"


@interface GYPurchasesHistory (GGEncode) <GGEncodeProtocol>
- (id)encodedDictionary;
@end
