//
//  WKWebViewDemoViewController.m
//  iOSObjcLearnDemo
//
//  Created by 天诩 on 2021/7/24.
//

#import <WebKit/WebKit.h>
#import "WKWebViewDemoViewController.h"

@interface WKWebViewDemoViewController ()<WKNavigationDelegate>
@property (nonatomic, strong) WKWebView *webView;
@end

@implementation WKWebViewDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.webView];
    self.webURL = [[NSURL alloc] initWithString:@"https://test.m.v.qq.com/mini/watch-togather"];
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSString *jsStr = @"document.getElementsByClassName(\"at-app-banner__main-btn at-app-banner--button\")[0].style.display = 'none'";
    [self.webView evaluateJavaScript:jsStr completionHandler:^(id _Nullable item, NSError * _Nullable error) {
        if (error) {
            NSLog(@"-------error: %@",error);
        } else {
            NSLog(@"%@",item);
            NSLog(@"hidde open APP bar, success");
        }
    }];
    
}
- (WKWebView *)webView {
    if (!_webView) {
        WKWebViewConfiguration *webConfig = [[WKWebViewConfiguration alloc] init];
        WKUserContentController *userContentController = [[WKUserContentController alloc] init];
        webConfig.userContentController = userContentController;
        _webView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:webConfig];
        _webView.allowsBackForwardNavigationGestures = YES;
        _webView.UIDelegate = self;
        _webView.navigationDelegate = self;
    }
    return _webView;
}

- (void)setWebURL:(NSURL *)webURL {
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:webURL];
    [self.webView loadRequest:request];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
