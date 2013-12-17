//
//  BaseCell.m
//  DiscoverCollectionView
//
//  Created by Chelsea Chanay on 12/16/13.
//  Copyright (c) 2013 Chelsea Chanay. All rights reserved.
//

#import "BaseCell.h"

@implementation BaseCell

static const int CONTENT_LEFT_MARGIN = 15;

-(void)awakeFromNib
{
    UIView *separatorView = [[UIView alloc]initWithFrame:CGRectMake(self.frame.origin.x + CONTENT_LEFT_MARGIN, self.frame.size.height - 1, self.frame.size.width - CONTENT_LEFT_MARGIN, 1)];
    [separatorView setBackgroundColor:[UIColor lightGrayColor]];
    [separatorView setAutoresizingMask:UIViewAutoresizingFlexibleWidth];
    [self addSubview:separatorView];
}

-(void)setCellWithHeaderText:(NSString *)headerText valueText:(NSString *)valueText andDesciptionIndicatorHidden:(BOOL)hidden
{
    [self setHeaderText:headerText];
    [self setValueText:valueText];
    [self setDisclosureIndicatorHidden:hidden];
}

-(void)setHeaderText:(NSString *)headerText
{
    [header setText:headerText];
}

-(void)setValueText:(NSString *)valueText
{
    [value setText:valueText];
}

-(void)setDisclosureIndicatorHidden:(BOOL)hidden
{
    [disclosureIndicator setHidden:hidden];
}

+(CGFloat)cellHeight
{
    return 65.f;
}



@end
