//
//  ViewController.m
//  MPSHorizontalMenuDemo
//
//  Created by Matthew Strickland on 4/11/14.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.menuItems = [@[ @"Menu Item 1", @"Menu Item 2", @"Menu Item 3", @"Menu Item 4", @"Menu Item 5"] mutableCopy];
	
	
	self.horizontalMenu = [[MPSHorizontalMenu alloc] initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, 41)];
	self.horizontalMenu.itemSelectedBackgroundColor = [UIColor blueColor];
	self.horizontalMenu.dataSource = self;
	self.horizontalMenu.itemSelectedDelegate = self;
	self.horizontalMenu.scrollsToTop = NO;
	[self.horizontalMenu reloadData];
	[self.horizontalMenu setSelectedIndex:0 animated:NO];
	
	[self.view addSubview:self.horizontalMenu];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MPSHorizontalMenuDataSource

- (int)numberOfItemsForMenu:(MPSHorizontalMenu *)horizontalMenu {
    return [self.menuItems count];
}

- (NSString*)horizontalMenu:(MPSHorizontalMenu *)horizontalMenu titleForItemAtIndex:(NSUInteger)index {
	return [self.menuItems objectAtIndex:index];
}

#pragma mark - MPSHorizontalMenuDelegate

-(void)horizontalMenu:(MPSHorizontalMenu *)horizontalMenu itemSelectedAtIndex:(NSUInteger)index {
	if ([self.menuItems count] == 0) return;
	
	self.selectedItemLabel.text = [NSString stringWithFormat:@"Selected Item: %@\nSelected Index: %i", [self.menuItems objectAtIndex:index], index];
}

@end
