#import "GlassfyGlue.h"
#import "GYOffering+GGEncode.h"
#import "GYOfferings+GGEncode.h"
#import "GYPermissions+GGEncode.h"
#import "GYSku+GGEncode.h"
#import "GYSkuBase+GGEncode.h"
#import "GYStoresInfo+GGEncode.h"
#import "GYTransaction+GGEncode.h"
#import "GYUserProperties+GGEncode.h"

@implementation GlassfyGlue

+ (void)sdkVersionWithCompletion:(GlassfyGlueCompletion _Nonnull)block {
  NSMutableDictionary *sdkVersion = [[NSMutableDictionary alloc] init];
  sdkVersion[@"version"] = [Glassfy sdkVersion];
  block(sdkVersion, nil);
}

+ (void)initializeWithApiKey:(NSString *_Nonnull)apiKey
                 watcherMode:(BOOL)watcherMode
              withCompletion:(GlassfyGlueCompletion _Nonnull)block;
{
  [Glassfy initializeWithAPIKey:apiKey watcherMode:watcherMode];
  block(nil, nil);
}

+ (void)setLogLevel:(int)logLevel {
  if (logLevel == 0) {
    [Glassfy setLogLevel:GYLogLevelOff];
  } else if (logLevel == 1) {
    [Glassfy setLogLevel:GYLogLevelError];
  } else if (logLevel == 2) {
    [Glassfy setLogLevel:GYLogLevelDebug];
  } else if (logLevel == 3) {
    [Glassfy setLogLevel:GYLogLevelInfo];
  } else if (logLevel == 4) {
    [Glassfy setLogLevel:GYLogLevelAll];
  }
}

+ (void)offeringsWithCompletion:(GlassfyGlueCompletion _Nonnull)block {
  [Glassfy offeringsWithCompletion:^(GYOfferings *offerings, NSError *error) {
    if (error != nil) {
      block(nil, error);
      return;
    }

    NSDictionary *retOfferings = [offerings encodedDictionary];
    block(retOfferings, nil);
  }];
}

+ (void)permissionsWithCompletion:(GlassfyGlueCompletion _Nonnull)block {
  [Glassfy
      permissionsWithCompletion:^(GYPermissions *permissions, NSError *error) {
        if (error != nil) {
          block(nil, error);
          return;
        }

        NSDictionary *retPermissions = [permissions encodedDictionary];
        block(retPermissions, nil);
      }];
}

+ (void)skuWithId:(NSString *_Nonnull)skuid
    withCompletion:(GlassfyGlueCompletion _Nonnull)block {
  [Glassfy skuWithId:skuid
          completion:^(GYSku *sku, NSError *error) {
            if (error != nil) {
              block(nil, error);
              return;
            }

            NSDictionary *retSku = [sku encodedDictionary];
            block(retSku, nil);
          }];
}

+ (void)skuWithId:(NSString *)skuid
            store:(GYStore)store
       completion:(GlassfyGlueCompletion _Nonnull)block {
  [Glassfy skuWithId:skuid
               store:store
          completion:^(GYSkuBase *skuBase, NSError *error) {
            if (error != nil) {
              block(nil, error);
              return;
            }
            NSDictionary *retSku = [skuBase encodedDictionary];
            block(retSku, nil);
          }];
}

+ (void)purchaseSku:(NSDictionary *_Nonnull)sku
     withCompletion:(GlassfyGlueCompletion _Nonnull)block {
  if (![sku isKindOfClass:[NSDictionary class]]) {
    block(nil, [GlassfyGlue errorWithCode:-42
                              description:@"invalid parameter"]);
    return;
  }
  NSString *skuId = sku[@"skuId"];
  if (skuId == nil) {
    block(nil, [GlassfyGlue errorWithCode:-42
                              description:@"invalid parameter"]);
    return;
  }
  [Glassfy skuWithId:skuId
          completion:^(GYSku *sku, NSError *error) {
            if (error != nil) {
              block(nil, error);
              return;
            }

            [Glassfy purchaseSku:sku
                      completion:^(GYTransaction *transaction, NSError *error) {
                        if (error != nil) {
                          block(nil, error);
                          return;
                        }
                        NSDictionary *retTransaction =
                            [transaction encodedDictionary];

                        block(retTransaction, nil);
                      }];
          }];
}

+ (void)restorePurchasesWithCompletion:(GlassfyGlueCompletion _Nonnull)block {
  [Glassfy restorePurchasesWithCompletion:^(GYPermissions *permissions,
                                            NSError *error) {
    if (error != nil) {
      block(nil, error);
      return;
    }

    NSDictionary *retPermissions = [permissions encodedDictionary];
    block(retPermissions, nil);
  }];
}

+ (void)setDeviceToken:(NSString *)token
        withCompletion:(GlassfyGlueCompletion _Nonnull)block;
{
  [Glassfy setDeviceToken:token
               completion:[GlassfyGlue errorOnlyCompletion:block]];
}

+ (void)setEmailUserProperty:(NSString *)email
              withCompletion:(GlassfyGlueCompletion _Nonnull)block {
  [Glassfy setEmailUserProperty:email completion:[GlassfyGlue errorOnlyCompletion:block]];
}

+ (void)setExtraUserProperty:(NSDictionary *)extraProp
              withCompletion:(GlassfyGlueCompletion _Nonnull)block;
{
  [Glassfy setExtraUserProperty:extraProp
                     completion:[GlassfyGlue errorOnlyCompletion:block]];
}

+ (void)getExtraUserPropertyWithCompletion:
    (GlassfyGlueCompletion _Nonnull)block {
  [Glassfy getUserProperties:^(GYUserProperties *userproperty, NSError *error) {
    if (error != nil) {
      block(nil, error);
      return;
    }
    NSDictionary *retProperty = [userproperty encodedDictionary];

    block(retProperty, nil);
  }];
}

+ (void)connectPaddleLicenseKey:(NSString *)licenseKey
                          force:(BOOL)force
                     completion:(GlassfyGlueCompletion _Nonnull)block {
  [Glassfy connectPaddleLicenseKey:licenseKey
                             force:force
                        completion:^(NSError *error) {
                          if (error != nil) {
                            block(nil, error);
                            return;
                          }
                          block(nil, nil);
                        }];
}

+ (void)connectCustomSubscriber:(NSString *_Nullable)customId
                     completion:(GlassfyGlueCompletion _Nonnull)block {
  [Glassfy connectCustomSubscriber:customId
                        completion:^(NSError *error) {
                          if (error != nil) {
                            block(nil, error);
                            return;
                          }
                          block(nil, nil);
                        }];
}

+ (void)storeInfo:(GlassfyGlueCompletion _Nonnull)block {
  [Glassfy storeInfo:^(GYStoresInfo *storeInfo, NSError *error) {
    if (error != nil) {
      block(nil, error);
      return;
    }
    NSDictionary *infoStoreDict = [storeInfo encodedDictionary];
    block(infoStoreDict, nil);
  }];
}

+ (NSError *)errorWithCode:(int)code description:(NSString *)description {
  NSDictionary *userInfo = @{
    NSLocalizedDescriptionKey : description,
  };
  NSError *error = [NSError errorWithDomain:@"io.glassfy.glue"
                                       code:code
                                   userInfo:userInfo];
  return error;
}

+ (void (^)(NSError *_Nullable))errorOnlyCompletion:
    (GlassfyGlueCompletion _Nonnull)block {
  return ^(NSError *_Nullable error) {
      block(nil, error);
  };
}

@end
