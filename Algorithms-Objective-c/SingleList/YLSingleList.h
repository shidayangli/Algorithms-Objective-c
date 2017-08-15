//
//  YLSingleList.h
//  Algorithms-Objective-c
//
//  Created by 杨立 on 2017/8/15.
//  Copyright © 2017年 yangli. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YLSingleListNode;

@interface YLSingleList : NSObject

- (instancetype)initList;
// 尾插法
- (void)appendToTail:(id)value;
// 头插法
- (void)appendToHead:(id)value;
// 返回给定位置的节点
- (YLSingleListNode *)searchListNodeInIndex:(NSInteger)index;
// 向指定的位置插入节点
- (BOOL)insertListNodeWithValue:(id)value index:(NSInteger)index;
// 删除指定位置节点
- (BOOL)deleteListNodeInIndex:(NSInteger)index;
// 修改指定位置的节点值
- (BOOL)changeListNodeWithValue:(id)value index:(NSInteger)index;
// 输出链表
- (void)outputListNode;
// 翻转链表
- (void)reverseList;

@end
