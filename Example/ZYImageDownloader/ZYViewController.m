//
//  ZYViewController.m
//  ZYImageDownloader
//
//  Created by luzhiyongGit on 07/05/2017.
//  Copyright (c) 2017 luzhiyongGit. All rights reserved.
//

#import "ZYViewController.h"

#import <ZYImageDownloader/ZYImageDownloader.h>

#define IMAGE_URL  @"http://img.zuimeiui.com/res/2016/07/869f76c8741c019fb41bd225e399dd32-19.jpg"

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
