//
//  myCollectionViewDataSource.m
//  iOSObjcLearnDemo
//
//  Created by 天诩 on 2021/9/21.
//

#import <UIKit/UIKit.h>
#import "myCollectionViewDataSource.h"
#import "myCollectionViewCell.h"

@interface myCollectionViewDataSource ()
@property (nonatomic, strong) NSArray<NSArray<UICollectionViewCell *> *> *cellOfSections;
@end

@implementation myCollectionViewDataSource

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
//           viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(nonnull NSIndexPath *)indexPath {
//    UICollectionReusableView *res = [[UICollectionReusableView alloc] initWithFrame:CGRectMake(0, 50, 200, 50)];
//    res.backgroundColor = [UIColor blueColor];
//    return res;
//}
//
//- (BOOL)collectionView:(UICollectionView *)collectionView
//canMoveItemAtIndexPath:(NSIndexPath *)indexPath {
//    return YES;
//}

//- (void)collectionView:(UICollectionView *)collectionView
//   moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath
//           toIndexPath:(NSIndexPath *)destinationIndexPath {
//
//}

//- (NSArray<NSString *> *)indexTitlesForCollectionView:(UICollectionView *)collectionView {
//    return @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"];
//}

//- (NSIndexPath *)collectionView:(UICollectionView *)collectionView
//         indexPathForIndexTitle:(NSString *)title
//                        atIndex:(NSInteger)index {
//    return [[NSIndexPath alloc] init];
//}
//返回分区个数
//-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
//    return 10;
//}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.cellOfSections count];
}


//返回每个分区的item个数
// must be override, or will crash
//- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
//    return 1;
//}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 15;
    return [self.cellOfSections[section] count];
}

#pragma mark -
//返回每个item
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    return (UICollectionViewCell *)self.cellOfSections[indexPath.section][indexPath.row];
    myCollectionViewCell * cell  = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellid" forIndexPath:indexPath];
    cell.title = @"111";
    cell.backgroundColor = [UIColor redColor];
    return cell;
}


- (NSArray<NSArray<UICollectionViewCell *> *> *)cellOfSections {
    if (!_cellOfSections) {
        NSMutableArray<NSArray<UICollectionViewCell *> *> *res = [[NSMutableArray alloc] init];
        NSMutableArray<UICollectionViewCell *> *section1cells = [[NSMutableArray alloc] init];
        myCollectionViewCell *section1cell1 = [[myCollectionViewCell alloc] init];
        section1cell1.title = @"11";
        [section1cells addObject:section1cell1];
        [res addObject:[section1cells copy]];
        
        myCollectionViewCell *section2cell1 = [[myCollectionViewCell alloc] init];
        section2cell1.title = @"21";
        myCollectionViewCell *section2cell2 = [[myCollectionViewCell alloc] init];
        section2cell2.title = @"22";
        NSMutableArray<UICollectionViewCell *> *section2cells = [[NSMutableArray alloc] init];
        [section2cells addObject:section2cell1];
        [section2cells addObject:section2cell2];
        [res addObject:[section2cells copy]];
        _cellOfSections = [res copy];
    }
    return _cellOfSections;
}

@end
