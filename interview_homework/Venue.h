//
//  Venue.h
//  interview_homework
//
//  Created by Lee, Sophia on 9/20/15.
//  Copyright © 2015 Lee, Sophia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>


@protocol Venue
@end

@interface Venue : JSONModel

@property (nonatomic, assign) NSString<Optional> *venue;

@end
