//
//  YLSingleListNode.m
//  Algorithms-Objective-c
//
//  Created by 杨立 on 2017/8/14.
//  Copyright © 2017年 yangli. All rights reserved.
//

#import "YLSingleListNode.h"

@implementation YLSingleListNode

- (instancetype)initWithValue:(id)value {
    self = [super init];
    if (self) {
        _value = value;
        _next = nil;
    }
    return self;
}

@end
