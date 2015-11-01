//
//  iHAnimationKit.h
//  IHakulaInfrastructure
//
//  Created by Wei Wayde Sun on 11/1/15.
//  Copyright © 2015 ihakula. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface iHAnimationKit : NSObject

+ (void)animationAddToCart:(UIView *)containerView forGoods:(UIImageView *)goods fromStartPoint:(CGPoint)startPoint toEndPoint:(CGPoint)endPoint;

@end
