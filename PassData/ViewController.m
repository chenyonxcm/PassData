//
//  ViewController.m
//  PassData
//
//  Created by chenyong on 17/7/13.
//  Copyright © 2017年 chenyong. All rights reserved.
//

/**
 *分别用代理，通知，block实现传值
 *需求：ViewController页面有个label,点击跳转到NextViewController页面有个TextField,输入一个字符，返回。ViewController的时候在label上显示该字符。
 */
#import "ViewController.h"
#import "NextViewController.h"

@interface ViewController ()<NextViewControllerDelegate>
@property (nonatomic, strong) UILabel *customLabel;
@end

@implementation ViewController
// 销毁所有通知
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(passByData:) name:PassDataNotification object:nil];
    
    [self createLabel];
}

- (void)createLabel {
    self.customLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 50)];
    self.customLabel.center = self.view.center;
    self.customLabel.font = [UIFont systemFontOfSize:14];
    self.customLabel.backgroundColor = [UIColor magentaColor];
    [self.view addSubview:self.customLabel];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NextViewController *nextVC = [[NextViewController alloc] init];
    nextVC.delegate = self;
    // block
    nextVC.block = ^(NSString *value) {
        self.customLabel.text = value;
    };
    [self presentViewController:nextVC animated:YES completion:nil];
}

#pragma mark - NextViewControllerDelegate
// 实现代理方法
- (void)passData:(NSString *)string {
    self.customLabel.text = string;
}

// 通知取值
- (void)passByData:(NSNotification *)noti {
    NSDictionary *dic = [noti userInfo];
    NSString *value = [dic objectForKey:@"value"];
    self.customLabel.text = value;
}
@end
