//
//  MPSHorizontalMenuButton.h
//  gitty
//
//  Created by Matthew Strickland on 4/11/14.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MPSHorizontalMenuButton : UIButton

@property (nonatomic, strong) UIView *bottomBorder;

@property (nonatomic) CGFloat defaultHeight;

@property (nonatomic, strong) UIColor *normalBackgroundColor;

@property (nonatomic, strong) UIColor *normalBottomBorderColor;

@property (nonatomic, strong) UIColor *normalForegroundColor;

@property (nonatomic, strong) UIColor *selectedBackgroundColor;

@property (nonatomic, strong) UIColor *selectedForegroundColor;

@property (nonatomic, strong) UIColor *selectedBottomBorderColor;

@end
