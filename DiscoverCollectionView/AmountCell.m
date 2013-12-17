//
//  AmountCell.m
//  DiscoverCollectionView
//
//  Created by Chelsea Chanay on 12/17/13.
//  Copyright (c) 2013 Chelsea Chanay. All rights reserved.
//

#import "AmountCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation AmountCell

#pragma mark - Text Field Delegate Methods

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    amountField.layer.borderWidth = 1;
    amountField.layer.borderColor = [[UIColor lightGrayColor] CGColor];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

+(CGFloat)cellHeight
{
    return 65.f;
}


@end
