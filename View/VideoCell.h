//
//  VideoCell.h
//  CreatingNodeServer
//
//  Created by HAI DANG on 3/29/18.
//  Copyright © 2018 HAI DANG. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Video;
@interface VideoCell : UITableViewCell
-(void) updateUI: (nonnull Video*)video;

@end
