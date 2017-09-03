//
//  CoreImageVc.m
//  VisualDemo
//
//  Created by 今代科技 on 2017/9/1.
//  Copyright © 2017年 GZY. All rights reserved.
//

#import "CoreImageVc.h"

@interface CoreImageVc () {
    UIImageView *_imageView;
}

@end

@implementation CoreImageVc

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    _imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    _imageView.image = [UIImage imageNamed:@"image"];
    _imageView.contentMode = UIViewContentModeScaleAspectFill;
    _imageView.layer.masksToBounds = YES;
    [self.view addSubview:_imageView];
    
    _imageView.image = [self coreBlurImage:_imageView.image withBlurNumber:100];
    
    
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        //获取CIImage
        CIImage * ciIamge = [CIImage imageWithCGImage:_imageView.image.CGImage];
        //创建滤镜对象CIMotionBlur
        CIFilter * filter = [CIFilter filterWithName:@"CIMotionBlur" keysAndValues:kCIInputImageKey,ciIamge, nil];
        //获取绘制上下文
        CIContext * context = [CIContext contextWithOptions:nil];
        //渲染并输出CIImage
        CIImage * outImage = [filter outputImage];
        CGImageRef ref = [context createCGImage:outImage fromRect:[outImage extent]];
        //转换成UIimage
        _imageView.image =[UIImage imageWithCGImage:ref];
        // 释放CGImage句柄
        CGImageRelease(ref);
    });
  
}
- (UIImage *)coreBlurImage:(UIImage *)image withBlurNumber:(CGFloat)blur{
    //获取绘制上下文
    CIContext *context = [CIContext contextWithOptions:nil];
    //获取CIImage
    CIImage *inputImage = [CIImage imageWithCGImage:image.CGImage];
    //创建滤镜对象 CIGaussianBlur:高斯模糊
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    //改变模糊效果值
    [filter setValue:@10.0f forKey:@"inputRadius"];
    //模糊图片渲染并输出CIImage

    CIImage *result = [filter valueForKey:kCIOutputImageKey];
    
    CGImageRef outImage = [context createCGImage:result fromRect:[result extent]];
    UIImage *blurImage = [UIImage imageWithCGImage:outImage];
    CGImageRelease(outImage);
    return blurImage;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
