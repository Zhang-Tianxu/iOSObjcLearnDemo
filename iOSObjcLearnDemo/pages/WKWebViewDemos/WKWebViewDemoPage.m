//
//  WKWebViewDemoPage.m
//  iOSObjcLearnDemo
//
//  Created by 天诩 on 2021/7/24.
//

#import <WebKit/WebKit.h>
#import "WKWebViewDemoPage.h"

@interface WKWebViewDemoPage()
@property (nonatomic, strong) WKWebView *webView;
@end

@implementation WKWebViewDemoPage

#pragma mark - setter & getter

- (WKWebView *)webView {
    if (_webView) {
        WKWebViewConfiguration *webConfig = [[WKWebViewConfiguration alloc] init];
        _webView = [[WKWebView alloc] initWithFrame:self.frame configuration:webConfig];
//        _webView.UIDelegate = self;
    }
    return _webView;
}

- (void)setWebURL:(NSURL *)webURL {
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:webURL];
    [self.webView loadRequest:request];
}

@end
