//
//  GuideManager.m
//  interview_homework
//
//  Created by Lee, Sophia on 9/20/15.
//  Copyright © 2015 Lee, Sophia. All rights reserved.
//

#import "GuideManager.h"

@implementation GuideManager


-(void)getResponse {

}


#pragma mark - CommunicatorDelegate

- (void)receivedJSON:(NSData *)data
{
    NSError *error = nil;
    
    GuideCollection *guideCollection = [[GuideCollection alloc] initWithData:data error:&error];
      
    if (error != nil) {
        [self.delegate fetchingFailedWithError:error];
        
    } else {
        [self.delegate didReceiveGuide:guideCollection];
    }
}

- (void)fetchingFailedWithError:(NSError *)error
{
    [self.delegate fetchingFailedWithError:error];
}

@end
