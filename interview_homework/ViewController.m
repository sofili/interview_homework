//
//  ViewController.m
//  interview_homework
//
//  Created by Lee, Sophia on 9/20/15.
//  Copyright © 2015 Lee, Sophia. All rights reserved.
//

#import "ViewController.h"
#import "GuideManager.h"
#import "GuideManagerDelegate.h"
#import "GuideCollection.h"
#import "Communication.h"

#import "TableCell.h"

@interface ViewController () <GuideManagerDelegate> {

    NSArray *guides;
    GuideManager *manager;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    manager = [[GuideManager alloc] init];
    //guidesModel = [[GuideCollection alloc] init];
    
    manager.communicator = [[Communication alloc] init];
    manager.communicator.delegate = manager;
    manager.delegate = self;
    
    guides = [[NSMutableArray alloc] init];
    
    [manager.communicator getJSON];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ManagerDelegate
- (void)didReceiveGuide:(GuideCollection *)guideCollection
{
    guides = guideCollection.guideArray;
    [self.tableView reloadData];

    NSLog(@"got data!");
}

- (void)fetchingFailedWithError:(NSError *)error
{
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
}

#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return guides.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    Guide *guide = guides[indexPath.row];
    [cell.nameLabel setText:guide.name];
    [cell.endDateLabel setText:guide.endDate];
    [cell.locationLabel setText:[NSString stringWithFormat:@"%@, %@", @"city", @"state"]];
    
    return cell;
}




@end
