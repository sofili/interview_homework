//
//  GuideCollection.m
//  interview_homework
//
//  Created by Lee, Sophia on 9/20/15.
//  Copyright © 2015 Lee, Sophia. All rights reserved.
//

#import "GuideCollection.h"

@implementation GuideCollection

+(JSONKeyMapper*)keyMapper
{
    JSONKeyMapper *jsonKeyMapper = [[JSONKeyMapper alloc] initWithDictionary:@{@"data":propertyAsString(guideArray)}];
    return jsonKeyMapper;
}

@end
