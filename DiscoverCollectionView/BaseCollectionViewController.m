//
//  BaseCollectionViewController.m
//  DiscoverCollectionView
//
//  Created by Chelsea Chanay on 12/20/13.
//  Copyright (c) 2013 Chelsea Chanay. All rights reserved.
//

#import "BaseCollectionViewController.h"

@interface BaseCollectionViewController ()

@end

@implementation BaseCollectionViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [collection setCollectionViewLayout:layout];
    [collection setDelegate:layout];
    [collection setDataSource:self];
}

-(UICollectionReusableView *)collectionView:(BaseCollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    return [collectionView dequeueReusableSupplementaryViewForElementOfKind:kind forIndexPath:indexPath];
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [collection.collectionViewLayout invalidateLayout];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [collection dequeueReusableCellWithIndexPath:indexPath];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 0;
}

// Analytics //////////////

@end
