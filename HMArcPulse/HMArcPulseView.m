//
//  HMArcPulseView.m
//  HMArcPulseView
//
//  Created by humiao on 2019/12/5.
//  Copyright © 2019 humiao. All rights reserved.
//

#import "HMArcPulseView.h"

@implementation HMArcPulseView

- (instancetype)initWithFrame:(CGRect)frame widerThanTheOriginal:(CGFloat)width anmationDuration:(CGFloat)duration {
    
    if (self = [super initWithFrame:frame]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        [self setuplayerWiderThanTheOriginal:width anmationDuration:duration ];
    }
    return self;
}

- (void)setuplayerWiderThanTheOriginal:(CGFloat)width anmationDuration:(CGFloat)duration  {
    
    NSArray *layerWidths = @[@"25",@"10",@"5"];
    NSArray *layerColors = @[@0.2,@0.3,@1];
    
    CGFloat defaultWidth = self.bounds.size.width-20;
    
    for (int i = 0;  i < layerWidths.count; i ++) {
        
        defaultWidth = defaultWidth-[layerWidths[i] intValue]-(i==2?[layerWidths[i-1]intValue]:0);
        UIBezierPath *circle = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, defaultWidth, defaultWidth)];
        CAShapeLayer *bgLayer = [CAShapeLayer layer];
        bgLayer.frame = CGRectMake(0, 0, defaultWidth, defaultWidth);//设置Frame
        bgLayer.position = self.center;//居中显示
        bgLayer.fillColor = [UIColor clearColor].CGColor;//填充颜色=透明色
        bgLayer.lineWidth = [layerWidths[i] intValue];//线条大小
        bgLayer.strokeColor = HEX_RGBA(0x7871DC,[layerColors[i] floatValue] ).CGColor;//线条颜色
        bgLayer.strokeStart = 0.f;//路径开始位置
        bgLayer.strokeEnd = 1.f;//路径结束位置
        bgLayer.path = circle.CGPath;//设置bgLayer的绘制路径为circle的路径
        [self.layer addSublayer:bgLayer];//添加到屏幕上
        if (i == 2)continue;
        CAAnimationGroup *group = [self layerAnimation:bgLayer withIndex:i widerThanTheOriginal:width anmationDuration:duration];
        [bgLayer addAnimation:group forKey:nil];
    }
}

- (CAAnimationGroup *)layerAnimation:(CAShapeLayer *)layer withIndex:(int)index widerThanTheOriginal:(CGFloat)width anmationDuration:(CGFloat)duration {
    CAAnimationGroup *animations = [CAAnimationGroup animation];
    if (width<0 || duration<0)return animations;
    animations.beginTime = CACurrentMediaTime();
    animations.duration = duration?:3;
    animations.repeatCount = MAXFLOAT;
    animations.removedOnCompletion = NO;
    
    CAKeyframeAnimation *lineAnimation = [CAKeyframeAnimation animation];
    lineAnimation.keyPath = @"lineWidth";
    NSMutableArray *temMutArr = @[].mutableCopy;
    width = width>5?5:width;
    int j = 0;
    for (int i = 0; i < 2*width+1; i ++) {
        if (index == 1) {
           NSNumber *number = [NSNumber numberWithInt:10+(i<width?j++:j--)];
           [temMutArr addObject:number]; // 计算内部圆弧
        } else {
            NSNumber *number = [NSNumber numberWithInt:25+(i<width?(j++)*2:(j--)*2)];
            [temMutArr addObject:number]; // 计算外部圆弧
        }
    }
    NSLog(@"%@",temMutArr);
    lineAnimation.values = temMutArr;
    animations.animations = @[lineAnimation];
    return animations;
}

@end
