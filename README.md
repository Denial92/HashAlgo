# HashAlgo
利用字典的hash算法设计，快速查找两个数组的交集。该demo还用二分查找算法设计了一个字典做对比

#### 核心代码
```
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
```
