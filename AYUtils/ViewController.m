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
    
}
- (IBAction)jumpWebView:(id)sender {
    [[AYProgressHud sharedInstance] progressHudWithShowText:@"登录中" showTime:@(15)];
    [self.navigationController pushViewController:[NextViewController new] animated:YES];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[AYProgressHud sharedInstance] progressHudhide];
    });
}

@end
