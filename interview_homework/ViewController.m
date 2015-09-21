//
//  ViewController.m
//  interview_homework
//
//  Created by Lee, Sophia on 9/20/15.
//  Copyright © 2015 Lee, Sophia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self fetchJSON];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fetchJSON {
    
    
    NSString *urlAsString = @"https://www.guidebook.com/service/v2/upcomingGuides/";
    NSURL *url = [[NSURL alloc] initWithString:urlAsString];
    NSLog(@"%@", urlAsString);
    
    NSURLSession *session = [NSURLSession sharedSession];

    NSURLSessionDataTask *task = [session dataTaskWithURL:url
                                            completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *connectionError) {
                                      
                                      NSLog(@"HTTPS Response: %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                                      
                                  }];
    
    [task resume];

}

@end
