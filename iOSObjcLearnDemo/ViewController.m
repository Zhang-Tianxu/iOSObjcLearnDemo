//
//  ViewController.m
//  iOSObjcLearnDemo
//
//  Created by 天诩 on 2021/6/30.
//

#import <QMUIKit/QMUIKit.h>
#import "ViewController.h"
#import "UICollectionViewPageViewController.h"
#import "WKWebViewDemoViewController.h"

@interface ViewController ()
@property (nonatomic, strong) QMUIGhostButton* jumpToCollectionViewBtn;
@property (nonatomic, strong) QMUIGhostButton* jumpToWebViewBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)viewWillAppear:(BOOL)animated {
    self.navigationController.navigationBarHidden = YES;
}

- (void)setupUI {
    [self.view addSubview:self.jumpToCollectionViewBtn];
    [self.view addSubview:self.jumpToWebViewBtn];
}

#pragma mark - jump methods
- (void)jumpToCollectionView {
    UICollectionViewPageViewController *collectionVC = [[UICollectionViewPageViewController alloc] init];
    [self.navigationController pushViewController:collectionVC animated:YES];
    self.navigationController.navigationBarHidden = NO;
}

- (void)jumpToWebView {
    WKWebViewDemoViewController *webVC = [[WKWebViewDemoViewController alloc] init];
    [self.navigationController pushViewController:webVC animated:NO];
    self.navigationController.navigationBarHidden = YES;
}

#pragma mark - getter

- (QMUIGhostButton *)jumpToCollectionViewBtn {
    if (!_jumpToCollectionViewBtn) {
        _jumpToCollectionViewBtn = [[QMUIGhostButton alloc] initWithFrame:CGRectZero];
        [_jumpToCollectionViewBtn setTitle:@"jump to collectionView" forState:UIControlStateNormal];
        [_jumpToCollectionViewBtn addTarget:self action:@selector(jumpToCollectionView) forControlEvents:UIControlEventTouchUpInside];
        _jumpToCollectionViewBtn.frame = CGRectMake(50, 100, 100, 20);
        [_jumpToCollectionViewBtn sizeToFit];
    }
    return _jumpToCollectionViewBtn;
}

- (QMUIGhostButton *)jumpToWebViewBtn {
    if (!_jumpToWebViewBtn) {
        _jumpToWebViewBtn = [[QMUIGhostButton alloc] initWithFrame:CGRectZero];
        [_jumpToWebViewBtn setTitle:@"jump to WebView" forState:UIControlStateNormal];
        [_jumpToWebViewBtn addTarget:self action:@selector(jumpToWebView) forControlEvents:UIControlEventTouchUpInside];
        _jumpToWebViewBtn.frame = CGRectMake(50, 200, 100, 20);
        [_jumpToWebViewBtn sizeToFit];
    }
    return _jumpToWebViewBtn;
}

@end
