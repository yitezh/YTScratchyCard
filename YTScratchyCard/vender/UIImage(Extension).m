//
//  UIImage(Extension).m
//  YTScratchyCard
//
//  Created by soma on 2019/5/7.
//  Copyright © 2019 yitezh. All rights reserved.
//

#import "UIImage(Extension).h"

@implementation UIImage(Extension)

-  (float)caculateClearPercent {
    CGFloat clearPixelCount=0;
    CGFloat totalPixelCount=0;
    CGImageRef cgimage = self.CGImage;
    size_t width = CGImageGetWidth(cgimage); // 图片宽度
    size_t height = CGImageGetHeight(cgimage); // 图片高度
    totalPixelCount = height * width;
    unsigned char *data = calloc(width * height * 4, sizeof(unsigned char));
    CGColorSpaceRef space = CGColorSpaceCreateDeviceGray(); // 创建纯色空间
    CGContextRef context =
    CGBitmapContextCreate(data,
                          width,
                          height,
                          8,
                          width,
                          space,
                          kCGImageAlphaOnly);
    CGContextDrawImage(context, CGRectMake(0, 0, width, height), cgimage);
    for (size_t i = 0; i < height; i++)
    {
        for (size_t j = 0; j < width; j++)
        {
            size_t pixelIndex = i * width  + j ;
            if(data[pixelIndex]==0){
                clearPixelCount++;
            }
        }
    }
    NSLog(@"%.2f",clearPixelCount/totalPixelCount);
    return clearPixelCount/totalPixelCount;
}




@end
