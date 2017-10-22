//
//  UIImageView+CXSAdd.m
//  Pomodoroom
//
//  Created by chenxiaosong on 2017/5/26.
//  Copyright © 2017年 chen xiaosong. All rights reserved.
//

#import "UIImageView+CXSAdd.h"

//#import <SDWebImage/UIImageView+WebCache.h>

#import "NSURL+CXSAdd.h"

@implementation UIImageView (CXSAdd)

//stony comment
//- (void)withObject:(id)obj andDefaultImg:(NSString*)defaultImg sucBlock:(void (^)())sucBlock
//{
//    if([obj isKindOfClass:[NSString class]])
//    {
//        NSString *resource = obj;
//        self.image = [UIImage imageNamed:resource];
//
//    } else if ([obj isKindOfClass:[NSURL class]]) {
//        NSURL *imgUrl = obj;
//        if([imgUrl isFileURL])
//        {
//            self.image = [UIImage imageWithContentsOfFile:[imgUrl path]];
//        } else {
//            //如果图片没缓存过，就设置默认图片
//            NSString *urlStr = [imgUrl absoluteString];
//
//            NSString *realUrlStr = [[NSURL imgUrl:urlStr] absoluteString];
//
//            [[SDImageCache sharedImageCache] diskImageExistsWithKey:realUrlStr completion:^(BOOL isInCache) {
//
//                if(isInCache) {
//                    UIImage *currentImg = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:realUrlStr];
//
//                    self.image = currentImg;
//                } else {
//                    self.image = [UIImage imageNamed:defaultImg];
//                }
//
//                if(sucBlock) sucBlock();
//
//            }];
//
//
//        }
//    } else {
//        NSAssert(NO, @"wrong case");
//    }
//
//}

//- (void)withUrlObject:(id)obj sucBlock:(void (^)())sucBlock
//{
//    if([obj isKindOfClass:[NSString class]])
//    {
//        
//    } else if ([obj isKindOfClass:[NSURL class]]) {
//        NSURL *imgUrl = obj;
//        if([imgUrl isFileURL])
//        {
//
//        } else {
//            //有缓存，则设置图片
//            NSString *urlStr = [imgUrl absoluteString];
//            NSString *realUrlStr = [[NSURL imgUrl:urlStr] absoluteString];
//
//            [[SDImageCache sharedImageCache] diskImageExistsWithKey:realUrlStr completion:^(BOOL isInCache) {
//                
//                if(isInCache) {
//                    UIImage *currentImg = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:realUrlStr];
//                    
//                    self.image = currentImg;
//                } else {
//                    
//                }
//                
//                if(sucBlock) sucBlock();
//            }];
//
//
//        }
//    } else {
//        NSAssert(NO, @"wrong case");
//    }
//    
//}

@end
