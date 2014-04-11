//
//  ViewController.h
//  MPSHorizontalMenuDemo
//
//  Created by Matthew Strickland on 4/11/14.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MPSHorizontalMenu.h"

@interface ViewController : UIViewController<MPSHorizontalMenuDataSource, MPSHorizontalMenuDelegate>

@property (nonatomic, weak) IBOutlet UILabel *selectedItemLabel;

@property (nonatomic, strong) MPSHorizontalMenu *horizontalMenu;

@property (nonatomic, strong) NSMutableArray *menuItems;

@end
