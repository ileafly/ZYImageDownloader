//
//  ZYViewController.m
//  ZYImageDownloader
//
//  Created by luzhiyongGit on 07/05/2017.
//  Copyright (c) 2017 luzhiyongGit. All rights reserved.
//

#import "ZYViewController.h"

#import <ZYImageDownloader/ZYImageDownloader.h>

#define IMAGE_URL  @"https://cdn0-digiphoto-techbang.pixfs.net/system/images/122102/original/da5209c292ac1c6d0cf970aa260a83e5.jpg?1516243461"

@interface ZYViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ZYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    [ZYImageDownloader downloadImagesWithURLs:@[IMAGE_URL]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loadImage:(id)sender {
    UIImage *image = [ZYImageDownloader imageForURL:IMAGE_URL];
    _imageView.image = image;
}

@end
