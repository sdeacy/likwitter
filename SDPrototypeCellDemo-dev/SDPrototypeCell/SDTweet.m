//
//  SDTweet.m
//  SDPrototypeCell
//
//  Created by shay deacy on 20/11/2014.
//  Copyright (c) 2014 shay deacy. All rights reserved.
//

#import "SDTweet.h"

@implementation SDTweet

-(NSString*)description{
    return [NSString stringWithFormat:@"Username: %@ \nScreen Name: %@ \nText: %@\nTweet pic: %@",_userName,_screenName,_tweetText,_tweetPic];
    
}

-(void)setScreenName:(NSString *)screenName{
    _screenName = [NSString stringWithFormat:@"@%@",screenName];
}


@end
