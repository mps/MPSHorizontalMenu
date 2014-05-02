//
//  MPSHorizontalMenuButton.m
//  gitty
//
//  Created by Matthew Strickland on 4/11/14.
//  Copyright (c) 2014 Idle Fusion. All rights reserved.
//

#import "MPSHorizontalMenuButton.h"

@implementation MPSHorizontalMenuButton

- (void)awakeFromNib {
	[super awakeFromNib];
	
	[self baseInit];
}

- (id)initWithFrame:(CGRect)frame {
	if (self = [super initWithFrame:frame]) {
		[self baseInit];
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		[self baseInit];
	}
	return self;
}

- (void)baseInit {
	self.defaultHeight = self.frame.size.height;
	
	if (!self.customBorder) {
		self.customBorder = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 3, self.frame.size.width, 3)];
		self.customBorder.backgroundColor = [UIColor clearColor];
		[self addSubview:self.customBorder];
	}
	
	[self setTitleColor:self.selectedForegroundColor forState:UIControlStateHighlighted];
	
	self.selected ? [self setSelectedStyle] : [self setDefaultStyle];
}

- (void)setTopBorder:(BOOL)topBorder {
	_topBorder = topBorder;
	
	if (self.topBorder) {
		self.customBorder.frame = CGRectMake(0, 0, self.frame.size.width, 3);
	} else {
		self.customBorder.frame = CGRectMake(0, self.frame.size.height - 3, self.frame.size.width, 3);
	}
}

- (void)setSelected:(BOOL)selected {
	[super setSelected:selected];
	
	if (selected) {
		[self setSelectedStyle];
	} else {
		[self setDefaultStyle];
	}
}

- (void)setDefaultStyle {
	[self setFrameForView:self height:self.defaultHeight];
	
	[self setFrameForView:self.customBorder height:3.0f];
	
	self.backgroundColor = self.normalBackgroundColor;
	
	self.titleLabel.font = [UIFont fontWithName:self.titleLabel.font.familyName size:14.0f];
	
	[self setTitleColor:self.normalForegroundColor forState:UIControlStateNormal];
	
	[self setTitleColor:self.normalForegroundColor forState:UIControlStateHighlighted];
	
	self.customBorder.backgroundColor = self.normalBorderColor;
}

- (void)setSelectedStyle {
	[self setFrameForView:self height:self.defaultHeight + 1.0f];
	
	[self setFrameForView:self.customBorder height:4.0f];
	
	self.backgroundColor = self.selectedBackgroundColor;
	
	self.titleLabel.font = [UIFont fontWithName:self.titleLabel.font.familyName size:15.0f];
	
	[self setTitleColor:self.selectedForegroundColor forState:UIControlStateSelected];
	
	self.customBorder.backgroundColor = self.selectedBorderColor;
}

- (void)setFrameForView:(UIView *)view height:(CGFloat)height {
	CGRect frame = view.frame;
	frame.size.height = height;
	view.frame = frame;
}

@end
