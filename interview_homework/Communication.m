//
//  Communication.m
//  interview_homework
//
//  Created by Lee, Sophia on 9/20/15.
//  Copyright © 2015 Lee, Sophia. All rights reserved.
//

#import "Communication.h"
#import "CommunicationDelegate.h"


@implementation Communication

-(void)getJSON {
    // Sending async request to the API
    NSString *urlAsString = @"https://www.guidebook.com/service/v2/upcomingGuides/";
    NSURL *url = [[NSURL alloc] initWithString:urlAsString];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *task = [session dataTaskWithURL:url
                                        completionHandler:
                                  ^(NSData *data, NSURLResponse *response, NSError *connectionError) {
                                      
                                      NSLog(@"HTTPS Response: %@", [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
                                      
                                      if (connectionError) {
                                          [self.delegate fetchingFailedWithError:connectionError];
                                      }
                                      else {
                                          [self.delegate receivedJSON:data];
                                      }
                                      
                                  }];
    
    [task resume];


}
@end
