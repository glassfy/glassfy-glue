//
//  GGUtility.h
//  Glassfy
//
//  Created by Marco Pifferi
//

#include "GGUtility.h"

@implementation NSDate (ISODate)
- (NSString *)ISO8601Date {
    NSISO8601DateFormatter *formatter = [[NSISO8601DateFormatter alloc]init];
    
    return [formatter stringFromDate:self];
}

@end

