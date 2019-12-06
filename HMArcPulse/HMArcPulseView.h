//
//  HMArcPulseView.h
//  HMArcPulseView
//
//  Created by humiao on 2019/12/5.
//  Copyright © 2019 humiao. All rights reserved.
//

#import <UIKit/UIKit.h>
#define HEX_RGBA(rgbValue, alphas)   [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:alphas]
NS_ASSUME_NONNULL_BEGIN

/// 动画视图
@interface HMArcPulseView : UIView

/// 构造方法
/// @param frame 位置
/// @param width layer比之前宽多少，建议在5之内
/// @param duration 动画的时间长
- (instancetype)initWithFrame:(CGRect)frame widerThanTheOriginal:(CGFloat)width anmationDuration:(CGFloat)duration;
@end

NS_ASSUME_NONNULL_END
