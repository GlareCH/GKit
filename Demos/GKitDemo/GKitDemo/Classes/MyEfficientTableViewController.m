//
//  MyEfficientTableViewController.m
//  GKitDemo
//
//  Created by Hua Cao on 13-3-19.
//  Copyright (c) 2013年 Hoewo. All rights reserved.
//

#import "MyEfficientTableViewController.h"
#import "GCoreData.h"

@implementation MyEfficientTableViewController

#pragma mark - View Life Cycle
- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.fetchedResultsController = [GCoreData fetchedResultsForEntityName: @"Task"
															  withDelegate: self
																 predicate: nil
																sortByKeys: @[@"title"]
																ascendings: @[[NSNumber numberWithBool:YES]]
																 groupedBy: @"type"
																 cacheName: nil
																 inContext: self.fetchedResultsContext];
	[self reloadData];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *nextViewController = [[UIViewController alloc] init];
    [nextViewController setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:nextViewController animated:YES];
}

@end
