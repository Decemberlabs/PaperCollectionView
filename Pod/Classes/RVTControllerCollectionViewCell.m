//
//  RVTControllerCollectionViewCell.m
//  PaperScrollView
//
//  Created by Adam J Share on 5/1/15.
//  Copyright (c) 2015 Adam J Share. All rights reserved.
//

#import "RVTControllerCollectionViewCell.h"

@interface RVTControllerCollectionViewCell ()

@end

@implementation RVTControllerCollectionViewCell

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    self.contentView.backgroundColor = [UIColor whiteColor];
}

- (void)setScaledView:(UIView *)scaledView {
    
    [_scaledView removeFromSuperview];
    
    scaledView.autoresizingMask = UIViewAutoresizingNone;
    scaledView.layer.anchorPoint = CGPointMake(0.0, 0.0);
    scaledView.frame = [UIScreen mainScreen].bounds;
    
    [self.contentView addSubview:scaledView];
    
    _scaledView = scaledView;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat ratio = self.scale;
    
    _scaledView.transform = CGAffineTransformIdentity;
    _scaledView.transform = CGAffineTransformMakeScale(ratio, ratio);
    
    if ([self.delegate respondsToSelector:@selector(presentationRatio:)]) {
        [self.delegate presentationRatio:self.contentAlpha];
    }
}

- (CGFloat)scale {
    return self.bounds.size.height/[UIScreen mainScreen].bounds.size.height;
}

- (CGFloat)contentAlpha {
    
    return 1-([UIScreen mainScreen].bounds.size.height-self.bounds.size.height)/200;
}


@end
