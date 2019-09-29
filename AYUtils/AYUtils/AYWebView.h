//
//  AYWebView.h
//  AYLogManager
//
//  Created by dnake_ay on 2019/9/26.
//  Copyright © 2019 dnake_ay. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AYWebView : UIView
//是否能上一页
@property (assign, nonatomic) BOOL canGoBack;
//是否能下一页
@property (assign, nonatomic) BOOL canGoForward;

+ (instancetype)setupWebViewWithFrame:(CGRect)frame;
//加载网页
- (void)loadUrl:(NSString *)url;
//返回上一级
- (void)goBack;
//关闭网页
- (void)closePage;

@end

NS_ASSUME_NONNULL_END
