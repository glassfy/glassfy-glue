//
//  SKPaymentDiscount+Encode.m
//  Glassfy
//
//

#import "SKPaymentDiscount+GGEncode.h"


@implementation SKPaymentDiscount (RCPurchases)

- (NSDictionary *)encodedDictionary
{
    return @{
        @"identifier": self.identifier,
        @"keyIdentifier": self.keyIdentifier,
        @"nonce": self.nonce.UUIDString,
        @"signature": self.signature,
        @"timestamp": self.timestamp,
    };
}

@end 
