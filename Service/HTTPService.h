//
//  HTTPService.h
//  CreatingNodeServer
//
//  Created by HAI DANG on 3/29/18.
//  Copyright © 2018 HAI DANG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPService : NSObject
typedef void (^onComplete)(NSArray * __nullable dataArray, NSString * __nullable errMessage);


+ (id _Nullable ) instance;
- (void)getTutorials:(nullable onComplete)completeionHandler;

@end
