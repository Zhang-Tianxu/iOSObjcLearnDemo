//
//  myCollectionViewCell.m
//  iOSObjcLearnDemo
//
//  Created by 天诩 on 2021/9/21.
//

#import "myCollectionViewCell.h"

@interface myCollectionViewCell ()
@property (nonatomic, strong) UILabel *label;
@end

@implementation myCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.label];
    }
    return self;
}

- (void)layoutSubviews {
    self.label.frame = CGRectMake(0, 20, self.frame.size.width, 50);
    self.label.backgroundColor = [UIColor greenColor];
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
    }
    return _label;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    _label.text = title;
    [self setNeedsLayout];
    [self layoutIfNeeded];
}
@end
