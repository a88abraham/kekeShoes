//
//  MoreCotentNetManager.m
//  kekeShoes
//
//  Created by 贺恩发 on 16/3/7.
//  Copyright © 2016年 kknx. All rights reserved.
//

#import "MoreCotentNetManager.h"
//#import "ContentsModel.h"


#define kURLPath @"http://mobile.ximalaya.com/mobile/discovery/v2/category/recommends"

#define kURLVersion @"version":@"4.3.26.2"
#define kURLDevice @"device":@"ios"
#define KURLScale @"scale":@2
#define kURLCalcDimension @"calcDimension":@"hot"
#define kURLPageID @"pageId":@1
#define kURLStatus  @"status":@0
#define KURLPer_page @"per_page":@10
#define kURLPosition @"position":@1
// 汉字UTF8进行转换并转入字典
#define kURLMoreTitle @"title":[@"更多" stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]

@implementation MoreCotentNetManager



/** 解析,获取内容推荐数据模型 */
// http://mobile.ximalaya.com/mobile/discovery/v2/category/recommends?categoryId=1&contentType=album&device=android&scale=2&version=4.3.32.2
+ (id)getContentsForForCategoryId:(NSInteger)categoryID contentType:(NSString*)type completionHandle:(void(^)(id responseObject, NSError *error))completed {
    NSDictionary *params = @{@"categoryId":@(categoryID),@"contentType":type,kURLDevice,KURLScale,kURLVersion};
    return [self GET:kURLPath parameters:params complationHandle:^(id responseObject, NSError *error) {
       // completed([ContentsModel mj_objectWithKeyValues:responseObject],error);
    }];
}




@end
