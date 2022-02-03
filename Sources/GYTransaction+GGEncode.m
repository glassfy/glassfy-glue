//
//  GYOfferings+Encode.m
//  Glassfy
//
//

#import "GYTransaction+GGEncode.h"
#import "GYPermissions+GGEncode.h"

@implementation GYTransaction (GGEncode)

- (id)encodedDictionary
{
   
    NSMutableDictionary *transaction = [[NSMutableDictionary alloc]init];

    transaction[@"productIdentifier"] = self.productIdentifier;
    transaction[@"receiptValidated"] = @(self.receiptValidated);
    transaction[@"permissions"] = [self.permissions encodedDictionary];

    
    return transaction;
}

@end
