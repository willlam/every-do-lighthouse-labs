//
//  DetailViewController.h
//  everydo
//
//  Created by William Lam on 2016-01-26.
//  Copyright © 2016 William Lam. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Todo;

@interface DetailViewController : UIViewController

//@property (strong, nonatomic) Todo *todoObject;
@property (strong, nonatomic) Todo *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *todoDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *todoTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *todoPriorityLabel;


@end

