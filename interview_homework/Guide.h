//
//  GuideClass.h
//  interview_homework
//
//  Created by Lee, Sophia on 9/20/15.
//  Copyright © 2015 Lee, Sophia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>

#import "Venue.h"

@protocol Guide
@end

@interface Guide : JSONModel

@property (nonatomic, assign) NSString<Optional> *startDate;
@property (nonatomic, assign) NSString<Optional> *endDate;
@property (nonatomic, strong) NSString<Optional> *name;
@property (nonatomic, strong) NSString<Optional> *url;
@property (nonatomic, strong) NSString<Optional> *login_required;
@property (nonatomic, strong) NSString<Optional> *objType;
@property (nonatomic, strong) NSString<Optional> *icon;

@property (nonatomic, strong) Venue<Optional> *venue;

@end
