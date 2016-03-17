//
//  JDropDownMenuItem.h
//  JDropDownMenuDemo
//
//  Created by 蔡杰 on 16/3/17.
//  Copyright © 2016年 蔡杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDropDownMenuItemInterface.h"

@interface JDropDownMenuItem : UIControl<JDropDownMenuItemInterface>
/*!
 *  @brief index easy to find item from array
 */
@property(nonatomic,assign) NSUInteger index;
/*!
 *  @brief set default  is {5,5,5,5}
 */
@property(nonatomic,assign) UIEdgeInsets padding;

@end
