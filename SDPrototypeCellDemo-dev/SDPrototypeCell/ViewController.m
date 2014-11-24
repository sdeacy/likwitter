//
//  ViewController.m
//  SDPrototypeCell
//
//  Created by shay deacy on 12/11/2014.
//  Copyright (c) 2014 shay deacy. All rights reserved.
//

#import "ViewController.h"
#import "ShayTableViewCell.h"
#import "AFNetworking/AFNetworking.h"
#import "SDTweet.h"



@interface ViewController () <UITableViewDataSource>
@property (nonatomic,strong) NSDictionary *networkTweets;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tweetsForDisplay = [[NSMutableArray alloc] init];

    SDTweet *dummyDataTweet = [[SDTweet alloc]init];                    //non network data to verify that cell display working
    [dummyDataTweet setUserName:@"shay deacy"];
    [dummyDataTweet setScreenName:@"shay"];
    [dummyDataTweet setTweetText:@"blah blah blah"];
    [dummyDataTweet setTweetText:@"this is a tweeeeeeeeet"];
    [dummyDataTweet setTweetPic:@"aah.jpg"];

    [_tweetsForDisplay addObject:dummyDataTweet];
    [self getdata];


    
}


//get json data from web, and create a SDTweet object with the parts of the data required

-(void)getdata{
    NSLog(@"getting data....");
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];
    
    [manager GET:@"https://raw.githubusercontent.com/zdavison/DIT.iOS1/master/Week4/sample.json"
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
         _networkTweets = (NSDictionary*)responseObject;
         NSLog(@"num tweets %lu",(unsigned long)[_networkTweets count]);
         
         _tweetsArray = _networkTweets[@"statuses"];
         
         
         NSLog(@"size of _tweetsArray array: %lu",(unsigned long)[_tweetsArray count]);
         
         
         for (id tweet in _tweetsArray) {
             SDTweet *aTweet = [[SDTweet alloc] init];
             NSString *tweetText = tweet[@"text"];
             
             NSDictionary *user = tweet[@"user"];
             NSString *userName = user[@"name"];
             NSString *screenName = user[@"screen_name"];
             NSString *profileImageName = user[@"profile_image_url"];
             
             [aTweet setUserName:userName];
             [aTweet setScreenName:screenName];
             [aTweet setTweetPic:profileImageName];
             [aTweet setTweetText:tweetText];
             
             [_tweetsForDisplay addObject:aTweet];
             NSLog(@"Adding....:%@",aTweet);
             [_tableView reloadData];

             
         }
         
         
     }
         failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
         UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:  nil];
         [alertView show];
     }];
    
    for (id sdTweet in _tweetsForDisplay) {
        NSLog(@"tweet for display : %@", sdTweet);
    }

    

    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_tweetsForDisplay count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ShayTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShayTableViewCellIdentifier"];
    SDTweet *sdTweet = _tweetsForDisplay[indexPath.row];
    NSLog(@"in cell for row , sdTweet: %@",sdTweet);
    cell.realNameLabel.text     = [sdTweet userName];
    cell.userNameLabel.text     = [sdTweet screenName];
    cell.tweetTextField.text    = [sdTweet tweetText];
    cell.tweetImageView.image   = [UIImage imageNamed:[sdTweet tweetPic]];
    
    return cell;
}

- (IBAction)leftNavButton:(id)sender {
    NSLog(@"left clicked");
}

- (IBAction)rightNavButton:(id)sender {
        NSLog(@"right clicked");
}
@end

