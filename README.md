---
title: 利用SDWebImage下载图片
date: 2017-07-05 15:04:20
tags: iOS
---


### 利用SDWebImage下载图片的原因

近期项目中有一个关于开屏广告加的需求变更。需要客户端将一段时间内的开屏广告图都预先下载到本地，确保用户在网络不佳甚至断网的情况下都能看到我们的开屏广告。一般情况下我们都是通过`SDWebImage`来动态的加载网络图片，能不能通过`SDWebImage`来帮我们预先下载好图片呢？下面就来分享一下我是怎么通过`SDWebImage`预加载图片的 :)

### 封装好的下载类

为了能方便的实现图片的下载，使用，移除等功能的调用，我封装了一个类[ZYImageDownloader](https://github.com/luzhiyongGit/ZYImageDownloader)，并且已经在github上开源，有兴趣的伙伴可以直接前往下载

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
