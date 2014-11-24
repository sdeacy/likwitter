//
//  ShayTableViewCell.h
//  SDPrototypeCell
//
//  Created by shay deacy on 12/11/2014.
//  Copyright (c) 2014 shay deacy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShayTableViewCell : UITableViewCell



@property (nonatomic, weak) IBOutlet UILabel *realNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *userNameLabel;
@property (nonatomic, weak) IBOutlet UIImageView *tweetImageView;
@property (nonatomic, weak) IBOutlet UITextField *tweetTextField;


@end
