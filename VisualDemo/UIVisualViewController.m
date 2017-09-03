//
//  UIVisualViewController.m
//  VisualDemo
//
//  Created by 今代科技 on 2017/9/1.
//  Copyright © 2017年 GZY. All rights reserved.
//

#import "UIVisualViewController.h"

@interface UIVisualViewController () {
    UIImageView * _imageView;
}

@end

@implementation UIVisualViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    _imageView.image = [UIImage imageNamed:@"image"];
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _imageView.layer.masksToBounds = YES;
    [self.view addSubview:_imageView];
    /**  UIBlurEffect 毛玻璃的样式(枚举)
     * UIBlurEffectStyleExtraLight, // 极度白
     * UIBlurEffectStyleLight,      // 浅色
     * UIBlurEffectStyleDark        // 深色
     */
    
    UIBlurEffect * effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView * effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = CGRectMake(0, 100, self.view.bounds.size.width, 200);
    [_imageView addSubview:effectView];
    
    [self vibrancyEffect];

}
- (void)vibrancyEffect {
    
    UIBlurEffect * blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVibrancyEffect * vibrancy = [UIVibrancyEffect effectForBlurEffect:blurEffect];
    UIVisualEffectView * effectView = [[UIVisualEffectView alloc] initWithEffect:vibrancy];
    
    
    UIView *redView = [[UIView alloc]init];
    redView.backgroundColor = [UIColor blueColor];
    
    [effectView.contentView addSubview:redView];
    effectView.frame = CGRectMake(0, 310,375, 300);
    redView.frame = effectView.bounds;
    [self.view addSubview:effectView];
    
    //去除蒙版
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [effectView removeFromSuperview];
    });
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
