//
//  RDLogInViewController.m
//  RAC_Demo_1
//
//  Created by qjsios on 2017/3/3.
//  Copyright © 2017年 zhios. All rights reserved.
//

#import "RDLogInViewController.h"
#import "RDButton.h"
#import "QJSSecurityTextField.h"

@interface RDLogInViewController ()

@property (nonatomic, strong) UIButton *avatarButton;   /**< 头像按钮 */

@property (nonatomic, strong) UIImageView *userNameImgView; /**< 用户名 图片 */
@property (nonatomic, strong) UIImageView *passWordImgView; /**< 密码 图片 */

@property (nonatomic, strong) UITextField *userNameTextField;   /**< 用户名输入框 */
@property (nonatomic, strong) QJSSecurityTextField *passWordTextField;   /**< 密码 输入框 */

@property (nonatomic, strong) RDButton *loginButton;    /**< 登录按钮 */
@property (nonatomic, strong) UIButton *browserLoginButton;

//@property (nonatomic, strong, readonly) MRCLoginViewModel *viewModel;
//@property (nonatomic, strong) IQKeyboardReturnKeyHandler *returnKeyHa

@property (nonatomic, strong) UIButton *testBtn;

@end

@implementation RDLogInViewController

#pragma mark - 懒加载
- (UIButton *)avatarButton {
    if (!_avatarButton) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.imageView.contentMode = UIViewContentModeScaleAspectFill;
        btn.layer.borderColor = [UIColor whiteColor].CGColor;
        btn.layer.borderWidth = 2.0f;
        _avatarButton  = btn;
    }
    return _avatarButton;
}
- (UIImageView *)userNameImgView {
    if (!_userNameImgView) {
        UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
        imgView.backgroundColor = [UIColor brownColor];
        _userNameImgView = imgView;
    }
    return _userNameImgView;
}
- (UIImageView *)passWordImgView {
    if (!_passWordImgView) {
        UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
        imgView.backgroundColor = [UIColor brownColor];
        _passWordImgView = imgView;
    }
    return _passWordImgView;
}
- (UITextField *)userNameTextField {
    if (!_userNameTextField) {
        UITextField *textField = [[UITextField alloc] init];
        textField.keyboardType = UIKeyboardTypeASCIICapable;
        textField.autocorrectionType = UITextAutocorrectionTypeNo;
        textField.font = [UIFont systemFontOfSize:15];
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.placeholder = @"GitHub username or email";
        _userNameTextField = textField;
    }
    return _userNameTextField;
}
- (QJSSecurityTextField *)passWordTextField {
    if (!_passWordTextField) {
        QJSSecurityTextField *textField = [[QJSSecurityTextField alloc] init];
        textField.font = [UIFont systemFontOfSize:15];
        textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        textField.placeholder = @"GitHub password";
        _passWordTextField = textField;
    }
    return _passWordTextField;
}
- (RDButton *)loginButton {
    if (!_loginButton) {
        RDButton *btn = [RDButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"Log In" forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        _loginButton  = btn;
    }
    return _loginButton;
}

- (UIButton *)testBtn {
    if (!_testBtn) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        [btn setTitle:@"取消" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(cancleButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
        _testBtn = btn;
    }
    return _testBtn;
}

- (void)cancleButtonTouched:(UIButton *)sender {
    
    NSLog(@"取消");
    
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}

#pragma mark - 生命周期方法
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self configSubElements];
    
    @weakify(self);
    RACSignal *validUserNameSignal = [self.userNameTextField.rac_textSignal map:^id _Nullable(NSString * _Nullable value) {
        @strongify(self)
        return @([self isValidUsername:value]);
    }];
    
    RACSignal *validPassWordSignal = [self.passWordTextField.rac_textSignal map:^id _Nullable(NSString * _Nullable value) {
        @strongify(self)
        return @([self isValidPassword:value]);
    }];
    
    RAC(self.userNameTextField, backgroundColor) = [validUserNameSignal map:^id _Nullable(id  _Nullable value) {
        return [value boolValue] ? [UIColor clearColor] : [UIColor yellowColor];
    }];
    
    RAC(self.passWordTextField, backgroundColor) = [validPassWordSignal map:^id _Nullable(id  _Nullable value) {
        return [value boolValue] ? [UIColor clearColor] : [UIColor yellowColor];
    }];
    
    RACSignal *logInActiveSignal = [RACSignal combineLatest:@[validUserNameSignal, validPassWordSignal] reduce:^id _Nullable(NSNumber *userNameValid, NSNumber *passWordValid) {
        return @([userNameValid boolValue] && [passWordValid boolValue]);
    }];
    
    [logInActiveSignal subscribeNext:^(id  _Nullable x) {
        @strongify(self)
        self.loginButton.enabled = [x boolValue];
    }];
    
    [[self.loginButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"登录\n%@",self.passWordTextField.text);
    }];
}

#pragma mark - 初始化子控件
- (void)configSubElements {
    
    __weak typeof(self) weakSelf = self;
    
    [self.view addSubview:self.avatarButton];
    [self.view addSubview:self.loginButton];
    
    UIView *inputBgView = [[UIView alloc] init];
    inputBgView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:inputBgView];
    [inputBgView addSubview:self.userNameImgView];
    [inputBgView addSubview:self.userNameTextField];
    [inputBgView addSubview:self.passWordImgView];
    [inputBgView addSubview:self.passWordTextField];
    
    UIView *topLine = [[UIView alloc] init];
    topLine.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UIView *middleLine = [[UIView alloc] init];
    middleLine.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UIView *bottomLine = [[UIView alloc] init];
    bottomLine.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [inputBgView addSubview:topLine];
    [inputBgView addSubview:middleLine];
    [inputBgView addSubview:bottomLine];
    
    [self.view addSubview:self.testBtn];
    
    [self.avatarButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(@0);
        make.bottom.equalTo(inputBgView.mas_top).offset(-40);
        make.width.height.equalTo(@85);
    }];
    
    [inputBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.equalTo(@0);
        make.centerY.equalTo(@-46);
        make.height.equalTo(@100);
    }];
    
    [self.userNameImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@15);
        make.centerY.equalTo(weakSelf.userNameTextField);
        make.width.height.equalTo(@22);
    }];
    
    [self.userNameTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@9);
        make.leading.equalTo(weakSelf.userNameImgView.mas_trailing).offset(10);
        make.trailing.equalTo(@-15);
        make.height.equalTo(@30);
    }];
    
    [self.passWordImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.equalTo(@15);
        make.centerY.equalTo(weakSelf.passWordTextField);
        make.width.height.equalTo(@22);
    }];
    
    [self.passWordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(middleLine.mas_bottom).offset(9);
        make.leading.equalTo(weakSelf.passWordImgView.mas_trailing).offset(10);
        make.trailing.equalTo(@-15);
        make.height.equalTo(@30);
    }];
    
    [topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(@0);
        make.height.equalTo(@1);
    }];
    
    [middleLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(@0);
        make.leading.equalTo(@15);
        make.trailing.equalTo(@-15);
        make.height.equalTo(@1);
    }];
    
    [bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.trailing.bottom.equalTo(@0);
        make.height.equalTo(@1);
    }];
    
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(inputBgView.mas_bottom).offset(22);
        make.leading.equalTo(@15);
        make.trailing.equalTo(@-15);
        make.height.equalTo(@40);
    }];
    
    [self.testBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@20);
        make.right.equalTo(@0);
        make.width.equalTo(@80);
        make.height.equalTo(@44);
    }];
}

- (BOOL)isValidUsername:(NSString *)username {
    return username.length > 3;
}

- (BOOL)isValidPassword:(NSString *)password {
    return password.length > 3;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    
    NSLog(@"login controller dealloc");
}

@end
