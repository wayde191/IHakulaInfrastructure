//
//  NavigationBar.m
//  RongXin
//
//  Created by wdart on 13-12-16.
//  Copyright (c) 2013年 KSY. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import "UIViewController+NavTab.h"
#import "UIColor-Expanded.h"
#import "UIFont+iHAddition.h"
#import "iHCommonMacros.h"

///////////////////////

NSString * NTPathForBundleResource(NSString *relativePath) {
    NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
    return [resourcePath stringByAppendingPathComponent:relativePath];
}

///////////////////////

UIImage * NTLoadImageFromBundle(NSString *imageName) {
    NSString *relativePath = [NSString stringWithFormat:@"NavTab.bundle/images/%@", imageName];
    NSString *path  = NTPathForBundleResource(relativePath);
    NSData *data = [NSData dataWithContentsOfFile:path];
    return [UIImage imageWithData:data];
}


@implementation UIViewController(NavTab)



- (UIBarButtonItem *)_createBarButtonTitle:(NSString *)title target:(id)target action:(SEL)selector
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(15, 0, 50, 40);
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:(190)/255.0f green:(220)/255.0f blue:(250)/255.0f alpha:1] forState:UIControlStateHighlighted];
    btn.titleLabel.font = [UIFont regularSTHeitiFontOfSize:15];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [btn sizeToFit];
    UIBarButtonItem *btnItem=[[UIBarButtonItem alloc] initWithCustomView:btn];
    return btnItem;
}


- (UIBarButtonItem *)_createBarButton:(NSString *)image target:(id)target action:(SEL)selector
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    if (image) {
        [btn setBackgroundImage:[UIImage imageNamed:image ] forState:UIControlStateNormal];
        if ([image isEqualToString:@"navbar-add.png"]) {
            [btn setBackgroundImage:[UIImage imageNamed:@"navbar-add-press"] forState:UIControlStateHighlighted];
        }
    }
    [btn sizeToFit];
    btn.exclusiveTouch = TRUE;
    UIBarButtonItem *btnItem=[[UIBarButtonItem alloc] initWithCustomView:btn];
    return btnItem;
}


- (UIBarButtonItem *)_createBarButton:(NSString *)image target:(id)target action:(SEL)selector title:(NSString *)title
{
    UIFont *font = [UIFont systemFontOfSize:15];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *img = [UIImage imageNamed:image];
    btn.frame = CGRectMake(0, 0, img.size.width, img.size.height);
    [btn.titleLabel setFont:font];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:(190)/255.0f green:(220)/255.0f blue:(250)/255.0f alpha:1] forState:UIControlStateHighlighted];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundImage:img forState:UIControlStateNormal];
    UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
    return btnItem;
}




- (UIBarButtonItem *)_createBarButton:(NSString *)image target:(id)target action:(SEL)selector title:(NSString *)title font:(UIFont *)font
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    if (image) {
        [btn setBackgroundImage:[UIImage imageNamed:image ] forState:UIControlStateNormal];
    }
    [btn.titleLabel setFont:font];
    [btn sizeToFit];
    UIBarButtonItem *btnItem=[[UIBarButtonItem alloc] initWithCustomView:btn];
    return btnItem;
}



- (void)pop{
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)popToRoot{
    [self.navigationController popToRootViewControllerAnimated:YES];
}



- (void)rightItemTitle:(NSString *)title target:(id)target action:(SEL)selector{

    self.navigationItem.rightBarButtonItem = [self _createBarButtonTitle:title
                                                                target:target
                                                                action:selector];
}




- (void)rightItemImage:(NSString *)imageName target:(id)target action:(SEL)selector{
    
    self.navigationItem.rightBarButtonItem=[self _createBarButton:imageName
                                                           target:target
                                                           action:selector];
}


- (void)rightItemImage:(NSString *)imageName target:(id)target action:(SEL)selector title:(NSString *)title{
    self.navigationItem.rightBarButtonItem=[self _createBarButton:imageName
                                                           target:target
                                                           action:selector
                                                            title:title];
}

- (void)rightItemImage:(NSString *)imageName target:(id)target action:(SEL)selector title:(NSString *)title font:(UIFont *)font{
    self.navigationItem.leftBarButtonItem=[self _createBarButton:imageName
                                                          target:target
                                                          action:selector
                                                           title:title font:font];
}


- (void)leftItemTitle:(NSString *)title target:(id)target action:(SEL)selector{
    self.navigationItem.leftBarButtonItem=[self _createBarButtonTitle:title
                                                               target:target
                                                               action:selector];
}


- (void)leftActionItemImage:(NSString *)imageName target:(id)target action:(SEL)selector {
    UIView *leftItemView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 65, 44)];
    
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    btn.exclusiveTouch = TRUE;
    btn.frame = leftItemView.bounds;
    btn.contentEdgeInsets = UIEdgeInsetsMake(12, 18, 12, 18);
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [leftItemView addSubview:btn];
    
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:leftItemView];
}

- (void)leftItemImage:(NSString *)imageName target:(id)target action:(SEL)selector{
    UIView *leftItemView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 65, 44)];

    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    btn.exclusiveTouch = TRUE;
    btn.frame = leftItemView.bounds;
    btn.contentEdgeInsets = UIEdgeInsetsMake(11, 0, 11, 35);
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [leftItemView addSubview:btn];
    
    self.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithCustomView:leftItemView];
}

- (void)leftItemImage:(NSString *)imageName target:(id)target action:(SEL)selector title:(NSString *)title{
    self.navigationItem.leftBarButtonItem=[self _createBarButton:imageName
                                                          target:target
                                                          action:selector
                                                           title:title];
}

- (void)leftItemImage:(NSString *)imageName target:(id)target action:(SEL)selector title:(NSString *)title font:(UIFont *)font{
    self.navigationItem.leftBarButtonItem=[self _createBarButton:imageName
                                                          target:target
                                                          action:selector
                                                           title:title font:font];
}

- (void)leftItemBack:(NSString *)imageName title:(NSString *)title{
    
    self.navigationItem.leftBarButtonItem=[self _createBarButton:imageName
                                                          target:self
                                                          action:@selector(pop)
                                                           title:title
                                           ];
    
}


- (void)clearRightItem{
    self.navigationItem.rightBarButtonItem=nil;
}


- (void)clearLeftItem{
    self.navigationItem.leftBarButtonItem=nil;
}


- (void)navBarHidden:(BOOL)hide
{
    [self.navigationController setNavigationBarHidden:hide];
}


- (void) tabBarHidden:(BOOL) hidden{
    float cHeight=self.tabBarController.tabBar.frame.size.height;
    for(UIView *view in self.tabBarController.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]])
        {
            if (hidden) {
                [view setFrame:CGRectMake(view.frame.origin.x, 480, view.frame.size.width, view.frame.size.height)];
            } else {
                [view setFrame:CGRectMake(view.frame.origin.x, 480 - cHeight, view.frame.size.width, view.frame.size.height)];
            }
        }
        else
        {
            
            if (hidden) {
                [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, 480)];
            } else {
                [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, 480 - cHeight)];
            }
        }
    }
}


- (void) tabBarHiddenAnimated:(BOOL) hidden{
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.35];
    float cHeight=self.tabBarController.tabBar.frame.size.height;
    for(UIView *view in self.tabBarController.view.subviews)
    {
        if([view isKindOfClass:[UITabBar class]])
        {
            if (hidden) {
                [view setFrame:CGRectMake(view.frame.origin.x, 480, view.frame.size.width, view.frame.size.height)];
            } else {
                [view setFrame:CGRectMake(view.frame.origin.x, 480 - cHeight, view.frame.size.width, view.frame.size.height)];
            }
        }
        else
        {
            if (hidden) {
                [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, 480)];
            } else {
                [view setFrame:CGRectMake(view.frame.origin.x, view.frame.origin.y, view.frame.size.width, 480 - cHeight)];
            }
        }
    }
    [UIView commitAnimations];
    
}


@end


@implementation UINavigationBar (LazyNavigationBar)

+ (Class)class {
    return NSClassFromString(@"CustomNavigationBar");
}

@end

@implementation UINavigationItem (NaviItemCategory)

- (void)setLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem{
    
    UIBarButtonItem *spaceButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceButtonItem.width = -15;
    if (IOS7_OR_LATER) {
        if (leftBarButtonItem){
            [self setLeftBarButtonItems:@[spaceButtonItem, leftBarButtonItem]];
        }  else {
            [self setLeftBarButtonItems:@[spaceButtonItem]];
        }
    }else {
        spaceButtonItem.width = -5;
        if (leftBarButtonItem){
            [self setLeftBarButtonItems:@[spaceButtonItem, leftBarButtonItem]];
        }  else {
            [self setLeftBarButtonItems:@[spaceButtonItem]];
        }
    }
    
}

- (void)setRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem{
    
    UIBarButtonItem *spaceButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    spaceButtonItem.width = -5;
    if (IOS7_OR_LATER) {
        if (rightBarButtonItem) {
            [self setRightBarButtonItems:@[spaceButtonItem, rightBarButtonItem]];
        }else {
            [self setRightBarButtonItems:@[spaceButtonItem]];
        }
    }else {
        spaceButtonItem.width = 5;
        if (rightBarButtonItem) {
            [self setRightBarButtonItems:@[spaceButtonItem, rightBarButtonItem]];
        }else {
            [self setRightBarButtonItems:@[spaceButtonItem]];
        }
    }
}

@end

@implementation CustomNavigationBar


@end






@implementation UITabBarController(NavTabRoot)


- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item{
    if([self.tabBar viewWithTag:9999]!=nil){
        [UIView animateWithDuration:0.5 animations:^{
            NSArray *array=tabBar.items;
            float x = self.tabBar.frame.size.width/[array count]*item.tag;
            [[self.tabBar viewWithTag:9999] setFrame:CGRectMake(x, 0, tabBar.frame.size.width/[array count], tabBar.frame.size.height)];
            
        }];
    }else if([self.tabBar viewWithTag:1000]!=nil){
        NSArray *array=tabBar.items;
        for(int i=0;i<[array count];i++){
            [[self.tabBar viewWithTag:i+10000] setHidden:NO];
            [[self.tabBar viewWithTag:i+1000] setHidden:YES];
        }
        [[self.tabBar viewWithTag:item.tag+10000] setHidden:YES];
        [[self.tabBar viewWithTag:item.tag+1000] setHidden:NO];
        
    }
}

- (void)setIndicatorImage:(UIImage *)indicatorImage animated:(BOOL)animated{
    if(animated==YES){
        [self.tabBar setSelectionIndicatorImage:NTLoadImageFromBundle(@"null.png")];
        NSArray *array = self.tabBar.items;
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.tabBar.frame.size.width/[array count], self.tabBar.frame.size.height)];
        imageView.image=indicatorImage;
        imageView.tag=9999;
        [self.tabBar addSubview:imageView];
    }else{
        [self.tabBar setSelectionIndicatorImage:indicatorImage];
    }
}


- (void) setSelectColor:(UIColor *)selectColor bgColor:(UIColor *)bgColor{
//    [self.tabBar setSelectedImageTintColor:selectColor];
    [self.tabBar setTintColor:bgColor];
}


- (void) setBackgroundWith:(UIImage *)image{
    self.tabBar.backgroundImage=image;
}

- (void) setNViewControllers:(NSArray*)controllers{
    NSMutableArray *nArray=[NSMutableArray  arrayWithCapacity:10];
    for(int i=0;i<[controllers count];i++){
        UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:[controllers objectAtIndex:i]];
        [nArray addObject:nav];
    }
    [self setViewControllers:nArray];
}

- (void) setTitles:(NSArray *)titles imageNames:(NSArray *)imageNames{
    BOOL setTitle=YES;
    if(titles==nil||[titles count]!=[imageNames count]){
        setTitle=NO;
    }
    NSMutableArray *array=[NSMutableArray arrayWithCapacity:10];
    for(int i=0;i<[imageNames count];i++){
        UITabBarItem *item=nil;
        if(setTitle){
            item = [[UITabBarItem alloc] initWithTitle: [titles objectAtIndex:i] image:[UIImage imageNamed: [imageNames objectAtIndex:i]] tag: i];
            
        }else{
            item = [[UITabBarItem alloc] initWithTitle: nil image:[UIImage imageNamed: [imageNames objectAtIndex:i]]  tag: i];
        }
        [array addObject:item];
    }
    if([self.viewControllers count]!=[array count]){
        return;
    }
    for(int i=0;i<[self.viewControllers count];i++){
        [[self.viewControllers objectAtIndex:i] setTabBarItem:[array objectAtIndex:i]];
    }
}

- (void) setSelectImageNames:(NSArray *)selectImageNames unSelectImageNames:(NSArray *)unSelectImageNames {
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:10];
    for(int i = 0; i < [selectImageNames count]; i++){
        
//        UITabBarItem* item=[[UITabBarItem alloc]init];
//        item.tag=i;
//        [item setFinishedSelectedImage:[UIImage imageNamed: [selectImageNames objectAtIndex:i]] withFinishedUnselectedImage:[UIImage imageNamed: [unSelectImageNames objectAtIndex:i]]];
        
        UITabBarItem* item = nil;
        item = [item initWithTitle:@""
                      image:[UIImage imageNamed: [unSelectImageNames objectAtIndex:i]]
              selectedImage:[UIImage imageNamed: [selectImageNames objectAtIndex:i]]];
        item.tag = i;
        [array addObject:item];
    }
    if([self.viewControllers count]!=[array count]){
        return;
    }
    for(int i=0;i<[self.viewControllers count];i++){
        [[self.viewControllers objectAtIndex:i] setTabBarItem:[array objectAtIndex:i]];
    }
}

- (void) setMDSelectImageNames:(NSArray *)selectImageNames unSelectImageNames:(NSArray *)unSelectImageNames selectIndex:(int)index{
    
    NSMutableArray *array=[NSMutableArray arrayWithCapacity:10];
    
    CGRect frame=self.tabBar.frame;
    float cWidth=frame.size.width/[self.viewControllers count];
    float cHeight=frame.size.height;
    
    for(int i=0;i<[self.viewControllers count];i++){
        UITabBarItem* item= item = [[UITabBarItem alloc] initWithTitle: @" "  image:NTLoadImageFromBundle(@"null.png") tag: i];
        [array addObject:item];
        UIImageView *selImageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:[selectImageNames objectAtIndex:i]]];
        selImageView.frame=CGRectMake(cWidth*i, 0, cWidth, cHeight);
        selImageView.tag=i+1000;
        if(i==index){
            selImageView.hidden=NO;
        }else{
            selImageView.hidden=YES;
        }
        [self.tabBar addSubview:selImageView];
        UIImageView *unSelImageView=[[UIImageView alloc] initWithImage:[UIImage imageNamed:[unSelectImageNames objectAtIndex:i]]];
        unSelImageView.frame=CGRectMake(cWidth*i, 0, cWidth, cHeight);
        unSelImageView.tag=i+10000;
        if(i==index){
            unSelImageView.hidden=YES;
        }else{
            unSelImageView.hidden=NO;
        }
        [self.tabBar addSubview:unSelImageView];
    }
    if([self.viewControllers count]!=[array count]){
        return;
    }
    for(int i=0;i<[self.viewControllers count];i++){
        [[self.viewControllers objectAtIndex:i] setTabBarItem:[array objectAtIndex:i]];
    }
    self.selectedIndex=index;
}


@end
