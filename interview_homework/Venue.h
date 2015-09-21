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

@property (nonatomic, strong) NSString<Optional> *city;
@property (nonatomic, strong) NSString<Optional> *state;

@end
