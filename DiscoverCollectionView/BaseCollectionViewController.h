//
//  BaseCollectionViewController.h
//  DiscoverCollectionView
//
//  Created by Chelsea Chanay on 12/20/13.
//  Copyright (c) 2013 Chelsea Chanay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCollectionView.h"
#import "BaseFlowLayout.h"

@interface BaseCollectionViewController : UIViewController <UICollectionViewDataSource>
{
    IBOutlet BaseCollectionView *collection;
    IBOutlet BaseFlowLayout *layout;
}

@end
