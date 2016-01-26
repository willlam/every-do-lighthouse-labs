//
//  MyTaskCell.h
//  everydo
//
//  Created by William Lam on 2016-01-26.
//  Copyright © 2016 William Lam. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTaskCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *todoTitle;
@property (weak, nonatomic) IBOutlet UILabel *todoDescription;
@property (weak, nonatomic) IBOutlet UILabel *todoPriority;

@end
