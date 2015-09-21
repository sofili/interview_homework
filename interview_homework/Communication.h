//
//  Communication.h
//  interview_homework
//
//  Created by Lee, Sophia on 9/20/15.
//  Copyright © 2015 Lee, Sophia. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CommunicationDelegate;

@interface Communication : NSObject
@property (weak, nonatomic) id<CommunicationDelegate> delegate;

-(void)getJSON;

@end
