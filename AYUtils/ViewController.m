//
//  ViewController.m
//  AYUtils
//
//  Created by dnake_ay on 2019/9/29.
//  Copyright © 2019 dnake_ay. All rights reserved.
//

#import "ViewController.h"
#import "AYUtils/AYWebView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    AYWebView *webView = [[AYWebView alloc] initWithFrame:self.view.bounds];
    [webView loadUrl:@"https://www.baidu.com"];
    [self.view addSubview:webView];
}


@end
