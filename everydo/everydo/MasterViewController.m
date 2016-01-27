//
//  MasterViewController.m
//  everydo
//
//  Created by William Lam on 2016-01-26.
//  Copyright © 2016 William Lam. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "MyTaskCell.h"
#import "Todo.h"
#import "AddItemViewController.h"


// 3
@interface MasterViewController () <UITableViewDataSource, UITableViewDelegate, AddItemViewControllerDelegate>

@property (strong, nonatomic) IBOutlet UITableView *todoTable;
@property NSMutableArray *objects;
@property NSMutableArray *todoObjects;


@end

@implementation MasterViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.todoObjects = [NSMutableArray array];
	
	Todo *todo1 = [[Todo alloc] initWithTitle:@"Buy an orange thing" description:@"Orange things are fun" priority:3 isCompleted:NO];
	Todo *todo2 = [[Todo alloc] initWithTitle:@"Learn Objective-C" description:@"Learn in the inner workings of building apps in Objective-C at Lighthouse Labs" priority:3 isCompleted:NO];
	Todo *todo3 = [[Todo alloc] initWithTitle:@"Learn Table Views" description:@"A description about the table view task" priority:3 isCompleted:NO];
	
	[self.todoObjects addObjectsFromArray:@[todo1, todo2, todo3]];
	
	self.todoTable.dataSource = self;
	self.todoTable.delegate = self;
	
	
	
	
	// Do any additional setup after loading the view, typically from a nib.
//	self.navigationItem.leftBarButtonItem = self.editButtonItem;
//
//	UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//	self.navigationItem.rightBarButtonItem = addButton;
	self.detailViewController = (DetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
}

- (void)viewWillAppear:(BOOL)animated {
	self.clearsSelectionOnViewWillAppear = self.splitViewController.isCollapsed;
	[super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

//- (void)insertNewObject:(id)sender {
//	if (!self.objects) {
//	    self.objects = [[NSMutableArray alloc] init];
//	}
//	[self.objects insertObject:[NSDate date] atIndex:0];
//	NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//	[self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//}

#pragma mark - Delegates
// 4

- (void)addItem:(AddItemViewController *)addItem dismissWithTitle:(NSString *)title desc:(NSString *)desc priority:(int)priority {
	Todo *todo = [[Todo alloc] initWithTitle:title description:desc priority:priority isCompleted:NO];
	[self.todoObjects insertObject:todo atIndex:0];
	
	[self.tableView reloadData];
	
}



#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([[segue identifier] isEqualToString:@"showDetail"]) {
	    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
	    Todo *selectedTodo = self.todoObjects[indexPath.row];
	    DetailViewController *controller = (DetailViewController *)[[segue destinationViewController] topViewController];
	    [controller setDetailItem:selectedTodo];
//		DetailViewController *dvc = (DetailViewController *)segue.destinationViewController;
//		dvc.detailItem = selectedTodo;

	    controller.navigationItem.leftBarButtonItem = self.splitViewController.displayModeButtonItem;
	    controller.navigationItem.leftItemsSupplementBackButton = YES;
	}
	if ([segue.identifier isEqualToString:@"AddItem"]) {
		AddItemViewController *addItem = segue.destinationViewController;
		addItem.delegate = self;
	}
}

#pragma mark - Table View

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//	return 1;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return self.todoObjects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	MyTaskCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TodoCell" forIndexPath:indexPath];
	
	Todo *currentTodo = self.todoObjects[indexPath.row];

	cell.todoTitle.text = currentTodo.title;
	cell.todoDescription.text = currentTodo.todoDescription;
	
	//  putting the raw int value of currentTodo.priority into literal notation to create an object and setting the property to string value so it can evaluate propertly.
	cell.todoPriority.text = @(currentTodo.priority).stringValue;
	
	
	return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
	// Return NO if you do not want the specified item to be editable.
	return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	if (editingStyle == UITableViewCellEditingStyleDelete) {
	    [self.objects removeObjectAtIndex:indexPath.row];
	    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
	} else if (editingStyle == UITableViewCellEditingStyleInsert) {
	    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
	}
}

@end
