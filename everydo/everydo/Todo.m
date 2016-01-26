//
//  todo.m
//  everydo
//
//  Created by William Lam on 2016-01-26.
//  Copyright © 2016 William Lam. All rights reserved.
//

#import "Todo.h"

@implementation Todo

- (instancetype)initWithTitle:(NSString *)title
						description:(NSString *)todoDescription
						priority:(int)priority
						isCompleted:(BOOL)isCompleted
{
	self = [super init];
	if (self) {
		_title = title;
		_todoDescription = todoDescription;
		_priority = 0;
		_isCompleted = NO;
	}
	return self;
}

@end
