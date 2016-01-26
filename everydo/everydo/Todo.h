//
//  todo.h
//  everydo
//
//  Created by William Lam on 2016-01-26.
//  Copyright © 2016 William Lam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Todo : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *todoDescription;
@property (nonatomic) int priority;
@property (nonatomic) BOOL isCompleted;

- (instancetype)initWithTitle:(NSString *)title
						description:(NSString *)description
						priority:(int)priority
						isCompleted:(BOOL)isCompleted;


@end
