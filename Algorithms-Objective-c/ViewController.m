//
//  ViewController.m
//  Algorithms-Objective-c
//
//  Created by yangli on 2017/8/14.
//  Copyright © 2017年 yangli. All rights reserved.
//

#import "ViewController.h"
#import "YLSingleList.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *testArray = @[@1, @2, @3, @4];
    NSLog(@"%ld", (long)[self binarySearchNoRecursionWithSource:testArray des:@3]);
    NSLog(@"%ld", (long)[self binarySearchRecursionWithSource:testArray des:@1]);
    
    NSMutableArray *bubbleArray = [@[@3, @1] mutableCopy];
    [self bubbleSortWithArray:bubbleArray];
    NSLog(@"%@", bubbleArray);
    
    NSMutableArray *quickArray = [@[@3, @2, @0, @90, @3, @35, @11, @5, @55] mutableCopy];
    [self quickSortWithArray:quickArray left:0 right:(quickArray.count - 1)];
    NSLog(@"%@", quickArray);
    
    NSLog(@"================================");
    YLSingleList *list = [[YLSingleList alloc] initList];
    [list appendToTail:@2];
    [list appendToTail:@24];
    [list appendToTail:@7];
    [list appendToTail:@4];
    [list outputListNode];
    NSLog(@"================================");
    [list insertListNodeWithValue:@11 index:2];
    [list outputListNode];
    NSLog(@"================================");
    [list deleteListNodeInIndex:0];
    [list outputListNode];
    NSLog(@"================================");
    [list changeListNodeWithValue:@13 index:1];
    [list outputListNode];
}

/*
 * 快速排序
 *
 */
- (void)quickSortWithArray:(NSMutableArray<NSNumber *> *)array left:(NSInteger)left right:(NSInteger)right {
    if (left >= right) {
        return;
    }
    
    NSInteger i = left;
    NSInteger j = right;
    NSInteger key = array[left].integerValue;
    
    while (i != j) {
        while (array[j].integerValue >= key && i < j) {
            j--;
        }
        while (array[i].integerValue <= key && i < j) {
            i++;
        }
        
        if (i < j) {
            NSNumber *temp = array[i];
            array[i] = array[j];
            array[j] = temp;
        }
    }
    
    array[left] = array[i];
    array[i] = [NSNumber numberWithInteger:key];
    [self quickSortWithArray:array left:left right:i - 1];
    [self quickSortWithArray:array left:i + 1 right:right];
}

/*
 * 冒泡排序
 *
 */
- (void)bubbleSortWithArray:(NSMutableArray<NSNumber *> *)array {
    for (int i = 0; i < array.count - 1; i++) {
        for (int j = 0; j < array.count - 1 - i; j++) {
            if (array[j] < array[j + 1]) {
                NSNumber *temp = array[j];
                array[j] = array[j + 1];
                array[j + 1] = temp;
            }
        }
    }
}


/*
 * 二分法搜索
 *
 */
- (NSInteger)binarySearchNoRecursionWithSource:(NSArray<NSNumber *> *)srcArray des:(NSNumber *)desNumber {
    if (!srcArray || [srcArray count] < 1 || !desNumber) {
        return -1;
    }
    NSInteger head = 0;
    NSInteger tail = [srcArray count] - 1;
    while (head <= tail) {
        NSInteger middle = head + ((tail - head) >> 1);
        if (desNumber.integerValue == srcArray[middle].integerValue) {
            return middle;
        } else if (desNumber.integerValue < srcArray[middle].integerValue) {
            tail = middle - 1;
        } else {
            head = middle + 1;
        }
    }
    return -1;
}

- (NSInteger)binarySearchRecursionWithSource:(NSArray<NSNumber *> *)srcArray des:(NSNumber *)desNumber {
    if (!srcArray || [srcArray count] < 1 || !desNumber) {
        return -1;
    }
    NSInteger head = 0;
    NSInteger tail = [srcArray count] - 1;
    return [self binarySearchWithSource:srcArray des:desNumber head:head tail:tail];
}

- (NSInteger)binarySearchWithSource:(NSArray<NSNumber *> *)srcArray des:(NSNumber *)desNumber head:(NSInteger)head tail:(NSInteger)tail {
    if (head <= tail) {
        NSInteger middle = head + ((tail - head) >> 1);
        if (desNumber.integerValue == srcArray[middle].integerValue) {
            return middle;
        } else if (desNumber.integerValue < srcArray[middle].integerValue) {
            return [self binarySearchWithSource:srcArray des:desNumber head:head tail:middle - 1];
        } else {
            return [self binarySearchWithSource:srcArray des:desNumber head:middle + 1 tail:tail];
        }
    } else {
        return -1;
    }
}

@end
