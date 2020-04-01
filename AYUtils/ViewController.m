//
//  ViewController.m
//  AYUtils
//
//  Created by dnake_ay on 2019/9/29.
//  Copyright © 2019 dnake_ay. All rights reserved.
//

#import "ViewController.h"
#import "AYUtils/AYWebView.h"

@interface ViewController () <AYWebViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    AYWebView *webView = [[AYWebView alloc] initWithFrame:CGRectZero];
    webView.frame = self.view.bounds;
//    [webView loadUrl:@"https://www.baidu.com"];
    NSString *loadString = @"{data={action=getSdkInfo;uuid=hrjtkvciakciuiomuojxxswsubrfizut;};fromDev=432;toDev=g_12872;}";
    [webView loadHTMLString:[NSString stringWithFormat:@"<html><body><div id = 'jsonType'>%@</div></body></html>", loadString]];
    webView.webViewDelegate = self;
    [self.view addSubview:webView];
    
    NSLog(@"%@", self.view);
}

- (void)webView:(AYWebView *)webView didFinishLoadedWithURL:(NSString *)url
{
    NSLog(@"%@", url);
}

@end
