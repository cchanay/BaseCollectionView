//
//  AmountCell.h
//  DiscoverCollectionView
//
//  Created by Chelsea Chanay on 12/17/13.
//  Copyright (c) 2013 Chelsea Chanay. All rights reserved.
//

#import "BaseCell.h"

@interface AmountCell : BaseCell <UITextFieldDelegate>
{
    IBOutlet UITextField *amountField;
}

+(CGFloat)cellHeight;

@end
