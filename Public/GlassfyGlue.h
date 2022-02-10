
@import Glassfy;

typedef void (^GlassfyGlueCompletion)(NSDictionary<NSString*,id> *_Nullable, NSError *_Nullable);

@interface GlassfyGlue: NSObject

+ (void)sdkVersionWithCompletion:(GlassfyGlueCompletion _Nonnull )block;
+ (void)initializeWithApiKey:(NSString*_Nonnull)apiKey watcherMode:(BOOL)watcherMode withCompletion:(GlassfyGlueCompletion _Nonnull )block;
+ (void)offeringsWithCompletion:(GlassfyGlueCompletion _Nonnull )block;
+ (void)permissionsWithCompletion:(GlassfyGlueCompletion _Nonnull )block;
+ (void)loginUser:(NSString *_Nonnull)userId withCompletion:(GlassfyGlueCompletion _Nonnull )block;
+ (void)logoutUserWithCompletion:(GlassfyGlueCompletion _Nonnull )block;
+ (void)skuWithIdentifier:(NSString *_Nonnull)skuid withCompletion:(GlassfyGlueCompletion _Nonnull )block;
+ (void)purchaseSku:(NSDictionary *_Nonnull)sku withCompletion:(GlassfyGlueCompletion _Nonnull )block;
+ (void)restorePurchasesWithCompletion:(GlassfyGlueCompletion _Nonnull )block;
+ (void)setDeviceToken:(NSString *_Nonnull)token withCompletion:(GlassfyGlueCompletion _Nonnull )block;
+ (void)setEmailUserProperty:(NSString*_Nonnull)email withCompletion:(GlassfyGlueCompletion _Nonnull )block;
+ (void)setExtraUserProperty:(NSDictionary *_Nonnull)extraProp withCompletion:(GlassfyGlueCompletion _Nonnull )block;
+ (void)getExtraUserPropertyWithCompletion:(GlassfyGlueCompletion _Nonnull )block;

@end
