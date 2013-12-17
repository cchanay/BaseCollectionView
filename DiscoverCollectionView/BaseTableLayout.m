//
//  BaseTableLayout.m
//  DiscoverCollectionView
//
//  Created by Chelsea Chanay on 12/16/13.
//  Copyright (c) 2013 Chelsea Chanay. All rights reserved.
//

#import "BaseTableLayout.h"

@interface BaseTableLayout()
@end

@implementation BaseTableLayout

/*
-(CGSize)collectionViewContentSize
{
    if( self.itemCount == 0 )
        return CGSizeZero;
    
    float w = [self rowWidth];
    float h = [self rowHeight];
    int   x = [self itemCount];
    float c = MagazineLayoutsPerRow;
    
    // width , ( ceil (n / c) ) * h
    float height = (h/c * ( x + (c/2) - ( x % (int)(c/2) ) ) );
    CGSize contentSize = { w, height };
    return contentSize;
}

-(CGRect)frameForLayoutType:(MagazineLayoutType)type
{
    UIView* cell = [self.layoutView.subviews objectAtIndex:type];
    
    return cell.frame;
}

-(float)rowWidth
{
    return self.layoutView.frame.size.width;
}

-(float)rowHeight
{
    return self.layoutView.frame.size.height;
}

-(MagazineLayoutType)layoutTypeForIndexPath:(NSIndexPath*)indexPath
{
    return indexPath.row % MagazineLayoutsPerRow;
}

-(NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray* array = [[NSMutableArray alloc] init];
    
    for( int i=0; i< self.itemCount; i++ )
    {
        UICollectionViewLayoutAttributes* attributes = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        if( CGRectIntersectsRect( attributes.frame, rect) )
            [array addObject:attributes];
    }
    
    return [NSArray arrayWithArray:array];
}

-(UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGRect frame = [self frameForLayoutType:[self layoutTypeForIndexPath:indexPath]];
    
    int row = indexPath.row / MagazineLayoutsPerRow;
    frame.origin.y += row * [self rowHeight];
    
    UICollectionViewLayoutAttributes* attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    
    attributes.frame = frame;
    
    return attributes;
}
*/

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

-(UICollectionViewScrollDirection)scrollDirection
{
    return UICollectionViewScrollDirectionVertical;
}

@end