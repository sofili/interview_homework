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

    NSMutableDictionary *_guideDict;
    GuideManager *manager;
    NSArray *sortedDays;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    manager = [[GuideManager alloc] init];
    manager.communicator = [[Communication alloc] init];
    manager.communicator.delegate = manager;
    manager.delegate = self;
    
    _guideDict = [[NSMutableDictionary alloc] init];
    
    [manager.communicator getJSON];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ManagerDelegate
- (void)didReceiveGuide:(NSMutableDictionary *)guideDict {
    
    _guideDict = guideDict;
    
    NSArray * unSortedDateArray = [guideDict allKeys];
    sortedDays = [unSortedDateArray sortedArrayUsingSelector:@selector(compare:)];
    
    [self.tableView reloadData];
}

- (void)fetchingFailedWithError:(NSError *)error
{
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [_guideDict count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDate *thisDate = [sortedDays objectAtIndex:section];
    NSArray *eventsOnThisDay = [_guideDict objectForKey:thisDate];
    return [eventsOnThisDay count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSDate *thisDate = [sortedDays objectAtIndex:section];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMM dd, yyyy"];
    
    return [formatter stringFromDate:thisDate];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDate *thisDay = [sortedDays objectAtIndex:indexPath.section];
    NSArray *eventsOnThisDay = [_guideDict objectForKey:thisDay];
    
    Guide * guide = [eventsOnThisDay objectAtIndex:indexPath.row];
    [cell.nameLabel setText:guide.name];
    [cell.endDateLabel setText:guide.endDate];
    [cell.cityLabel setText:guide.venue.city];
    
    if (guide.venue.city && guide.venue.state) {
        [cell.stateLabel setText:[NSString stringWithFormat:@", %@", guide.venue.state]];
    }
    else {
        [cell.stateLabel setText:guide.venue.state];
    }
    
    return cell;
}




@end
