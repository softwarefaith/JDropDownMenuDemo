//
//  JDropDownMenuItem.m
//  JDropDownMenuDemo
//
//  Created by 蔡杰 on 16/3/17.
//  Copyright © 2016年 蔡杰. All rights reserved.
//

#import "JDropDownMenuItem.h"

const CGFloat kDefaultPadding = 5.0f;

@implementation JDropDownMenuItem


#pragma mark --Setter and  Getter
-(UIEdgeInsets)padding{
    return UIEdgeInsetsMake(kDefaultPadding, kDefaultPadding, kDefaultPadding, kDefaultPadding);
}
#pragma mark --protocol
-(void)updateLayout{
    
}

@end
