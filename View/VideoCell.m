//
//  VideoCell.m
//  CreatingNodeServer
//
//  Created by HAI DANG on 3/29/18.
//  Copyright © 2018 HAI DANG. All rights reserved.
//

#import "VideoCell.h"
#import "Video.h"

@interface VideoCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLbl;

@property (weak, nonatomic) IBOutlet UILabel *descLbl;
@property (weak, nonatomic) IBOutlet UIImageView *thumbImg;

@property (weak, nonatomic) IBOutlet UIView *cellView;


@end

@implementation VideoCell

- (void)awakeFromNib {
    
    [super awakeFromNib];
    
    self.titleLbl.numberOfLines = 0;
    
    [self.titleLbl sizeToFit];
    
    self.descLbl.numberOfLines = 0;
    
    [self.descLbl sizeToFit];
    
    self.layer.cornerRadius = 2.0;
    
    self.layer.shadowColor = [UIColor colorWithRed:157.0/255.0 green:157.0/255.0 blue:157.0/255.0 alpha:0.8].CGColor ;
    
    self.layer.shadowOpacity = 0.8;
    
    self.layer.shadowRadius = 5.0;
    
    self.layer.shadowOffset = CGSizeMake(0.0, 2.0);
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) updateUI:(nonnull Video *)video {
    
    self.titleLbl.text = video.videoTitle;
    
    self.descLbl.text = video.videoDescription;
    
    UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:video.thumbnailUrl]]];
    
    self.thumbImg.image = image;
    
}

@end
