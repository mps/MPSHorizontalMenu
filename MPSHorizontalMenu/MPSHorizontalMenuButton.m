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
	
	if (!self.bottomBorder) {
		self.bottomBorder = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 3, self.frame.size.width, 3)];
		self.bottomBorder.backgroundColor = [UIColor clearColor];
		[self addSubview:self.bottomBorder];
	}
	
	[self setTitleColor:self.selectedForegroundColor forState:UIControlStateHighlighted];
	
	self.selected ? [self setSelectedStyle] : [self setDefaultStyle];
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
	
	[self setFrameForView:self.bottomBorder height:3.0f];
	
	self.backgroundColor = self.normalBackgroundColor;
	
	self.titleLabel.font = [UIFont fontWithName:self.titleLabel.font.familyName size:14.0f];
	
	[self setTitleColor:self.normalForegroundColor forState:UIControlStateNormal];
	
	[self setTitleColor:self.normalForegroundColor forState:UIControlStateHighlighted];
	
	self.bottomBorder.backgroundColor = self.normalBottomBorderColor;
}

- (void)setSelectedStyle {
	[self setFrameForView:self height:self.defaultHeight + 1.0f];
	
	[self setFrameForView:self.bottomBorder height:4.0f];
	
	self.backgroundColor = self.selectedBackgroundColor;
	
	self.titleLabel.font = [UIFont fontWithName:self.titleLabel.font.familyName size:15.0f];
	
	[self setTitleColor:self.selectedForegroundColor forState:UIControlStateSelected];
	
	self.bottomBorder.backgroundColor = self.selectedBottomBorderColor;
}

- (void)setFrameForView:(UIView *)view height:(CGFloat)height {
	CGRect frame = view.frame;
	frame.size.height = height;
	view.frame = frame;
}

@end
