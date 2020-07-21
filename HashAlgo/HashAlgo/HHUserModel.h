//
//  HHUserModel.h
//  HashAlgo
//
//  Created by hallfry on 2020/7/1.
//  Copyright © 2020 ZHIYUN. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HHUserModel : NSObject

@property (nonatomic, assign) NSInteger userId;
@property (nonatomic, strong) NSString *userName;

@property (nonatomic, assign) BOOL isSuperMan;
@property (nonatomic, assign) BOOL isSelected;

+ (HHUserModel *)userWithUserId:(NSInteger)userId;

@end

NS_ASSUME_NONNULL_END
