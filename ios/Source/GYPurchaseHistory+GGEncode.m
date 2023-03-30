//
//  GYPurchaseHistory+GGEncode.m
//  Glassfy
//
//

#import "GYPermission+GGEncode.h"
#import "GYAccountableSku+GGEncode.h"

@implementation GYPurchaseHistory (GGEncode)

- (id)encodedDictionary
{
    NSMutableDictionary *history = [[NSMutableDictionary alloc]init];
    history[@"productId"] = self.productId;
    history[@"skuId"] = self.skuId;
    history[@"type"] = @(self.type);
    history[@"store"] = @(self.store);
    history[@"purchaseDate"] = @([self.purchaseDate timeIntervalSince1970]);
    history[@"expireDate"] = @([self.expireDate timeIntervalSince1970]);
    history[@"transactionId"] = self.transactionId;
    history[@"subscriberId"] = self.subscriberId;
    history[@"currencyCode"] = self.currencyCode;
    history[@"countryCode"] = self.countryCode;
    history[@"isInIntroOfferPeriod"] = @(self.isInIntroOfferPeriod);
    history[@"promotionalOfferId"] = self.promotionalOfferId;
    history[@"offerCodeRefName"] = self.offerCodeRefName;
    history[@"licenseCode"] = self.licenseCode;
    history[@"webOrderLineItemId"] = self.webOrderLineItemId;
    return history;
}

@end
