//
//  GuideManager.h
//  interview_homework
//
//  Created by Lee, Sophia on 9/20/15.
//  Copyright © 2015 Lee, Sophia. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "CommunicationDelegate.h"
#import "Communication.h"
#import "GuideCollection.h"
#import "GuideManagerDelegate.h"

@interface GuideManager : NSObject<CommunicationDelegate>
@property (strong, nonatomic) Communication *communicator;
@property (weak, nonatomic) id<GuideManagerDelegate> delegate;

-(void)getResponse;

@end
