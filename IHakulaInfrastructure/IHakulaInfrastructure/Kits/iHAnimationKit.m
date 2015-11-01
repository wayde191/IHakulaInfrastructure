//
//  iHAnimationKit.m
//  IHakulaInfrastructure
//
//  Created by Wei Wayde Sun on 11/1/15.
//  Copyright © 2015 ihakula. All rights reserved.
//

#import "iHAnimationKit.h"

@implementation iHAnimationKit

+ (void)animationAddToCart:(UIView *)containerView forGoods:(UIImageView *)goods fromStartPoint:(CGPoint)startPoint toEndPoint:(CGPoint)endPoint {
    
    goods.layer.masksToBounds = YES;
    goods.layer.cornerRadius = goods.frame.size.height / 2.0f;
    goods.layer.borderColor = [[UIColor blackColor]CGColor];
    goods.layer.borderWidth = 1;
    
    [containerView addSubview:goods];
    [containerView bringSubviewToFront:goods];
    
    // begin ---- apply position animation
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.calculationMode = kCAAnimationPaced;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.duration = 0.65;
    pathAnimation.delegate = self;
    
    
    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGPathMoveToPoint(curvedPath, NULL, startPoint.x, startPoint.y);
    CGPathAddCurveToPoint(curvedPath, NULL, endPoint.x, startPoint.y, endPoint.x, startPoint.y, endPoint.x, endPoint.y);
    pathAnimation.path = curvedPath;
    CGPathRelease(curvedPath);
    // end ---- apply position animation
    
    // apply transform animation
    CABasicAnimation *basic = [CABasicAnimation animationWithKeyPath:@"transform"];
    [basic setToValue:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.25, 0.25, 0.25)]];
    [basic setAutoreverses:NO];
    [basic setDuration:0.65];
    
    [goods.layer addAnimation:pathAnimation forKey:@"curveAnimation"];
    [goods.layer addAnimation:basic forKey:@"transform"];
    
    [goods performSelector:@selector(removeFromSuperview) withObject:nil afterDelay:0.65];
}

@end
