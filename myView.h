//
//  myView.h
//
//  Copyright (c) 2015年 54贷客. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface myView : NSObject
+(UIButton *)creatButtonWithFrame:(CGRect)frame title:(NSString *)title tag:(NSInteger)tag tintColor:(UIColor *)tintColor backgroundColor:(UIColor *)backgroundColor;
@end
