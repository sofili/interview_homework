//
//  GuideManager.m
//  interview_homework
//
//  Created by Lee, Sophia on 9/20/15.
//  Copyright © 2015 Lee, Sophia. All rights reserved.
//

#import "GuideManager.h"

@implementation GuideManager


-(void)parseToDict : (GuideCollection *)guideCollection {
    //parse JSON response to dictionary, using startDate as key
    
    NSMutableDictionary *guideDict = [[NSMutableDictionary alloc] init];
    
    for (Guide * guide in guideCollection.guideArray) {
        
        NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"MMM dd, yyyy"];
        NSDate *startDate = [formatter dateFromString:guide.startDate];
        
        
        NSMutableArray *arrayForADate = [[NSMutableArray alloc] init];
        if ([guideDict objectForKey:startDate]) {
            
            arrayForADate = [guideDict objectForKey:startDate];
        }
        else {
            [guideDict setObject:arrayForADate forKey:startDate];
        }
        [arrayForADate addObject:guide];
  
    }
    
    [self.delegate didReceiveGuide:guideDict];
}


#pragma mark - CommunicatorDelegate

- (void)receivedJSON:(NSData *)data
{
    NSError *error = nil;
    
    GuideCollection *guideCollection = [[GuideCollection alloc] initWithData:data error:&error];
      
    if (error != nil) {
        [self.delegate fetchingFailedWithError:error];
        
    } else {
        [self parseToDict:guideCollection];
    }
}

- (void)fetchingFailedWithError:(NSError *)error
{
    [self.delegate fetchingFailedWithError:error];
}

@end
