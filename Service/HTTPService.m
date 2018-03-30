//
//  HTTPService.m
//  CreatingNodeServer
//
//  Created by HAI DANG on 3/29/18.
//  Copyright © 2018 HAI DANG. All rights reserved.
//

#import "HTTPService.h"

#define URL_BASE "https://agile-stream-53575.herokuapp.com"
#define URL_TUTORIALS "/tutorials"

@implementation HTTPService

+ (id) instance {
    
    static HTTPService *shareInstance = nil;
    @synchronized(self) {
        if (shareInstance == nil)
            shareInstance = [[self alloc]init];
    }
    
    return shareInstance;
}

- (void)getTutorials:(nullable onComplete)completeionHandler {

    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%s%s",URL_BASE, URL_TUTORIALS]];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data != nil) {
            
            NSError *err;
            NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&err];
            
            if (err == nil) {
                
                completeionHandler(json, nil);
                
            } else {
                
                NSLog(@"Data is corrupt. Please try again !");
                
            }
        } else {
            
            NSLog(@"Error: %@", error.debugDescription);
            completeionHandler(nil,@"Problems connecting to the server !");
            
        }
        
        
    }]resume];
    
}


@end
