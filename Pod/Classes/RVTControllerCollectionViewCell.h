//
//  RVTControllerCollectionViewCell.h
//  PaperScrollView
//
//  Created by Adam J Share on 5/1/15.
//  Copyright (c) 2015 Adam J Share. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PaperCellChangeDelegate <NSObject>

@optional
- (void)presentationRatio:(float)ratio;

@end

@interface RVTControllerCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) id<PaperCellChangeDelegate> delegate;
@property (strong, nonatomic) UIView *scaledView;

@end
