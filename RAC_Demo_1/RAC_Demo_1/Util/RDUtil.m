//
//  RDUtil.m
//  RAC_Demo_1
//
//  Created by qjsios on 2017/2/23.
//  Copyright © 2017年 zhios. All rights reserved.
//

#import "RDUtil.h"

@implementation RDUtil

@end

@implementation UIColor (Util)

- (UIImage *)color2Image {
    
    return [self color2ImageSized:CGSizeMake(1.0f, 1.0f)];
}

- (UIImage *)color2ImageSized:(CGSize)size {
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [self CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
