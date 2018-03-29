//
//  ViewController.m
//  CreatingNodeServer
//
//  Created by HAI DANG on 3/29/18.
//  Copyright © 2018 HAI DANG. All rights reserved.
//

#import "ViewController.h"
#import "HTTPService.h"
#import "Video.h"
#import "VideoCell.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *videoList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self tableView].dataSource = self;
    
    [self tableView].delegate = self;
    
    self.videoList = [[NSArray alloc]init];
    
    [[HTTPService instance]getTutorials:^(NSArray * _Nullable dataArray, NSString * _Nullable errMessage) {
       
        if (dataArray) {
            
            //NSLog(@"Dictionary: %@", dataArray.debugDescription);
            
            NSMutableArray *arr = [[NSMutableArray alloc]init];
            
            for (NSDictionary *dict in dataArray) {
                
                Video *vid = [[Video alloc]init];
                
                vid.videoTitle = [dict objectForKey:@"title"];
                
                vid.videoDescription = [dict objectForKey:@"description"];
                
                vid.videoIframe = [dict objectForKey:@"iframe"];
                
                vid.thumbnailUrl = [dict objectForKey:@"thumbnail"];
                
                [arr addObject:vid];
                
            }
            
            self.videoList = arr;
            
            //update tableview and table data
            
            [self updateTableData];
            
            
        } else if (errMessage) {
            
            //Display err message
            
            
        }
        
    }];
     
}

-(void)updateTableData {
    dispatch_async(dispatch_get_main_queue(), ^{
        
        [[self tableView]reloadData];
    });
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    VideoCell *cell = (VideoCell*)[tableView dequeueReusableCellWithIdentifier:@"VideoCell"];
    
    if (!cell) {
        cell = [[VideoCell alloc]init];
    }
    
    return cell;
}

-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[self videoList]count];
}

@end
