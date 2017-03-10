//
//  UITextField+QJSSecurity.h
//  RAC_Demo_1
//
//  Created by qjsios on 2017/3/3.
//  Copyright © 2017年 zhios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (QJSSecurity)

@property (nonatomic, copy) NSString *cipherText;   /**< 密文文本 */

- (void)qjs_insertText:(NSString *)text;

@end
