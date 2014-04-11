//
//  MPSHorizontalMenu.m
//  gitty
//
//  Created by Matthew Strickland.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "MPSHorizontalMenu.h"

#define kButtonBaseTag 10000
#define kLeftOffset 10

@implementation MPSHorizontalMenu

- (void)baseInit {
	
	self.backgroundColor = [UIColor lightGrayColor];
	self.itemNormalBackgroundColor = [UIColor clearColor];
	self.itemNormalForegroundColor = [UIColor whiteColor];
	self.itemSelectedBackgroundColor = [UIColor blackColor];
	self.itemSelectedForegroundColor = [UIColor whiteColor];
	self.cornerRadius = 2.0f;
	
	self.bounces = YES;
	self.scrollEnabled = YES;
	self.alwaysBounceHorizontal = YES;
	self.alwaysBounceVertical = NO;
	self.showsHorizontalScrollIndicator = NO;
	self.showsVerticalScrollIndicator = NO;
	self.backgroundColor = [UIColor blackColor];
	
	[self reloadData];
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		[self baseInit];
	}
	return self;
}

- (id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		[self baseInit];
	}
	return self;
}

- (void)awakeFromNib {
    [self baseInit];
}

- (void)reloadData {
	NSArray *viewsToRemove = [self subviews];
	[viewsToRemove makeObjectsPerformSelector:@selector(removeFromSuperview)];
	
    self.itemCount = [self.dataSource numberOfItemsForMenu:self];
	
    UIFont *buttonFont = [UIFont boldSystemFontOfSize:15];
    int buttonPadding = 20;
    
    int tag = kButtonBaseTag;
    int xPos = kLeftOffset;
	
    for(int i = 0 ; i < self.itemCount; i ++) {
        NSString *title = [self.dataSource horizontalMenu:self titleForItemAtIndex:i];
        MPSHorizontalMenuButton *customButton = [MPSHorizontalMenuButton buttonWithType:UIButtonTypeCustom];
        [customButton setTitle:title forState:UIControlStateNormal];
        customButton.titleLabel.font = buttonFont;
		
		if (self.selectedImage) {
			[customButton setBackgroundImage:self.selectedImage forState:UIControlStateSelected];
		} else {
			[customButton setNormalBackgroundColor:self.itemNormalBackgroundColor];
			[customButton setNormalForegroundColor:self.itemNormalForegroundColor];
			[customButton setSelectedBackgroundColor:self.itemSelectedBackgroundColor];
			[customButton setSelectedForegroundColor:self.itemSelectedForegroundColor];
		}
		
		customButton.layer.cornerRadius = self.cornerRadius;
        
        customButton.tag = tag++;
        [customButton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
		
		CGRect buttonWidthRect = [title boundingRectWithSize:CGSizeMake(150, 28)
													 options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
												  attributes:@{NSFontAttributeName:customButton.titleLabel.font}
													 context:nil];
        
        CGFloat buttonWidth = buttonWidthRect.size.width;
        
        customButton.frame = CGRectMake(xPos, 7, buttonWidth + buttonPadding, 28);
        xPos += buttonWidth;
        xPos += buttonPadding;
        [self addSubview:customButton];
    }
	
    self.contentSize = CGSizeMake(xPos, 41);
	
    [self layoutSubviews];
}

- (void)setSelectedIndex:(int)index animated:(BOOL)animated {
	[self deSelectAllButtons];
	
    UIButton *thisButton = (UIButton*) [self viewWithTag:index + kButtonBaseTag];
    thisButton.selected = YES;
    [self setContentOffset:CGPointMake(thisButton.frame.origin.x - kLeftOffset, 0) animated:animated];
    [self.itemSelectedDelegate horizontalMenu:self itemSelectedAtIndex:index];
}

- (void)deSelectAllButtons {
	for (UIView *v in self.subviews) {
		if (![v isKindOfClass:[UIButton class]]) continue;
		
		UIButton *btn = (UIButton *)v;
		if (!btn) continue;
		
		btn.selected = NO;
	}
}

- (void)buttonTapped:(id)sender {
    UIButton *button = (UIButton*) sender;
    
    for(int i = 0; i < self.itemCount; i++) {
        UIButton *thisButton = (UIButton*) [self viewWithTag:i + kButtonBaseTag];
        if(i + kButtonBaseTag == button.tag) {
            thisButton.selected = YES;
		} else {
            thisButton.selected = NO;
		}
    }
    
    [self.itemSelectedDelegate horizontalMenu:self itemSelectedAtIndex:button.tag - kButtonBaseTag];
}

@end
