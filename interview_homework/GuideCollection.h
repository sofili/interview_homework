//
//  GuideCollection.h
//  interview_homework
//
//  Created by Lee, Sophia on 9/20/15.
//  Copyright © 2015 Lee, Sophia. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JSONModel/JSONModel.h>
#import "Guide.h"

#define propertyAsString(property) NSStringFromSelector(@selector(property))

@interface GuideCollection : JSONModel

@property(nonatomic, retain) NSArray<Guide, Optional> *guideArray;
@property(nonatomic, retain) NSString<Optional> *total;

@end
