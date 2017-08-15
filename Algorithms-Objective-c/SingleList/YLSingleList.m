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

- (void)appendToHead:(id)value {
    if (!self.head) {
        self.head = [[YLSingleListNode alloc] initWithValue:value];
        self.tail = self.head;
    } else {
        YLSingleListNode *temp = [[YLSingleListNode alloc] initWithValue:value];
        temp.next = self.head;
        self.head = temp;
    }
    self.size++;
}

- (void)appendToTail:(id)value {
    if (!self.tail) {
        self.tail = [[YLSingleListNode alloc] initWithValue:value];
        self.head = self.tail;
    } else {
        self.tail.next = [[YLSingleListNode alloc] initWithValue:value];
        self.tail = self.tail.next;
    }
    self.size++;
}

- (YLSingleListNode *)searchListNodeInIndex:(NSInteger)index {
    YLSingleListNode *temp = self.head;
    if (index < 0 || index > self.size) {
        return nil;
    }
    
    for (int i = 0; i < index; i++) {
        temp = temp.next;
    }
    return temp;
}

- (BOOL)insertListNodeWithValue:(id)value index:(NSInteger)index {
    YLSingleListNode *node = [self searchListNodeInIndex:(index - 1)];
    if (!node) {
        return false;
    }
    
    YLSingleListNode *temp = [[YLSingleListNode alloc] initWithValue:value];
    temp.next = node.next;
    node.next = temp;
    
    self.size++;
    return true;
}

- (BOOL)deleteListNodeInIndex:(NSInteger)index {
    if (self.size == 0) {
        return false;
    }
    if (self.size == 1) {
        self.head = nil;
        self.tail = nil;
        self.size = 0;
        return true;
    }
    
    if (index == 0) {
        self.head = self.head.next;
        self.size--;
        return true;
    }
    
    YLSingleListNode *node = [self searchListNodeInIndex:(index - 1)];
    if (!node || !node.next) {
        return false;
    }
    if (!node.next.next) {
        self.tail = node;
        node.next = nil;
    } else {
        node.next = node.next.next;
    }
    self.size--;
    return true;
}

- (BOOL)changeListNodeWithValue:(id)value index:(NSInteger)index {
    YLSingleListNode *node = [self searchListNodeInIndex:index];
    if (!node) {
        return false;\
    }
    node.value = value;
    return true;
}

- (void)outputListNode {
    YLSingleListNode *temp = self.head;
    NSLog(@"Head is: %@----Tail is: %@-----Size is: %ld", self.head.value, self.tail.value, (long)self.size);
    while (temp) {
        NSLog(@"%@", temp.value);
        temp = temp.next;
    }
}

@end
