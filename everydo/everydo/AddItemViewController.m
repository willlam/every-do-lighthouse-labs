//
//  AddItemViewController.m
//  everydo
//
//  Created by William Lam on 2016-01-26.
//  Copyright © 2016 William Lam. All rights reserved.
//

#import "AddItemViewController.h"
#import "Todo.h"

@interface AddItemViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *descriptionLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (weak, nonatomic) IBOutlet UIButton *save;
@property (weak, nonatomic) IBOutlet UIButton *cancel;

@end

@implementation AddItemViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)cancelButtonPressed:(UIButton *)sender {
}

- (IBAction)saveButtonPressed:(UIButton *)sender {
		
	[self.delegate addItem:self dismissWithTitle:self.titleLabel.text desc:self.descriptionLabel.text priority:(int)self.segmentedControl.selectedSegmentIndex +1];
	[self dismissViewControllerAnimated:YES completion:nil];


}

@end
