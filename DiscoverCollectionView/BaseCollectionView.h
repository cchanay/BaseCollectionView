//
//  BaseCollectionViewController.h
//  DiscoverCollectionView
//
//  Created by Chelsea Chanay on 12/16/13.
//  Copyright (c) 2013 Chelsea Chanay. All rights reserved.
//

#import <UIKit/UIKit.h>

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

-(void)setCollectionCellLayout:(kCollectionCellType)cellType, ... NS_REQUIRES_NIL_TERMINATION;
-(UICollectionViewCell *)dequeueReusableCellWithIndexPath:(NSIndexPath*)indexPath;
-(NSArray *)retrieveLayoutPattern;

@end
