#import "GlassfyGlue.h"
#import "GYOfferings+GGEncode.h"
#import "GYOffering+GGEncode.h"
#import "GYPermissions+GGEncode.h"
#import "GYSku+GGEncode.h"
#import "GYTransaction+GGEncode.h"
#import "GYUserProperties+GGEncode.h"

@implementation GlassfyGlue


+ (void)sdkVersionWithCompletion:(GlassfyGlueCompletion _Nonnull )block
{
    NSMutableDictionary *sdkVersion = [[NSMutableDictionary alloc]init];
    sdkVersion[@"version"]=[Glassfy sdkVersion];
    block(sdkVersion,nil);
}

+ (void)initializeWithApiKey:(NSString*_Nonnull)apiKey watcherMode:(BOOL)watcherMode withCompletion:(GlassfyGlueCompletion _Nonnull )block;
{
    [Glassfy initializeWithAPIKey:apiKey watcherMode:watcherMode];
    block(nil,nil);
}

+ (void)offeringsWithCompletion:(GlassfyGlueCompletion _Nonnull )block
{
    [Glassfy offeringsWithCompletion:^(GYOfferings *offerings, NSError *error) {
        if (error != nil) {
            block(nil,error);
            return;
        }
        
        NSDictionary *retOfferings = [offerings encodedDictionary];
        block(retOfferings,nil);
    }];
}

+ (void)permissionsWithCompletion:(GlassfyGlueCompletion _Nonnull )block
{
    [Glassfy permissionsWithCompletion:^(GYPermissions *permissions, NSError *error) {
        if (error != nil) {
            block(nil,error);
            return;
        }
        
        NSDictionary *retPermissions = [permissions encodedDictionary];
        block(retPermissions,nil);

    }];
}


+ (void)loginUser:(NSString *_Nonnull)userId withCompletion:(GlassfyGlueCompletion _Nonnull )block
{
    [Glassfy loginUser:userId withCompletion:[GlassfyGlue errorOnlyCompletion:block]];
}

+ (void)logoutUserWithCompletion:(GlassfyGlueCompletion _Nonnull )block;
{
    [Glassfy logoutWithCompletion:[GlassfyGlue errorOnlyCompletion:block]];

}

+ (void)skuWithId:(NSString *_Nonnull)skuid withCompletion:(GlassfyGlueCompletion _Nonnull )block
{
    [Glassfy skuWithId:skuid completion:^(GYSku *sku , NSError *error ) {
        if (error != nil) {
            block(nil,error);
            return;
        }
        
        NSDictionary *retSku = [sku encodedDictionary];
        block(retSku,nil);
    }];
}

+ (void)purchaseSku:(NSDictionary *_Nonnull)sku withCompletion:(GlassfyGlueCompletion _Nonnull )block
{
    if (![sku isKindOfClass:[NSDictionary class]]) {
        block(nil,[GlassfyGlue errorWithCode:-42 description:@"invalid parameter"]);
        return;
    }
    NSString *identifier = sku[@"identifier"];
    if (identifier == nil) {
        block(nil,[GlassfyGlue errorWithCode:-42 description:@"invalid parameter"]);
        return;
    }
    [Glassfy skuWithId:identifier completion:^(GYSku *sku , NSError *error ) {
        if (error != nil) {
            block(nil,error);
            return;
        }

        [Glassfy purchaseSku:sku completion:^(GYTransaction *transaction, NSError * error) {
            if (error != nil) {
                block(nil,error);
                return;
            }
            NSDictionary *retTransaction = [transaction encodedDictionary];

            block(retTransaction,nil);
        }];
    }];
}

+ (void)restorePurchasesWithCompletion:(GlassfyGlueCompletion _Nonnull )block
{
    [Glassfy restorePurchasesWithCompletion:^(GYPermissions *permissions, NSError *error) {
        if (error != nil) {
            block(nil,error);
            return;
        }
        
        NSDictionary *retPermissions = [permissions encodedDictionary];
        block(retPermissions,nil);
    }
    ];
}

+ (void)setDeviceToken:(NSString *)token withCompletion:(GlassfyGlueCompletion _Nonnull )block;
{
    [Glassfy setDeviceToken:token completion:[GlassfyGlue errorOnlyCompletion:block]];
}

+ (void)setEmailUserProperty:(NSString*)email withCompletion:(GlassfyGlueCompletion _Nonnull )block
{
    [Glassfy setDeviceToken:email completion:[GlassfyGlue errorOnlyCompletion:block]];
}

+ (void)setExtraUserProperty:(NSDictionary *)extraProp withCompletion:(GlassfyGlueCompletion _Nonnull )block;
{
    [Glassfy setExtraUserProperty:extraProp completion:[GlassfyGlue errorOnlyCompletion:block]];
}

+ (void)getExtraUserPropertyWithCompletion:(GlassfyGlueCompletion _Nonnull )block
{
    [Glassfy getUserProperties:^(GYUserProperties * userproperty, NSError * error) {
        if (error != nil) {
            block(nil,error);
            return;
        }
        NSDictionary *retProperty = [userproperty encodedDictionary];

        block(retProperty,nil);
    }];
}


+ (NSError *)errorWithCode:(int)code description:(NSString*)description {
    NSDictionary *userInfo = @{
      NSLocalizedDescriptionKey: description,
    };
    NSError *error = [NSError errorWithDomain:@"io.glassfy.glue"
                                         code:code
                                     userInfo:userInfo];
    return error;

}

+ (void (^)(NSError * _Nullable))errorOnlyCompletion:(GlassfyGlueCompletion _Nonnull )block {
    return ^(NSError *_Nullable error) {
        if (error) {
            block(nil,error);
        }
    };
}



@end
