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
	
	self.selected ? [self setSelectedColor] : [self setNormalColor];
}

- (void)setSelected:(BOOL)selected {
	[super setSelected:selected];
	
	if (selected) {
		[self setSelectedColor];
	} else {
		[self setNormalColor];
	}
}

- (void)setSelectedColor {
	self.backgroundColor = self.selectedBackgroundColor;
	self.titleLabel.textColor = self.selectedForegroundColor;
}

- (void)setNormalColor {
	self.backgroundColor = self.normalBackgroundColor;
	self.titleLabel.textColor = self.normalForegroundColor;
}

@end
