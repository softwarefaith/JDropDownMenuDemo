//
//  JDropDownMenu.m
//  JDropDownMenuDemo
//
//  Created by 蔡杰 on 16/3/17.
//  Copyright © 2016年 蔡杰. All rights reserved.
//

#import "JDropDownMenu.h"
#import "JDropDownMenuItem.h"

@interface JDropDownMenu()

@property (nonatomic,assign) CGFloat offsetX;

@property (nonatomic,assign) CGSize  itemSize;

@end

@implementation JDropDownMenu


#pragma mark --Setter and Getter
-(void)setExpanding:(BOOL)expanding{
    _expanding = expanding;
    
    [self updateView];
}

#pragma mark --Public method
-(void)reloadViews{
    
    //clear subViews
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
    
    self.itemSize = self.frame.size;
    
    // clear all subviews
    for (UIView *view in [self subviews]) {
        [view removeFromSuperview];
    }
    
    if (self.rotateType == JDropDownMenuRoateLeft) {
        self.offsetX = self.dropDownMenuItems.count * self.dropDownMenuItems.count * self.itemSize.height / 28;
    }
    
    for (int i = (int)[self.dropDownMenuItems count]; i >= 0; i--) {
        JDropDownMenuItem *menuItem = self.dropDownMenuItems[i];
        menuItem.index = i;
        [self setUpFoldItem:menuItem];
        [self addSubview:menuItem];
    }
    
    if (self.dropDownHeaderMenu) {
        [self addSubview:self.dropDownHeaderMenu];
    }
    
}

-(CGFloat)alphaOnFold{
    if (_alphaOnFold != -1) {
        return _alphaOnFold;
    }
    if ([self isSlidingInType]) {
        return 0.0;
    }
    return 1.0;
}

#pragma mark -Private method  helper

-(void)updateView{
    
    if (self.shouldFilpWhenToggleView) {
        [self flipMenuHeaderView];
    }
    if (self.isExpanding) {
        [self expandView];
    } else {
        [self foldView];
    }
}

-(void)flipMenuHeaderView{
    
    CABasicAnimation *topAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    topAnimation.autoreverses = YES;
    topAnimation.duration = 0.2;
    topAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DPerspect(CATransform3DMakeRotation(M_PI_2/3*2, 1, 0, 0), CGPointMake(0, 0), 400)];
    [self.dropDownHeaderMenu.layer addAnimation:topAnimation forKey:nil];
}

-(void)foldView{
    
}
-(void)expandView{
    
    for (int  i = (int)(self.dropDownMenuItems.count - 1); i >= 0; i--) {
        JDropDownMenuItem *menuItem = self.dropDownMenuItems[i];
        CGFloat delay = 0;
        if (self.shouldFilpWhenToggleView) {
            delay += 0.1;
        }
        if ([self isSlidingInType]) {
            delay += self.itemAnimationDelay * i;
        }else{
            delay += self.itemAnimationDelay * (self.dropDownMenuItems.count - 1 - i);
        }
        
        [UIView animateWithDuration:self.animationDuration * 2 delay:delay usingSpringWithDamping:0.5 initialSpringVelocity:2.0 options:self.animationOption animations:^{
            [self setUpExpandItem:menuItem];
        } completion:^(BOOL finished) {
            [self updateSelfFrame];
        }];
    }
}



#pragma mark --- frame



- (BOOL)isSlidingInType{
    switch (self.showType) {
        case JDropDownMenuTypeNormal:
        case JDropDownMenuTypeStack:
            return NO;
        case JDropDownMenuTypeSlidingInBoth:
            case JDropDownMenuTypeSlidingFromLeft:
            case JDropDownMenuTypeSlidingFromRight:
            return YES;
    }
    
    return NO;
}

-(void)setUpFoldItem:(JDropDownMenuItem*)item{
    
    item.transform = CGAffineTransformMakeRotation(0.0f);
    [item setFrame:[self frameOnFoldForItemAtIndex:item.index]];
    item.alpha = self.alphaOnFold;
}
-(CGRect)frameOnFoldForItemAtIndex:(NSInteger)index{
    
    CGFloat x = self.offsetX;
    CGFloat y = 0;
    CGFloat width = self.itemSize.width;
    CGFloat height = self.itemSize.height;
    
    NSInteger count = index >= 2 ? 2 :index;
    
    CGFloat slidingInOffect = self.slideInoffect != -1 ? self.slideInoffect : self.itemSize.width / 3;
    
    
    switch (self.showType) {
        case JDropDownMenuTypeNormal:{
            
            break;
        }
        case JDropDownMenuTypeStack:{
            x += count * 2;
            y = (count + 1) *3;
            width -= count * 4;
            break;
        }
        case JDropDownMenuTypeSlidingInBoth:{
            if (index % 2 != 0) slidingInOffect = -slidingInOffect;
            x = slidingInOffect;
            y = (index + 1) * (height + self.gutterY);
            break;
        }
        case JDropDownMenuTypeSlidingFromLeft:{
            x =  -slidingInOffect;
            y = (index + 1) * (height + self.gutterY);
            break;
        }
        case JDropDownMenuTypeSlidingFromRight:{
            x = slidingInOffect;
            y = (index + 1) * (height + self.gutterY);
            break;
        }
        default:
            break;
    }
    return CGRectMake(x, y, width, height);
}

- (void)setUpExpandItem:(JDropDownMenuItem*)item
{
    // set alpha for slidingIn
    item.alpha = 1.0;
    
    // set frame (MUST before rotation reset)
   // [item setFrame:[self frameOnExpandForItemAtIndex:item.index]];
    
    // set rotate
   // item.transform = [self transformOnExpandForItemAtIndex:item.index];
}


- (void)updateSelfFrame{
    
}


#pragma mark -Aniamtion
CATransform3D CATransform3DMakePerspective(CGPoint center, float disZ)
{
    CATransform3D transToCenter = CATransform3DMakeTranslation(-center.x, -center.y, 0);
    CATransform3D transBack = CATransform3DMakeTranslation(center.x, center.y, 0);
    CATransform3D scale = CATransform3DIdentity;
    scale.m34 = -1.0f/disZ;
    return CATransform3DConcat(CATransform3DConcat(transToCenter, scale), transBack);
}

CATransform3D CATransform3DPerspect(CATransform3D t, CGPoint center, float disZ)
{
    return CATransform3DConcat(t, CATransform3DMakePerspective(center, disZ));
}



@end
