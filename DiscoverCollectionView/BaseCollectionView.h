//
//  BaseCollectionViewController.h
//  DiscoverCollectionView
//
//  Created by Chelsea Chanay on 12/16/13.
//  Copyright (c) 2013 Chelsea Chanay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@class BaseCollectionView;

typedef enum
{
    BaseCellType = 1,
    AmountCellType
}kCollectionCellType;
#define kCollectionCellTypeArray @"Unknown", @"BaseCell", @"AmountCell", nil

@interface BaseCollectionView : UICollectionView
{
    NSArray *layoutPattern;
}

@property UIView *headerView;
@property UIView *footerView;

-(void)setCollectionCellLayout:(kCollectionCellType)cellType, ... NS_REQUIRES_NIL_TERMINATION;
-(UICollectionViewCell *)dequeueReusableCellWithIndexPath:(NSIndexPath*)indexPath;
-(UICollectionReusableView *)dequeueReusableSupplementaryViewForElementOfKind:(NSString *)elementKind forIndexPath:(NSIndexPath *)indexPath;
-(NSArray *)retrieveLayoutPattern;

@end
