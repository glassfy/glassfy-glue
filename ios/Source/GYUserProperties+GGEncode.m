//
//  GYOfferings+Encode.m
//  Glassfy
//
//

#import "GYUserProperties+GGEncode.h"

@implementation GYUserProperties (GGEncode)

- (id)encodedDictionary
{
   
    NSMutableDictionary *property = [[NSMutableDictionary alloc]init];
    property[@"email"] = self.email;
    property[@"token"] = self.token;
    property[@"extra"] = self.extra;

    return property;
}

@end
