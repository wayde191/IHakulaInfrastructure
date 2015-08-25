//
//  UIFont+iHAddition.m
//  iHakula
//
//  Created by Wayde Sun on 1/17/13.
//  Copyright (c) 2013 iHakula. All rights reserved.
//

#import "UIFont+iHAddition.h"

@implementation UIFont (iHAddition)

- (CGFloat)ihLineHeight {
    return (self.ascender - self.descender) + 1;
}

+ (UIFont*)regularSTHeitiFontOfSize:(CGFloat)size {
    UIFont *font = [UIFont fontWithName:@"NotoSansHans-Regular" size:size];
    return font;
}

+ (UIFont*)boldSTHeitiFontOfSize:(CGFloat)size {
    UIFont *font = [UIFont fontWithName:@"NotoSansHans-Bold" size:size];
    return font;
}

+ (UIFont*)thinSTHeitiFontOfSize:(CGFloat)size {
    UIFont *font = [UIFont fontWithName:@"NotoSansHans-DemiLight" size:size];
    return font;
}

+ (UIFont*)ultraLightSTHeitiFontOfSize:(CGFloat)size {
    UIFont *font = [UIFont fontWithName:@"NotoSansHans-Light" size:size];
    return font;
}

@end
