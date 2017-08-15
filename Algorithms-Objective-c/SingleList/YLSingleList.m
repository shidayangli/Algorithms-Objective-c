//
//  YLSingleList.m
//  Algorithms-Objective-c
//
//  Created by 杨立 on 2017/8/15.
//  Copyright © 2017年 yangli. All rights reserved.
//

#import "YLSingleList.h"
#import "YLSingleListNode.h"

@interface YLSingleList ()

@property (nonatomic, strong) YLSingleListNode *head;
@property (nonatomic, strong) YLSingleListNode *tail;
@property (nonatomic, assign) NSInteger size;

@end

@implementation YLSingleList

- (instancetype)initList {
    self = [super init];
    if (self) {
        _head = nil;
        _tail = nil;
        _size = 0;
    }
    return self;
}



@end
