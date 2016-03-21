//
//  JDropDownMenuText.m
//  JDropDownMenuDemo
//
//  Created by 蔡杰 on 16/3/21.
//  Copyright © 2016年 蔡杰. All rights reserved.
//

#import "JDropDownMenuText.h"

@interface JDropDownMenuText ()

@property (nonatomic,strong) UILabel *textLabel;

@end

@implementation JDropDownMenuText

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        [self configSubViews];
    }
    return self;
}

-(void)configSubViews{
    
    self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 100, 50)];
    
    [self addSubview:self.textLabel];
}

-(void)setMenuText:(NSString *)menuText{
    _menuText = menuText;
    self.textLabel.text = menuText;
}

@end
