//
//  GYSku+GGEncode.h
//  Glassfy
//
//

#if __has_include(<GlassfyGlue/GlassfyGlue.h>)
#import <GlassfyGlue/GlassfyGlue.h>
#import <GlassfyGlue/GGCodableProtocol.h>
#elif __has_include(<GlassfyGlue.h>)
#import <GlassfyGlue.h>
#import <GGCodableProtocol.h>
#else
#import "GlassfyGlue.h"
#import "GGCodableProtocol.h"
#endif

@interface GYSku (GGEncode) <GGEncodeProtocol>
- (id)encodedDictionary;
@end
