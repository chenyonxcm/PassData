//
//  NextViewController.h
//  PassData
//
//  Created by chenyong on 17/7/13.
//  Copyright © 2017年 chenyong. All rights reserved.
//

#import <UIKit/UIKit.h>

#define PassDataNotification @"notification"

// 代理
@class NextViewController;
@protocol NextViewControllerDelegate <NSObject>

- (void)passData:(NSString *)string;

@end

// block
typedef void(^passDataBlock)(NSString *value);
@interface NextViewController : UIViewController
// 代理属性
@property (nonatomic, weak) id<NextViewControllerDelegate>delegate;
// block属性
@property (nonatomic, strong)passDataBlock block;

@end
