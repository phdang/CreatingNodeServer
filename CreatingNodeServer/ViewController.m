//
//  ViewController.m
//  CreatingNodeServer
//
//  Created by HAI DANG on 3/29/18.
//  Copyright © 2018 HAI DANG. All rights reserved.
//

#import "ViewController.h"
#import "HTTPService.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[HTTPService instance]getTutorials:^(NSDictionary * _Nullable dataDict, NSString * _Nullable errMessage) {
       
        if (dataDict) {
            NSLog(@"Dictionary: %@", dataDict.debugDescription);
        } else if (errMessage) {
            
            //Display err message
            
            
        }
        
    }];
     
}

@end
