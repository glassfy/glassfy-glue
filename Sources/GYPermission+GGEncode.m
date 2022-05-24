//
//  GYOfferings+Encode.m
//  Glassfy
//
//

#import "GYPermission+GGEncode.h"
#import "GYSkuBase+GGEncode.h"

@implementation GYPermission (GGEncode)

- (id)encodedDictionary
{
    NSMutableDictionary *permission = [[NSMutableDictionary alloc]init];
    
    permission[@"permissionId"] = self.permissionId;
    permission[@"entitlement"] = @(self.entitlement);
    permission[@"isValid"] = @(self.isValid);
    permission[@"expireDate"] = @([self.expireDate timeIntervalSince1970]);
    NSMutableArray *accountableSkus = [[NSMutableArray alloc] init];
    for(GYSkuBase *sku in self.accountableSkus) {
        [accountableSkus addObject:[sku encodedDictionary]];
    }
    permission[@"accountableSkus"] = accountableSkus;
    return permission;
}

@end
