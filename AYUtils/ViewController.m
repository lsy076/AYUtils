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
    [self.navigationController pushViewController:[NextViewController new] animated:YES];
    
//    [AYAlertViewController alertViewController:self title:@"title" message:@"message" cancel:@"cancel" confirm:@"confirm" style:AYAlertViewControllerStylePasswordNone alert:^(UIAlertController *action, int index) {
//        NSLog(@"%d", index);
//    }];
}

@end
