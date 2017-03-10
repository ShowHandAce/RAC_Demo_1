//
//  UITextField+QJSExtentRange.m
//  RAC_Demo_1
//
//  Created by qjsios on 2017/3/6.
//  Copyright © 2017年 zhios. All rights reserved.
//

#import "UITextField+QJSExtentRange.h"

@implementation UITextField (QJSExtentRange)

- (NSRange)selectedRange {
    
    UITextPosition* beginning = self.beginningOfDocument;
    
    UITextRange* selectedRange = self.selectedTextRange;
    UITextPosition* selectionStart = selectedRange.start;
    UITextPosition* selectionEnd = selectedRange.end;
    
    const NSInteger location = [self offsetFromPosition:beginning toPosition:selectionStart];
    const NSInteger length = [self offsetFromPosition:selectionStart toPosition:selectionEnd];
    
    return NSMakeRange(location, length);
}
// 备注：UITextField必须为第一响应者才有效
- (void)setSelectedRange:(NSRange)range {
    
    UITextPosition* beginning = self.beginningOfDocument;
    
    UITextPosition* startPosition = [self positionFromPosition:beginning offset:range.location];
    UITextPosition* endPosition = [self positionFromPosition:beginning offset:range.location + range.length];
    UITextRange* selectionRange = [self textRangeFromPosition:startPosition toPosition:endPosition];
    
    [self setSelectedTextRange:selectionRange];
}

@end
