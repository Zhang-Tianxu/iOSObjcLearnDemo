//
//  UICollectionViewPageViewController.m
//  iOSObjcLearnDemo
//
//  Created by 天诩 on 2021/7/20.
//

#import <QMUIKit/QMUIKit.h>
#import <WebKit/WebKit.h>
#import "UICollectionViewPageViewController.h"
#import "collectionViewMinimumDemoViewController.h"

@interface UICollectionViewPageViewController ()
@property (nonatomic, strong) QMUIGhostButton* jumpToMinimumDemoPageBtn;
@end

@implementation UICollectionViewPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    [self.view addSubview:self.jumpToMinimumDemoPageBtn];
}


- (void)jumpToMinimumDemoPage {
    collectionViewMinimumDemoViewController *miniDemoViewController = [[collectionViewMinimumDemoViewController alloc] init];
    [self.navigationController pushViewController:miniDemoViewController animated:YES];
}

- (QMUIGhostButton *)jumpToMinimumDemoPageBtn {
    if (!_jumpToMinimumDemoPageBtn) {
        _jumpToMinimumDemoPageBtn = [[QMUIGhostButton alloc] initWithFrame:CGRectZero];
        [_jumpToMinimumDemoPageBtn setTitle:@"jump to minimum demo page" forState:UIControlStateNormal];
        [_jumpToMinimumDemoPageBtn addTarget:self action:@selector(jumpToMinimumDemoPage) forControlEvents:UIControlEventTouchUpInside];
        _jumpToMinimumDemoPageBtn.frame = CGRectMake(50, 100, 100, 20);
        [_jumpToMinimumDemoPageBtn sizeToFit];
    }
    return _jumpToMinimumDemoPageBtn;
}
@end
