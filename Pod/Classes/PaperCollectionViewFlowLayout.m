//
//  PaperCollectionViewFlowLayout.m
//  Pods
//
//  Created by Diego Pais on 6/21/16.
//
//

#import "PaperCollectionViewFlowLayout.h"

@implementation PaperCollectionViewFlowLayout

- (instancetype)init
{
    if (self = [super init]) {
        self.itemsAppearDirection = PaperItemsAppearDirectionFromLeft;
        self.itemsDisappearDirection = PaperItemsDisappearDirectionToLeft;
    }
    return self;
}

- (CGPoint)contentOffsetAfterItems:(NSInteger)itemsCount
{
    CGPoint contentOffset   = CGPointZero;
    CGFloat spacing         = itemsCount * self.minimumInteritemSpacing;
    CGFloat itemsWidth      = itemsCount * self.itemSize.width;
    contentOffset.x         = itemsWidth + spacing;
    contentOffset.x         = MAX(self.collectionView.bounds.size.width, contentOffset.x);
    
    return contentOffset;
}

- (UICollectionViewLayoutAttributes *)initialLayoutAttributesForAppearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
    UICollectionViewLayoutAttributes *attributes = [super initialLayoutAttributesForAppearingItemAtIndexPath:itemIndexPath];
    
    CGFloat offset = [self contentOffsetAfterItems:3].x;
    
    attributes.transform = CGAffineTransformMakeTranslation(self.itemsAppearDirection == PaperItemsAppearDirectionFromLeft ? -offset : offset, 0.f);
    attributes.zIndex   = 50;
    attributes.alpha    = 1.0f;

    return attributes;
}

- (UICollectionViewLayoutAttributes *)finalLayoutAttributesForDisappearingItemAtIndexPath:(NSIndexPath *)itemIndexPath
{
    UICollectionViewLayoutAttributes *attributes = [super finalLayoutAttributesForDisappearingItemAtIndexPath:itemIndexPath];
    
    CGFloat offset = [self contentOffsetAfterItems:3].x;
    
    attributes.transform = CGAffineTransformMakeTranslation(self.itemsDisappearDirection == PaperItemsDisappearDirectionToRight? offset : -offset, 0.f);
    attributes.zIndex = 100;
    attributes.alpha = 1.0f;
    
    return attributes;
}

@end
