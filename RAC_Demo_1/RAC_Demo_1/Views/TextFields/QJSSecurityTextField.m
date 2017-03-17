//
//  QJSSecurityTextField.m
//  RAC_Demo_1
//
//  Created by qjsios on 2017/3/6.
//  Copyright © 2017年 zhios. All rights reserved.
//

#import "QJSSecurityTextField.h"

#import "UITextField+QJSExtentRange.h"

#import "NHKeyboard.h"

@interface QJSSecurityTextField ()

@property (nonatomic, copy) NSString *cipherText;   /**< 密文文本 */

@end

@implementation QJSSecurityTextField

- (void)setCipherTextEntry:(BOOL)cipherTextEntry {
    _cipherTextEntry = cipherTextEntry;
    
    self.clearsOnBeginEditing = _cipherTextEntry;
    
    if (_cipherTextEntry) {
        NSMutableString *mapText = [NSMutableString string];
        
        for (NSInteger i=0; i<self.text.length; i++) {
            [mapText appendString:@"●"];
        }
        self.text = mapText;
        
    }else{
        self.text = self.cipherText;
    }
}

- (NSString *)cipherText {
    if (!_cipherText) {
        _cipherText = [NSString string];
    }
    return _cipherText;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        NHKeyboard *kb = [NHKeyboard keyboardWithType:NHKBTypeASCIICapable];
        kb.inputSource = self;
        self.inputView = kb;
        self.cipherTextEntry = YES;
        
        [self addTarget:self action:@selector(textFieldEditing:) forControlEvents:UIControlEventEditingDidBegin];
        [self addTarget:self action:@selector(textFieldEditing:) forControlEvents:UIControlEventEditingChanged];
    }
    return self;
}

- (void)textFieldEditing:(UITextField *)sender {
    if (sender.text.length == 0) {
        self.cipherText = @"";
    }
        
    if (!(self.inputView && [self.inputView isKindOfClass:[NHKeyboard class]])) {
        self.cipherText = sender.text;
    }
}

- (void)insertText:(NSString *)text {
    
    NSRange selectedRange = [self selectedRange];
    
    NSMutableString *cipherMText = [NSMutableString stringWithString:self.cipherText];
    
    [cipherMText insertString:text atIndex:selectedRange.location];
    
    self.cipherText = cipherMText;
    
    NSMutableString *mapText = [NSMutableString stringWithString:text];
    
    if (self.isCipherTextEntry) {
        [mapText setString:@""];
        for (NSInteger i=0; i<text.length; i++) {
            [mapText appendString:@"●"];
        }
    }
    
    [super insertText:mapText];
}

- (void)deleteBackward {
    
    NSRange selectedRange = [self selectedRange];
    
    NSMutableString *cipherMText = [NSMutableString stringWithString:self.cipherText];
    
    if (selectedRange.location > 0 && cipherMText.length > 0) {
        [cipherMText deleteCharactersInRange:NSMakeRange(selectedRange.location - 1, 1)];
        self.cipherText = cipherMText;
    }
    
    [super deleteBackward];
}

//禁用输入框复制粘贴功能
- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    return !(self.inputView && [self.inputView isKindOfClass:[NHKeyboard class]]);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
