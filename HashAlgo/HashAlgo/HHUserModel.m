//
//  HHUserModel.m
//  HashAlgo
//
//  Created by hallfry on 2020/7/1.
//  Copyright © 2020 ZHIYUN. All rights reserved.
//

#import "HHUserModel.h"

@implementation HHUserModel

+ (HHUserModel *)userWithUserId:(NSInteger)userId {
    HHUserModel *model = [[HHUserModel alloc] init];
    model.userId = userId;
    model.userName = [NSString stringWithFormat:@"hhhh  %ld", userId];
    
    return model;
}

@end
