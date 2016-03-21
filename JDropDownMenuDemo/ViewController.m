//
//  ViewController.m
//  JDropDownMenuDemo
//
//  Created by 蔡杰 on 16/3/17.
//  Copyright © 2016年 蔡杰. All rights reserved.
//

#import "ViewController.h"

#import "JDropDownMenu.h"

@interface ViewController ()
@property(nonatomic,strong) JDropDownMenu *dropDownMenu;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.dropDownMenu = [[JDropDownMenu alloc] initWithFrame:CGRectMake(60, 100, 200, 45)];
    self.dropDownMenu.backgroundColor = [UIColor greenColor];
   // [self.dropDownMenu setFrame:CGRectMake(60, 100, 200, 45)];
    [self.view addSubview:self.dropDownMenu];
    
    self.dropDownMenu.dropDownHeaderMenu = ({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:@"Header Button" forState:UIControlStateNormal];
        button.frame = CGRectMake(0, 0, 200, 45);
        [button addTarget:self action:@selector(buttonTap:) forControlEvents:UIControlEventTouchUpInside];
        button;
    });

}

-(void)buttonTap:(id)sender{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
