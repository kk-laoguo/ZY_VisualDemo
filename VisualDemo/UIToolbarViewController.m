//
//  UIToolbarViewController.m
//  VisualDemo
//
//  Created by 今代科技 on 2017/9/1.
//  Copyright © 2017年 GZY. All rights reserved.
//

#import "UIToolbarViewController.h"

@interface UIToolbarViewController ()

@end

@implementation UIToolbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.image = [UIImage imageNamed:@"image"];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.layer.masksToBounds = YES;
    [self.view addSubview:imageView];
    
    /** UIBarStyle 毛玻璃的样式(枚举)
     *      UIBarStyleDefault          = 0,     // 浅色
     *      UIBarStyleBlack            = 1,     // 深色
     *      UIBarStyleBlackOpaque      = 1,     // Deprecated. Use UIBarStyleBlack
     *      UIBarStyleBlackTranslucent = 2,     // Deprecated. Use UIBarStyleBlack and set the translucent property to YES
     */
    UIToolbar * toolbar = [[UIToolbar alloc] initWithFrame:imageView.bounds];
    toolbar.barStyle = UIBarStyleBlack;
    toolbar.alpha = 0.9;
    [imageView addSubview:toolbar];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}



@end
