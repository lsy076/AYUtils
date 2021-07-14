//
//  ViewController.m
//  AYUtils
//
//  Created by dnake_ay on 2019/9/29.
//  Copyright © 2019 dnake_ay. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"
#import "AYUtils.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [AYAlertViewController alertViewController:self title:@"title" message:@"message" cancel:@"cancel" confirm:@"confirm" style:AYAlertViewControllerStylePasswordText alert:^(UIAlertController *action, int index) {
//        NSLog(@"%d", index);
//    }];
}
- (IBAction)jumpWebView:(id)sender {
    [self.navigationController pushViewController:[NextViewController new] animated:YES];
    
//    [AYAlertViewController alertViewController:self title:@"title" message:@"message" cancel:@"cancel" confirm:@"confirm" style:AYAlertViewControllerStylePasswordNone alert:^(UIAlertController *action, int index) {
//        NSLog(@"%d", index);
//    }];
    
    [AYProgressHud progressHudShowShortTimeMessage:@"跳转网页跳"];
    
}

@end
