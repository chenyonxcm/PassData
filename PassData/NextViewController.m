//
//  NextViewController.m
//  PassData
//
//  Created by chenyong on 17/7/13.
//  Copyright © 2017年 chenyong. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()
@property (nonatomic, strong) UITextField *customText;
@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self createTextField];
}

- (void)createTextField {
    self.customText = [[UITextField alloc] initWithFrame:CGRectMake(120, 100, 150, 50)];
    self.customText.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.customText];
    [self.customText becomeFirstResponder];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 1.代理
    // 代理属性调用代理方法
//    if ([_delegate respondsToSelector:@selector(passData:)]) {
//        [_delegate passData:self.customText.text];
//    }
    
    // 2.通知
    // 注意此处必须为NSMutableDictionary，只有可变字典才能增加键值对或者删除键值对
//    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
//    [dic setValue:self.customText.text forKey:@"value"]; // 此处value是自己随便定义的一个键名，但定义好了，取值的时候就必须保持一致。
//    [[NSNotificationCenter defaultCenter] postNotificationName:PassDataNotification object:self userInfo:dic];
    
    // 3.block
    if (_block) {
        _block(self.customText.text);
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
