//
//  GYCodableProtocol.h
//  Glassfy
//
//  Created by Luca Garbolino on 22/12/20.
//

#import <Foundation/Foundation.h>
#import "GGUtility.h"

NS_ASSUME_NONNULL_BEGIN

@protocol GGDecodeProtocol <NSObject>
- (instancetype _Nullable)initWithObject:(NSDictionary *)obj error:(NSError ** _Nullable)error;
@end

@protocol GGEncodeProtocol <NSObject>
- (id)encodedDictionary;
@end

NS_ASSUME_NONNULL_END
