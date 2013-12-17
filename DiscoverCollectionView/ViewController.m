//
//  ViewController.m
//  DiscoverCollectionView
//
//  Created by Chelsea Chanay on 12/16/13.
//  Copyright (c) 2013 Chelsea Chanay. All rights reserved.
//

#import "ViewController.h"
#import "BaseCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [collection setCollectionCellLayout: BaseCellType, AmountCellType, BaseCellType, AmountCellType, AmountCellType, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Collection View Data Source Methods

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collection dequeueReusableCellWithIndexPath:indexPath];
    return cell;
}


// Should not have to specify Delegate Methods.... Put into separate class.
#pragma mark - Collection View Delegate Methods

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    UIInterfaceOrientation interfaceOrientation = [UIApplication sharedApplication].statusBarOrientation;

    
    NSArray *layoutPattern = [collection retrieveLayoutPattern];
    NSString *cellClass = [layoutPattern objectAtIndex:(indexPath.row % layoutPattern.count)];

    Class baseCell = NSClassFromString(cellClass);
    
    CGFloat baseSize = 0;
    if ([baseCell isSubclassOfClass:[BaseCell class]])
    {
        baseSize = [baseCell cellHeight];
    }
    
    //return CGSizeMake(screenWidth, baseSize);
    
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
    return 1.f;
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    [collection.collectionViewLayout invalidateLayout];
}

@end
