//
//  GYStoresInfo+GGEncode.h
//  GlassfyGlue
//
//  Created by Marco Pifferi on 17/05/22.
//

#import "GlassfyGlue.h"
#import "GGCodableProtocol.h"


NS_ASSUME_NONNULL_BEGIN

@interface GYStoresInfo (GGEncode) <GGEncodeProtocol>
- (id)encodedDictionary;
@end

NS_ASSUME_NONNULL_END
