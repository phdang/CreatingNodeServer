//
//  HTTPService.m
//  CreatingNodeServer
//
//  Created by HAI DANG on 3/29/18.
//  Copyright © 2018 HAI DANG. All rights reserved.
//

#import "HTTPService.h"

@implementation HTTPService

+ (id) instance {
    
    static HTTPService *shareInstance = nil;
    @synchronized(self) {
        if (shareInstance == nil)
            shareInstance = [[self alloc]init];
    }
    
    return shareInstance;
}


@end
