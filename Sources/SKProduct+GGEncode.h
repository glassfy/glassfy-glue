//
//  GYOfferings+Encode.h
//  Glassfy
//
//

#import "GlassfyGlue.h"
#import "GGCodableProtocol.h"


@interface SKProduct (GGEncode) <GGEncodeProtocol>
- (id)encodedDictionary;
+ (NSString *)subscriptionPeriodISO8601 :(SKProductSubscriptionPeriod*)subscriptionPeriod API_AVAILABLE(ios(11.2), macos(10.13.2), tvos(11.2));


@end
