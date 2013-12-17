//
//  BaseCell.h
//  DiscoverCollectionView
//
//  Created by Chelsea Chanay on 12/16/13.
//  Copyright (c) 2013 Chelsea Chanay. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseCell : UICollectionViewCell
{
    IBOutlet UILabel *header;
    IBOutlet UILabel *value;
    IBOutlet UILabel *disclosureIndicator;
    
}

-(void)setCellWithHeaderText:(NSString *)headerText valueText:(NSString *)valueText andDesciptionIndicatorHidden:(BOOL)hidden;
-(void)setHeaderText:(NSString *)headerText;
-(void)setValueText:(NSString *)valueText;
-(void)setDisclosureIndicatorHidden:(BOOL)hidden;

+(CGFloat)cellHeight;

@end
