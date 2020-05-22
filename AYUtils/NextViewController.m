//
//  NextViewController.m
//  AYUtils
//
//  Created by 赖盛源 on 2020/4/1.
//  Copyright © 2020 dnake_ay. All rights reserved.
//

#import "NextViewController.h"
#import "AYUtils/AYWebView.h"
#import "AYUtils.h"

@interface NextViewController () <AYWebViewDelegate>

@property (strong, nonatomic) AYWebView *webView;

@end

@implementation NextViewController

- (void)goBackLastPage
{
    if (self.webView.canGoBack) {
        [self.webView goBack];
    } else {
        [self.webView closePage];
    }
}

- (void)goToNextPage
{
    if (self.webView.canGoForward) {
        [self.webView goForward];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"上一页" style:UIBarButtonItemStyleDone target:self action:@selector(goBackLastPage)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"下一页" style:UIBarButtonItemStyleDone target:self action:@selector(goToNextPage)];
    
    AYWebView *webView = [[AYWebView alloc] initWithFrame:CGRectZero];
    webView.frame = self.view.bounds;
    [webView loadUrl:@"https://www.baidu.com"];
    webView.webViewDelegate = self;
    [self.view addSubview:webView];
    self.webView = webView;
    
    [[AYProgressHud sharedInstance] progressHudWithShowText:@"登录中" showTime:@(15)];
}

- (void)webView:(AYWebView *)webView didFinishLoadedWithURL:(NSString *)url
{
    NSLog(@"%@", url);
    
    [[AYProgressHud sharedInstance] progressHudhide];
}

@end
