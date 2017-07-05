//
//  ZYImageDownloader.m
//  Pods
//
//  Created by luzhiyong on 2017/7/5.
//
//

#import "ZYImageDownloader.h"

#import <SDWebImage/SDWebImagePrefetcher.h>

@implementation ZYImageDownloader

/*
 *  批量下载图片资源
 *  imageURLs 图片地址数组 成员为String类型
 */
+ (void)downloadImagesWithURLs:(NSArray <NSString *> *)imageURLs {
    NSMutableArray *prefetchURLs = [NSMutableArray new];
    
    for (NSString *urlStr in imageURLs) {
        NSURL *url = [NSURL URLWithString:urlStr];
        if (url) {
            [prefetchURLs addObject:url];
        }
    }
    
    [[SDWebImagePrefetcher sharedImagePrefetcher] prefetchURLs:prefetchURLs];
}

/*
 *  根据图片地址获取图片
 *  imageURL 单个图片地址
 */
+ (UIImage *)imageForURL:(NSString *)imageURL {
    NSURL *url = [NSURL URLWithString:imageURL];
    NSString *key = [[SDWebImageManager sharedManager] cacheKeyForURL:url];
    UIImage *image = [[SDImageCache sharedImageCache] imageFromCacheForKey:key];
    return image;
}

@end
