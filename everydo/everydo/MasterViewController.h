//
//  MasterViewController.h
//  everydo
//
//  Created by William Lam on 2016-01-26.
//  Copyright © 2016 William Lam. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Todo.h"
#import "MyTaskCell.h"

@class DetailViewController;

@interface MasterViewController : UITableViewController


@property (strong, nonatomic) DetailViewController *detailViewController;


@end

