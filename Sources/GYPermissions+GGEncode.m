//
//  GYOfferings+Encode.m
//  Glassfy
//
//

#import "GYPermissions+GGEncode.h"
#import "GYPermission+GGEncode.h"

@implementation GYPermissions (GGEncode)

- (id)encodedDictionary
{
    NSMutableDictionary *permissions = [[NSMutableDictionary alloc]init];
    
    permissions[@"originalApplicationVersion"] = self.originalApplicationVersion;
    permissions[@"originalApplicationDate"] = [self.originalApplicationDate ISO8601Date];
    permissions[@"subscriberId"] = self.subscriberId;
    permissions[@"installationId"] = self.installationId;
    
    NSMutableArray *all = [[NSMutableArray alloc] init];
    for(GYPermission *permission in self.all) {
        [all addObject:[permission encodedDictionary]];
    }

    permissions[@"all"] = all;

    return permissions;
}

@end
