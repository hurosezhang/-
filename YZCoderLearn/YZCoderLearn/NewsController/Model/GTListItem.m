//
//  GTListItem.m
//  YZCoderLearn
//
//  Created by jonzhang on 2019/7/2.
//  Copyright © 2019 xinmei. All rights reserved.
//

#import "GTListItem.h"

@implementation GTListItem
- (void)configWithDictionary:(NSDictionary *)dictionary
{
#warning 类型是否匹配

    self.category = [dictionary objectForKey:@"category"];
    self.picUrl = [dictionary objectForKey:@"thumbnail_pic_s"];
    self.uniqueKey = [dictionary objectForKey:@"uniquekey"];
    self.title = [dictionary objectForKey:@"title"];
    self.date = [dictionary objectForKey:@"date"];
    self.authorName = [dictionary objectForKey:@"author_name"];
    self.articleUrl = [dictionary objectForKey:@"url"];
}

@end
