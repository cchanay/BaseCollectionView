//
//  BaseTableLayout.m
//  DiscoverCollectionView
//
//  Created by Chelsea Chanay on 12/16/13.
//  Copyright (c) 2013 Chelsea Chanay. All rights reserved.
//

#import "BaseFlowLayout.h"
#import "BaseCell.h"
#import "BaseCollectionView.h"

@interface BaseFlowLayout()
@end

@implementation BaseFlowLayout

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    UIInterfaceOrientation interfaceOrientation = [UIApplication sharedApplication].statusBarOrientation;
    
    NSArray *layoutPattern = [(BaseCollectionView*)collectionView retrieveLayoutPattern];
    NSString *cellClass = [layoutPattern objectAtIndex:(indexPath.row % layoutPattern.count)];
    
    Class baseCell = NSClassFromString(cellClass);
    
    CGFloat baseSize = 0;
    if ([baseCell isSubclassOfClass:[BaseCell class]])
    {
        baseSize = [baseCell cellHeight];
    }
    
    CGFloat screenWidth;
    if(UIInterfaceOrientationIsPortrait(interfaceOrientation))
    {
        screenWidth = screenRect.size.width;
        return CGSizeMake(screenWidth, baseSize);
    }
    else  // UIInterfaceOrientationIsLandscape
    {
        screenWidth = screenRect.size.height;
        return CGSizeMake(screenWidth, baseSize);
    }
}

-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if ([collectionView isKindOfClass:[UICollectionView class]] && section == 0)
    {
        BaseCollectionView *collection = (BaseCollectionView *)collectionView;
        if (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation))
            return CGSizeMake([[UIScreen mainScreen] bounds].size.width, collection.headerView.frame.size.height);
        else
            return CGSizeMake([[UIScreen mainScreen] bounds].size.height, collection.headerView.frame.size.height);
    }
    return CGSizeMake(0, 0);
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    if ([collectionView isKindOfClass:[BaseCollectionView class]] && collectionView.numberOfSections - 1 == section)
    {
        BaseCollectionView *collection = (BaseCollectionView *)collectionView;
        if (UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation))
            return CGSizeMake([[UIScreen mainScreen] bounds].size.width, collection.footerView.frame.size.height);
        else
            return CGSizeMake([[UIScreen mainScreen] bounds].size.height, collection.footerView.frame.size.height);
    }
    return CGSizeMake(0, 0);
}
        

@end