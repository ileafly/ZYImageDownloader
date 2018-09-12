

# ZYImageDownloader

## 目的
基于`SDWebImage`封装一个专用于批量下载图片资源的类
## 预期
提供两个类方法，支持批量下载一组图片资源并根据`imageURL`读取对应的`UIImage`对象
## 实现方案
`SDWebImage`提供了一个类`SDWebImagePrefetcher`专门用于根据图片地址数组批量下载图片资源并缓存。

```
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
```
`downloadImagesWithURLs:`帮助我们实现了`NSString`转换`NSURL`并调用`SDWebImagePrefetcher`批量下载图片两个步骤。

通过`SDWebImagePrefetcher`下载的图片会与其他通过`SDWebImage`下载的图片一并通过`SDImageCache`管理缓存在`Library\Caches\default\com.hackemist.SDWebImageCache.default`文件夹下，想要方便的获取批量下载的下来的图片资源可以通过`SDImageCache`获取。

```
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
```

`imageForURL:`帮助我们实现了通过url转换cacheKey，再通过cacheKey读取缓存图片的流程。