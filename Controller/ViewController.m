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
#import "VideoVC.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *videoList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self tableView].dataSource = self;
    
    [self tableView].delegate = self;
    
    [self tableView].rowHeight = 100.0;
    
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
    
    cell.layer.cornerRadius = 2.0;
    
    cell.layer.shadowColor = [UIColor colorWithRed:157.0/255.0 green:157.0/255.0 blue:157.0/255.0 alpha:0.8].CGColor ;
    
    cell.layer.shadowOpacity = 0.8;
    
    cell.layer.shadowRadius = 5.0;
    
    cell.layer.shadowOffset = CGSizeMake(0.0, 2.0);
    
    return cell;
}

-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Video *video = [self.videoList objectAtIndex:indexPath.row];
    
    VideoCell *vidCell = (VideoCell*)cell;
    
    [vidCell updateUI:video];
}


-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Video *video = [self.videoList objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"goToVideoVC" sender:video];
    
    
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    VideoVC *vc = (VideoVC*) segue.destinationViewController;
    
    vc.video = (Video*) sender;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [[self videoList]count];
}

@end
