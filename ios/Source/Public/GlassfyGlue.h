#if __has_include(<Glassfy/Glassfy.h>)
#import <Glassfy/Glassfy.h>
#elif __has_include(<Glassfy.h>)
#import <Glassfy.h>
#else
#import "Glassfy.h"
#endif


@protocol GlassfyGluePurchaseDelegate <NSObject>
@optional

- (void)didPurchaseProduct:(NSDictionary<NSString *, id> *_Nonnull)transaction;

- (void)handlePromotedProductId:(NSString *_Nonnull)productid
              withPromotionalId:(NSString *_Nullable)promoid
                purchaseHandler:(void (^_Nullable)(GYPaymentTransactionBlock _Nullable))purchase;

@end


typedef void (^GlassfyGlueCompletion)(NSDictionary<NSString *, id> *_Nullable, NSError *_Nullable);

@interface GlassfyGlue : NSObject

+ (void)sdkVersionWithCompletion:(GlassfyGlueCompletion _Nonnull)block;

+ (void)initializeWithApiKey:(NSString *_Nonnull)apiKey
                 watcherMode:(BOOL)watcherMode
              withCompletion:(GlassfyGlueCompletion _Nonnull)block;

+ (void)setLogLevel:(int)logLevel;

+ (void)purchaseHistoryWithCompletion:(GlassfyGlueCompletion _Nonnull)block;

+ (void)offeringsWithCompletion:(GlassfyGlueCompletion _Nonnull)block;

+ (void)permissionsWithCompletion:(GlassfyGlueCompletion _Nonnull)block;

+ (void)skuWithId:(NSString *_Nonnull)skuid
    withCompletion:(GlassfyGlueCompletion _Nonnull)block;

+ (void)skuWithId:(NSString *_Nonnull)skuid
            store:(GYStore)store
       completion:(GlassfyGlueCompletion _Nonnull)block;

+ (void)purchaseSku:(NSDictionary *_Nonnull)sku
     withCompletion:(GlassfyGlueCompletion _Nonnull)block;

+ (void)restorePurchasesWithCompletion:(GlassfyGlueCompletion _Nonnull)block;

+ (void)setDeviceToken:(NSString *_Nonnull)token
        withCompletion:(GlassfyGlueCompletion _Nonnull)block;

+ (void)setEmailUserProperty:(NSString *_Nonnull)email
              withCompletion:(GlassfyGlueCompletion _Nonnull)block;

+ (void)setExtraUserProperty:(NSDictionary *_Nonnull)extraProp
              withCompletion:(GlassfyGlueCompletion _Nonnull)block;

+ (void)getExtraUserPropertyWithCompletion:(GlassfyGlueCompletion _Nonnull)block;

+ (void)connectPaddleLicenseKey:(NSString *_Nonnull)licenseKey
                          force:(BOOL)force
                     completion:(GlassfyGlueCompletion _Nonnull)block;

+ (void)connectCustomSubscriber:(NSString *_Nullable)customId
                     completion:(GlassfyGlueCompletion _Nonnull)block;

+ (void)storeInfo:(GlassfyGlueCompletion _Nonnull)block;

+ (void)setPurchaseDelegate:(id<GlassfyGluePurchaseDelegate> _Nullable)delegate;

+ (void)setAttributionType:(NSNumber *_Nonnull)type
                     value:(NSString *_Nullable)value
                completion:(GlassfyGlueCompletion _Nonnull)block;

+ (void)setAttributions:(NSArray *_Nonnull)items
             completion:(GlassfyGlueCompletion _Nonnull)block;

@end
