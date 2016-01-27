//
//  AddItemViewController.h
//  everydo
//
//  Created by William Lam on 2016-01-26.
//  Copyright © 2016 William Lam. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddItemViewController;
// 1
@protocol AddItemViewControllerDelegate <NSObject>

//- (void)addItem:(NSString *)addItemViewController

- (void)addItem:(AddItemViewController *)addItem dismissWithTitle:(NSString *)title desc:(NSString *)desc priority:(int)priority;

@end

@interface AddItemViewController : UIViewController

//2
@property (nonatomic, weak) id <AddItemViewControllerDelegate> delegate;

@end
