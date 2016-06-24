//
//  PaperCollectionViewFlowLayout.h
//  Pods
//
//  Created by Diego Pais on 6/21/16.
//
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, PaperItemsAppearDirection)
{
    PaperItemsAppearDirectionFromLeft = 0,
    PaperItemsAppearDirectionFromRight
};

typedef NS_ENUM(NSInteger, PaperItemsDisappearDirection)
{
    PaperItemsDisappearDirectionToLeft = 0,
    PaperItemsDisappearDirectionToRight
};

@interface PaperCollectionViewFlowLayout : UICollectionViewFlowLayout

@property (nonatomic, assign) PaperItemsAppearDirection itemsAppearDirection;
@property (nonatomic, assign) PaperItemsDisappearDirection itemsDisappearDirection;

@end
