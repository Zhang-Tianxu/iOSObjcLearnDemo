//
//  collectionViewMinimumDemoPage.m
//  iOSObjcLearnDemo
//
//  Created by 天诩 on 2021/7/22.
//

#import "collectionViewMinimumDemoPage.h"
#import "myCollectionViewCell.h"
#import "myCollectionViewDataSource.h"

@interface collectionViewMinimumDemoPage()<UICollectionViewDelegate>
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) myCollectionViewDataSource *dataSource;
@end

@implementation collectionViewMinimumDemoPage

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupUI];
    }
    return self;
}

- (void)layoutSubviews {
    self.collectionView.frame = self.frame;
}

- (void)setupUI {
    [self addSubview:self.collectionView];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.frame.size.width, 100);
}


- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        
        _collectionView = [[UICollectionView alloc] initWithFrame:self.frame collectionViewLayout:layout];
        _dataSource = [[myCollectionViewDataSource alloc] init];
        _collectionView.dataSource = _dataSource;
        _collectionView.delegate = self;
        UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
        refreshControl.tintColor = [UIColor blueColor];
        refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@"刷新"];
        [refreshControl addTarget:self action:@selector(dragFunc) forControlEvents:UIControlEventValueChanged];
        UILabel *testLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
        testLabel.text = @"测试刷新";
        testLabel.tintColor = [UIColor yellowColor];
        testLabel.backgroundColor = [UIColor whiteColor];
        [refreshControl addSubview:testLabel];
//        _collectionView.refreshControl = refreshControl;
        _collectionView.bounces = YES;
        [_collectionView registerClass:[myCollectionViewCell class] forCellWithReuseIdentifier:@"cellid"];
//        [_collectionView registerClass:[myCollectionViewCell class] forCellWithReuseIdentifier:@"section2"];
    }
    return _collectionView;
}

- (void)dragFunc {
    NSLog(@"refreshing");
    if ([self.collectionView.refreshControl isRefreshing]) {
        [self.collectionView.refreshControl endRefreshing];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSLog(@"%@", [NSString stringWithFormat:@"%f",scrollView.contentOffset.y - scrollView.bounds.size.height ]);
}
@end
