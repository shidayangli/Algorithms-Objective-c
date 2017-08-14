//
//  ViewController.m
//  Algorithms-Objective-c
//
//  Created by yangli on 2017/8/14.
//  Copyright © 2017年 yangli. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *testArray = @[@1, @2, @3, @4];
    NSLog(@"%ld", (long)[self binarySearchNoRecursionWithSource:testArray des:@3]);
    NSLog(@"%ld", (long)[self binarySearchRecursionWithSource:testArray des:@1]);
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
