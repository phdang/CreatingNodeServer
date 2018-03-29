//
//  Video.h
//  CreatingNodeServer
//
//  Created by HAI DANG on 3/29/18.
//  Copyright © 2018 HAI DANG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Video : NSObject
@property (nonatomic, strong) NSString *videoTitle;
@property (nonatomic, strong) NSString *videoDescription;
@property (nonatomic, strong) NSString *videoIframe;
@property (nonatomic, strong) NSString *thumbnailUrl;

@end
