

### 封装好的下载类

为了能方便的实现图片的下载，使用，移除等功能的调用，我封装了一个类ZYImageDownloader

### 原理分析

其实`SDWebImage`内部已经帮我们实现了图片下载的类，`SDWebImageDownloader`一个专门用来下载图片的类，`SDWebImagePrefetcher`一个专门用来批量下载图片的类

这里我们主要就是使用了`SDWebImagePrefetcher`来下载图片，我们只需要将要下载的图片地址传入，`SDWebImagePrefetcher`就会帮我们将图片逐个下载下来，并且缓存在本地，缓存的方式和我们通常使用的动态加载图片一样以url为key存储

```
[[SDWebImagePrefetcher sharedImagePrefetcher] prefetchURLs:prefetchURLs progress:^(NSUInteger noOfFinishedUrls, NSUInteger noOfTotalUrls) {
        
} completed:^(NSUInteger noOfFinishedUrls, NSUInteger noOfSkippedUrls) {
        
}];

```
当我们需要使用对应地址的图片时，我们只需要以url为key来获取图片即可

```
NSString *key = [[SDWebImageManager sharedManager] cacheKeyForURL:[NSURL URLWithString:imageURL]];
    UIImage *image = [[SDImageCache sharedImageCache] imageFromCacheForKey:key];
    return image;
```
