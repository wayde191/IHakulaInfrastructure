//
//  UIFont+iHAddition.h
//  iHakula
//
//  Created by Wayde Sun on 1/17/13.
//  Copyright (c) 2013 iHakula. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (iHAddition)

- (CGFloat)ihLineHeight;

+ (UIFont*)boldSTHeitiFontOfSize:(CGFloat)size;
+ (UIFont*)regularSTHeitiFontOfSize:(CGFloat)size;
+ (UIFont*)thinSTHeitiFontOfSize:(CGFloat)size;
+ (UIFont*)ultraLightSTHeitiFontOfSize:(CGFloat)size;

@end
