//
//  ViewController.h
//  SDPrototypeCell
//
//  Created by shay deacy on 12/11/2014.
//  Copyright (c) 2014 shay deacy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property NSArray *tweets;
@property NSArray *tweetsArray;
@property NSMutableArray *tweetsForDisplay;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)leftNavButton:(id)sender;
- (IBAction)rightNavButton:(id)sender;

@end
