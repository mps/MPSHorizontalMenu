//
//  MPSHorizontalMenu.h
//  MPSHorizontalMenuDemo
//
//  Updated and inspired by Mugunth's MKHorizMenu.
//  https://github.com/MugunthKumar/MKHorizMenuDemo
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.


#import <UIKit/UIKit.h>

@class MPSHorizontalMenu;

@protocol MPSHorizontalMenuDataSource <NSObject>

@required

- (int)numberOfItemsForMenu:(MPSHorizontalMenu *)horizontalMenu;

- (NSString *)horizontalMenu:(MPSHorizontalMenu*)horizontalMenu titleForItemAtIndex:(NSUInteger)index;

@end

@protocol MPSHorizontalMenuDelegate <NSObject>

@required

- (void)horizontalMenu:(MPSHorizontalMenu *)horizontalMenu itemSelectedAtIndex:(NSUInteger)index;

@end

#import "MPSHorizontalMenuButton.h"

@interface MPSHorizontalMenu : UIScrollView

@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, weak) IBOutlet id <MPSHorizontalMenuDelegate> itemSelectedDelegate;
@property (nonatomic, weak) IBOutlet id <MPSHorizontalMenuDataSource> dataSource;
@property (nonatomic, strong) UIImage *selectedImage;
@property (nonatomic, assign) int itemCount;
@property (nonatomic, strong) UIColor *itemNormalBackgroundColor;
@property (nonatomic, strong) UIColor *itemNormalForegroundColor;
@property (nonatomic, strong) UIColor *itemSelectedBackgroundColor;
@property (nonatomic, strong) UIColor *itemSelectedForegroundColor;
@property (nonatomic) CGFloat cornerRadius;

- (void)reloadData;
- (void)setSelectedIndex:(int)index animated:(BOOL)animated;

@end
