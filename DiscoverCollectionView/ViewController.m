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
    
    UIView *headerView = [[[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil] objectAtIndex:0];
    UIView *footerView = [[[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil] objectAtIndex:0];
    [collection setHeaderView:headerView];
    [collection setFooterView:footerView];
    
    [collection setCollectionCellLayout: BaseCellType, nil];
}


#pragma mark - Collection View Data Source Methods

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    // if memo then return 6, if not 5
    return 5;
}

-(UICollectionViewCell *)collectionView:(BaseCollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    BaseCell *cell = (BaseCell *)[collectionView dequeueReusableCellWithIndexPath:indexPath];
    switch (indexPath.row)
    {
        // Payee
        case 0:
            [cell setCellWithHeaderText:@"Payee" valueText:@"Chelsea" andDesciptionIndicatorHidden:YES];
            break;
        // Pay From
        case 1:
            [cell setCellWithHeaderText:@"Pay From" valueText:@"DC Checking 0413" andDesciptionIndicatorHidden:YES];
            break;
        // Amount
        case 2:
            [cell setCellWithHeaderText:@"Amount" valueText:@"$25.00" andDesciptionIndicatorHidden:YES];
            break;
        // Deliver By
        case 3:
            [cell setCellWithHeaderText:@"Deliver By" valueText:@"12/25/13" andDesciptionIndicatorHidden:YES];
            break;
        // Status
        case 4:
            [cell setCellWithHeaderText:@"Status" valueText:@"Scheduled" andDesciptionIndicatorHidden:YES];
            break;
        // Confirmation Number
        case 5:
            [cell setCellWithHeaderText:@"Confirmation Number" valueText:@"GK1WP-12345D" andDesciptionIndicatorHidden:YES];
            break;
        case 6:
            [cell setCellWithHeaderText:@"Memo" valueText:@"I am a memo" andDesciptionIndicatorHidden:YES];
    }
    return cell;
}

@end
