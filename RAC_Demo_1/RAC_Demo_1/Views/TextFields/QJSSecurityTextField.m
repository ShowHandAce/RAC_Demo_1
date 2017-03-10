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

- (void)setText:(NSString *)text {
    
    self.cipherText = text;
    
    NSMutableString *mapText = [NSMutableString string];
    
    for (NSInteger i=0; i<text.length; i++) {
        [mapText appendString:@"●"];
    }
    [super setText:mapText];
}

- (NSString *)text {
    return _cipherText;
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
}

- (void)insertText:(NSString *)text {
    
    NSRange selectedRange = [self selectedRange];
    
    NSMutableString *cipherMText = [NSMutableString stringWithString:self.cipherText];
    
    [cipherMText insertString:text atIndex:selectedRange.location];
    
    self.cipherText = cipherMText;
    
    NSMutableString *mapText = [NSMutableString stringWithString:text];
    
    if (self.cipherTextEntry) {
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

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    return NO;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
