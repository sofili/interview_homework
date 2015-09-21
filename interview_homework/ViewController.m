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

@interface ViewController () <GuideManagerDelegate> {

    GuideManager *manager;
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
    
    [manager.communicator getJSON];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MeetupManagerDelegate
- (void)didReceiveGuide:(GuideCollection *)guideCollection
{
    NSLog(@"got data!");
}

- (void)fetchingFailedWithError:(NSError *)error
{
    NSLog(@"Error %@; %@", error, [error localizedDescription]);
}



@end
