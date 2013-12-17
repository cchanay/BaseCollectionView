//
//  BaseCollectionViewController.m
//  DiscoverCollectionView
//
//  Created by Chelsea Chanay on 12/16/13.
//  Copyright (c) 2013 Chelsea Chanay. All rights reserved.
//

#import "BaseCollectionView.h"

@interface BaseCollectionView ()

@end

@implementation BaseCollectionView


- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        // Go through the enumeration array and register each cell
        NSArray *cellTypes = [NSArray arrayWithObjects:kCollectionCellTypeArray];
        for (id cellType in cellTypes)
        {
            [self registerNibNamed:cellType forCellWithReuseIdentifier:cellType];
        }
        
        [self setBackgroundColor:[UIColor whiteColor]];
        [self removeConstraints:self.constraints];
        [self setTranslatesAutoresizingMaskIntoConstraints:YES];
    }
    return self;
}

// Cell Layout (this could be either a once repeating or multirepeating layout pattern)
// For example:
//      If every cell in the layout is of the type Base Cell, then cellLayout = @[BaseCell] (regardless of number of cells in the view)
//      If Transfer Money Screen, then cell layout is not repeatable in any pattern therefore, cellLayout = @[BaseCell, BaseCell, AmountCell, BaseCell, BaseCell];
-(void)setCollectionCellLayout:(kCollectionCellType)firstCellType, ... NS_REQUIRES_NIL_TERMINATION
{
    va_list args;
    va_start(args, firstCellType);

    NSString *nibName = [self cellTypeEnumToString:firstCellType];
    NSMutableArray *cellLayout = [[NSMutableArray alloc]init];
    for (; nibName != nil; nibName = [self cellTypeEnumToString:(va_arg(args, kCollectionCellType))])
    {
        [cellLayout addObject:nibName];
    }
    va_end(args);
    layoutPattern = [NSArray arrayWithArray:cellLayout];
}

-(NSString*) cellTypeEnumToString:(kCollectionCellType)enumVal
{
    NSArray *cellTypeArray = [[NSArray alloc] initWithObjects:kCollectionCellTypeArray];
    if(enumVal > 0 && enumVal < cellTypeArray.count)
    {
        return [cellTypeArray objectAtIndex:enumVal];
    }
    else
    {
        return nil;
    }
}

-(kCollectionCellType) cellTypeStringToEnum:(NSString*)strVal
{
    NSArray *imageTypeArray = [[NSArray alloc] initWithObjects:kCollectionCellTypeArray];
    NSUInteger n = [imageTypeArray indexOfObject:strVal];
    return (kCollectionCellType)n;
}

- (void)registerNibNamed:(NSString*)nibName forCellWithReuseIdentifier:(NSString*)reuseId
{
    UINib* nib = [UINib nibWithNibName:nibName bundle:[NSBundle mainBundle]];
    
    [self registerNib:nib forCellWithReuseIdentifier:reuseId];
}

-(UICollectionViewCell *)dequeueReusableCellWithIndexPath:(NSIndexPath*)indexPath
{
    UICollectionViewCell *cell = [self dequeueReusableCellWithReuseIdentifier:[self reuseIdentifierForCellWithIndexPath:indexPath] forIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor whiteColor]];
    return cell;
}

-(NSString*)reuseIdentifierForCellWithIndexPath:(NSIndexPath*)indexPath
{
    return [layoutPattern objectAtIndex:(indexPath.row % layoutPattern.count)];
}

-(NSArray *)retrieveLayoutPattern
{
    return layoutPattern;
}

@end
