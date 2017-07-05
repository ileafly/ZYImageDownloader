//
//  ZYImageDownloader.h
//  Pods
//
//  Created by luzhiyong on 2017/7/5.
//
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface ZYImageDownloader : NSObject

/*
 *  批量下载图片资源
 *  imageURLs 图片地址数组 成员为String类型
 */
+ (void)downloadImagesWithURLs:(NSArray <NSString *> *)imageURLs;

/*
 *  根据图片地址获取图片
 *  imageURL 单个图片地址
 */
+ (UIImage *)imageForURL:(NSString *)imageURL;

@end
