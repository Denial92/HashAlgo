//
//  ViewController.m
//  HashAlgo
//
//  Created by hallfry on 2020/7/1.
//  Copyright © 2020 ZHIYUN. All rights reserved.
//

#import "ViewController.h"
#import "HHUserModel.h"
#import "HHDict.h"


@interface ViewController ()

@property (nonatomic, strong) NSMutableArray <HHUserModel *> *biggerArray;
@property (nonatomic, strong) NSMutableArray <HHUserModel *> *smallArray;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HHDict<NSString *, NSString *> *dic = [HHDict new];
    
    [dic setObject:@"dddd" forKey:@"a"];
    [dic setObject:@"aaaaa" forKey:@"b"];
    [dic setObject:@"sssss" forKey:@"a"];
    [dic setObject:@"uuuu" forKey:@"12"];
    
    [dic setObject:@"bbbb" forKey:@"b"];
    
//    [dic removeObjectForKey:@"b"];
    
//    NSLog(@"%@", [dic objectForKey:@"b"]);
    NSLog(@"%@", dic);
}

- (IBAction)normalAction:(id)sender {
    
    [self normalTest];
}


- (IBAction)hashAction:(id)sender {
    
    [self hashTest];
}

- (IBAction)myDictAction:(id)sender {
    [self myDictTest];
}


- (void)normalTest {
    NSTimeInterval before = [[NSDate date] timeIntervalSince1970];
    
    NSMutableArray <HHUserModel *> *resultArray = [NSMutableArray array];
    
    for (NSInteger i = 0; i < self.biggerArray.count; i++) {
        HHUserModel *user = self.biggerArray[i];
        
        for (NSInteger j = 0; j < self.smallArray.count; j++) {
            HHUserModel *currentUser = self.smallArray[j];
            
            if (currentUser.userId == user.userId) {
                [resultArray addObject:currentUser];
                break;
            }
        }
    }
    
    NSTimeInterval after = [[NSDate date] timeIntervalSince1970];
    NSLog(@"normalTest time: %f count:%ld",after - before, resultArray.count);
}

- (void)hashTest {
    NSTimeInterval before = [[NSDate date] timeIntervalSince1970];
    
    NSMutableArray <HHUserModel *> *resultArray = [NSMutableArray array];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    
    for (NSInteger i = 0; i < self.smallArray.count; i++) {
        HHUserModel *user = self.smallArray[i];
        dic[@(user.userId)] = @"h";
    }
    
    for (NSInteger i = 0; i < self.biggerArray.count; i++) {
        HHUserModel *user = self.biggerArray[i];
        if ([dic[@(user.userId)] isEqualToString:@"h"]) {
            // 可以做一些操作
//            user.isSuperMan = YES;
            [resultArray addObject:user];
        } else {
//            user.isSuperMan = NO;
        }
    }
    
    NSTimeInterval after = [[NSDate date] timeIntervalSince1970];
    NSLog(@"hashTest time: %f count:%ld",after - before, resultArray.count);
}

- (void)myDictTest {
    NSTimeInterval before = [[NSDate date] timeIntervalSince1970];
    
    NSMutableArray <HHUserModel *> *resultArray = [NSMutableArray array];
    HHDict *dic = [HHDict new];
    
    for (NSInteger i = 0; i < self.smallArray.count; i++) {
        HHUserModel *user = self.smallArray[i];
        [dic setObject:@"h" forKey:@(user.userId)];
    }
    
    for (NSInteger i = 0; i < self.biggerArray.count; i++) {
        HHUserModel *user = self.biggerArray[i];
        if ([[dic objectForKey:@(user.userId)] isEqualToString:@"h"]) {
            [resultArray addObject:user];
        }
    }
    
    NSTimeInterval after = [[NSDate date] timeIntervalSince1970];
    NSLog(@"myDictTest time: %f count:%ld",after - before, resultArray.count);
}


- (NSMutableArray<HHUserModel *> *)biggerArray {
    if (!_biggerArray) {
        _biggerArray = [NSMutableArray array];
        
        for (int i = 0; i < 10000; i ++) {
            [_biggerArray addObject:[HHUserModel userWithUserId:[self getRandomNumber:0 to:10000]]];
        }
    }
    return _biggerArray;
}

- (NSMutableArray<HHUserModel *> *)smallArray {
    if (!_smallArray) {
        _smallArray = [NSMutableArray array];
        
        for (int i = 0; i < 1000; i ++) {
            [_smallArray addObject:[HHUserModel userWithUserId:[self getRandomNumber:12 to:1000]]];
        }
    }
    return _smallArray;
}

- (NSInteger)getRandomNumber:(int)from to:(int)to {
    return (NSInteger)(from + (arc4random() % (to - from + 1)));
}

@end
