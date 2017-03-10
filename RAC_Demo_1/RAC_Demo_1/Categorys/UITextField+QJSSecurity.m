//
//  UITextField+QJSSecurity.m
//  RAC_Demo_1
//
//  Created by qjsios on 2017/3/3.
//  Copyright © 2017年 zhios. All rights reserved.
//

#import "UITextField+QJSSecurity.h"

#import <objc/runtime.h>

@implementation UITextField (QJSSecurity)

/**
 *  runtime 实现属性的 setter getter 方法
 */
//密文
static const char QJSCipherKey = '\0';
- (void)setCipherText:(NSString *)cipherText {
    objc_setAssociatedObject(self, &QJSCipherKey, cipherText, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (NSString *)cipherText {
    return objc_getAssociatedObject(self, &QJSCipherKey);;
}

- (void)qjs_insertText:(NSString *)text {
    
    
}

@end
