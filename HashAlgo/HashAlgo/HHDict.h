//
//  HHDict.h
//  HashAlgo
//
//  Created by hallfry on 2020/7/1.
//  Copyright © 2020 ZHIYUN. All rights reserved.
//  二分查找算法设计dict

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHDict <KeyType, ObjectType> : NSObject

@property (nonatomic, strong, readonly) NSArray <KeyType> *allKeys;
@property (nonatomic, strong, readonly) NSArray <ObjectType> *allValues;
@property (nonatomic, assign, readonly) NSInteger count;

- (void)setObject:(nullable ObjectType)anObject forKey:(nullable KeyType)aKey;

- (void)removeObjectForKey:(nullable KeyType)aKey;
- (void)removeAllObjects;

- (nullable ObjectType)objectForKey:(KeyType)aKey;

@end

NS_ASSUME_NONNULL_END
