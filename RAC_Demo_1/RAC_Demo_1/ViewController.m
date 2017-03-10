//
//  ViewController.m
//  RAC_Demo_1
//
//  Created by qjsios on 2017/2/22.
//  Copyright © 2017年 zhios. All rights reserved.
//

#import "ViewController.h"

#import "RDLogInViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - 生命周期方法
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)logInButtonTouched:(UIButton *)sender {
    
    RDLogInViewController *logInVc = [[RDLogInViewController alloc] init];
    
    [self presentViewController:logInVc animated:YES completion:^{
    }];
    
//    [self.navigationController pushViewController:logInVc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
