//
//  myView.m
//
//  Copyright (c) 2015年 54贷客. All rights reserved.
//

#import "myView.h"

@implementation myView

+(UIButton *)creatButtonWithFrame:(CGRect)frame title:(NSString *)title tag:(NSInteger)tag tintColor:(UIColor *)tintColor backgroundColor:(UIColor *)backgroundColor{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    button.tag = tag;
    button.backgroundColor  = backgroundColor;
    button.tintColor=  tintColor;
    button.frame = frame;
    [button setTitleColor:tintColor forState:UIControlStateNormal];
    return button;
}

@end
