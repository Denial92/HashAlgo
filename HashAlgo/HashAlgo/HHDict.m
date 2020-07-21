//
//  HHDict.m
//  HashAlgo
//
//  Created by hallfry on 2020/7/1.
//  Copyright © 2020 ZHIYUN. All rights reserved.
//

#import "HHDict.h"

@interface HHDict()
@property (nonatomic, strong) NSMutableArray *lnhallKeys;
@property (nonatomic, strong) NSMutableArray *lnhallValues;


@end

@implementation HHDict

- (NSString *)description {
    NSMutableString *mutableStr = [[NSMutableString alloc]init];
    [mutableStr appendString:@"{\n"];
    for (int i = 0; i < self.allKeys.count; i++) {
        NSString *key = self.allKeys[i];
        NSString *value = self.allValues[i];
        [mutableStr appendFormat:@"%@ = %@, \n", key, value];
    }
    [mutableStr appendString:@"\n}"];
    return mutableStr;
}

- (BOOL)isIntType:(float)value {
    int small = floor(value);
    int large = ceil(value);
    
    if (value > small && value < large) {
        return NO;
    }
    return YES;
}

- (float)findObjectWithBeginIndex:(int)begin endIndex:(int)end key:(id)key {
    if (begin > end) { // 数组为nil
        return -1;
    }
    
    // 中间数
    if (end - begin == 1) {
        if ([key compare:self.allKeys[begin]] == 0) {
            return begin;
        } else if ([key compare:self.allKeys[end]] == 0) {
            return end;
        } else {
            return (begin + end)/2.0;
        }
    }
    
    // 边
    if ([key compare:self.allKeys[begin]] < 0) {
        return begin - 1;
    }
    
    if ([key compare:self.allKeys[end]] > 0) {
        return end + 1;
    }
    
    int middle = ceil((begin + end)/2.0);
    if ([key compare:self.allKeys[middle]] < 0) {
        return [self findObjectWithBeginIndex:begin endIndex:middle key:key];
    } else if ([key compare:self.allKeys[middle]] > 0) {
        return [self findObjectWithBeginIndex:middle endIndex:end key:key];
    } else {
        return middle;
    }
}


- (void)setObject:(id)anObject forKey:(id)aKey {
    float indexF = [self findObjectWithBeginIndex:0 endIndex:(int)self.allKeys.count - 1 key:aKey];
    if (indexF < 0) {
        [self.lnhallKeys insertObject:aKey atIndex:0];
        [self.lnhallValues insertObject:anObject atIndex:0];
    } else if (indexF > self.allKeys.count - 1) {
        [self.lnhallKeys addObject:aKey];
        [self.lnhallValues addObject:anObject];
    } else if (![self isIntType:indexF]) {
        [self.lnhallKeys insertObject:aKey atIndex:ceil(indexF)];
        [self.lnhallValues insertObject:anObject atIndex:ceil(indexF)];
    } else {
        [self.lnhallValues replaceObjectAtIndex:(int)indexF withObject:anObject];
    }
}

- (void)removeObjectForKey:(id)aKey {
    float indexF = [self findObjectWithBeginIndex:0 endIndex:(int)self.allKeys.count - 1 key:aKey];
    
    if ([self isIntType:indexF] && indexF >= 0 && indexF < self.allKeys.count) {
        [self.lnhallKeys removeObjectAtIndex:(int)indexF];
        [self.lnhallValues removeObjectAtIndex:(int)indexF];
    }
}

- (void)removeAllObjects {
    self.lnhallKeys = nil;
    self.lnhallValues = nil;
}

- (id)objectForKey:(id)aKey {
    float indexF = [self findObjectWithBeginIndex:0 endIndex:(int)self.allKeys.count - 1 key:aKey];
    if ([self isIntType:indexF] && indexF >= 0 && indexF < self.allKeys.count) {
        return self.allValues[(int)indexF];
    }
    
    return nil;
}

- (NSArray *)allKeys {
    return self.lnhallKeys;
}

- (NSArray *)allValues {
    return self.lnhallValues;
}

- (NSInteger)count {
    return self.allKeys.count;
}

- (NSMutableArray *)lnhallKeys {
    if (!_lnhallKeys) {
        _lnhallKeys = [NSMutableArray array];
    }
    return _lnhallKeys;
}

- (NSMutableArray *)lnhallValues {
    if (!_lnhallValues) {
        _lnhallValues = [NSMutableArray array];
    }
    return _lnhallValues;
}

@end
