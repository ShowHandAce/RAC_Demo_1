//
//  RDUtil.h
//  RAC_Demo_1
//
//  Created by qjsios on 2017/2/23.
//  Copyright © 2017年 zhios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RDUtil : NSObject

@end

@interface UIColor (Util)

/// 颜色生成图片
///
/// 返回一个新的 UIImage 对象
- (UIImage *)color2Image;
- (UIImage *)color2ImageSized:(CGSize)size;

@end
