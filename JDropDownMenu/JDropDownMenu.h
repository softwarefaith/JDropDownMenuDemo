//
//  JDropDownMenu.h
//  JDropDownMenuDemo
//
//  Created by 蔡杰 on 16/3/17.
//  Copyright © 2016年 蔡杰. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,JDropDownMenuRoate){
    JDropDownMenuRoateNone,
    JDropDownMenuRoateLeft,
    JDropDownMenuRoateRight,
    JDropDownMenuRoateRandom
};


/*!
 *  @brief MenuItem's show type
 */
typedef NS_ENUM(NSUInteger,JDropDownMenuType) {
    /*!
     *  Normal
     */
    JDropDownMenuTypeNormal,
    /*!
     *  from up to down
     */
    JDropDownMenuTypeStack,
    /*!
     *  one menu show from left ,the menu show form right. recyle
     */
    JDropDownMenuTypeSlidingInBoth,
    /*!
     *  show menu item from left
     */
    JDropDownMenuTypeSlidingFromLeft,
    /*!
     *  show menu item from right
     */
    JDropDownMenuTypeSlidingFromRight
};

@interface JDropDownMenu : UIControl
/*!
 *  @brief header menu
 */
@property (nonatomic,strong) UIView             *dropDownHeaderMenu;

@property (nonatomic,copy)   NSArray            *dropDownMenuItems;

@property (nonatomic,assign) JDropDownMenuType  showType;

@property (nonatomic,assign) JDropDownMenuRoate rotateType;

@property (nonatomic,assign)  CGFloat           alphaOnFold;

@property (nonatomic,assign)  CGFloat           slideInoffect;

@property (nonatomic,assign)  CGFloat           gutterY;

@property (nonatomic,assign,getter=isExpanding)  BOOL              expanding;

@property (nonatomic,assign,getter=shouldFilpWhenToggleView)                     BOOL              flipWhenToggleView;

@property (nonatomic, assign) CGFloat animationDuration;

@property (nonatomic, assign) CGFloat itemAnimationDelay;

@property (nonatomic, assign) UIViewAnimationOptions animationOption;




-(void)reloadViews;




@end