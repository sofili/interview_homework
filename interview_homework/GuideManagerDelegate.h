//
//  GuideManagerDelegate.h
//  interview_homework
//
//  Created by Lee, Sophia on 9/20/15.
//  Copyright © 2015 Lee, Sophia. All rights reserved.
//

#import "GuideCollection.h"

@protocol GuideManagerDelegate

- (void)didReceiveGuide:(NSMutableDictionary *)guideDict;
- (void)fetchingFailedWithError:(NSError *)error;

@end