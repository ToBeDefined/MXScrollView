//
//  DownloadImgaeViewController.m
//  MXScrollViewDemo
//
//  Created by TBD on 2018/3/31.
//  Copyright © 2018年 PRO. All rights reserved.
//

#import "DownloadImgaeViewController.h"
#import "MXScrollView.h"
#import <SDWebImage/SDWebImageDownloader.h>

#define Screen_Width [UIScreen mainScreen].bounds
static CGFloat const scrollViewWidth = 300;
static CGFloat const scrollViewHeight = 200;


@interface DownloadImgaeViewController ()
{
    MXImageScrollView *scroll;
}
@end

@implementation DownloadImgaeViewController

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [scroll invalidateTimer];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    __weak typeof(self) weakSelf = self;
    scroll = [[MXImageScrollView alloc] initWithFrame:CGRectMake((CGRectGetWidth(Screen_Width) - scrollViewWidth) / 2,
                                                                 scrollViewHeight,
                                                                 scrollViewWidth,
                                                                 scrollViewHeight)
                                downloadImageFunction:^(MXImageView *imageView, NSURL *url) {
                                    [weakSelf downloadImageToImageView:imageView withURL:url];
                                }];
    scroll.pageControl.pageIndicatorTintColor = [UIColor blackColor];
    scroll.pageControl.currentPageIndicatorTintColor = [UIColor orangeColor];
    
    NSString *image_1   = @"http://a0.att.hudong.com/72/39/300533991095135084393534326_950.jpg";
    UIImage  *image_2   = [UIImage imageNamed:@"picture_2"];
    NSString *image_3   = @"http://a0.att.hudong.com/31/35/300533991095135084358827466_950.jpg";
    NSURL    *image_4   = [NSURL URLWithString:@"http://a2.att.hudong.com/32/36/300533991095135084360412925_950.jpg"];
    
    scroll.images = @[image_1, image_2, image_3, image_4];
    [scroll setTapImageHandle:^(NSInteger index) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"提示"
                                                            message:[NSString
                                                                     stringWithFormat:@"你点击了%ld张图片", index]
                                                           delegate:nil
                                                  cancelButtonTitle:nil
                                                  otherButtonTitles:@"Ok", nil];
        [alertView show];
    }];
    
    [scroll setDidScrollImageViewAtIndexHandle:^(NSInteger index) {
        NSLog(@"滑动到了第%ld页", index);
    }];
    
    [self.view addSubview:scroll];
}

- (void)downloadImageToImageView:(UIImageView *)imageView
                         withURL:(NSURL *)url  {
    [[SDWebImageDownloader sharedDownloader] setValue:@"someHeaderValue" forHTTPHeaderField:@"headerKey"];
    [[SDWebImageDownloader sharedDownloader] downloadImageWithURL:url
                                                          options:SDWebImageDownloaderIgnoreCachedResponse
                                                         progress:nil
                                                        completed:^(UIImage * _Nullable image, NSData * _Nullable data, NSError * _Nullable error, BOOL finished) {
                                                            dispatch_async(dispatch_get_main_queue(), ^{
                                                                if (image) {
                                                                    imageView.image = image;
                                                                } else {
                                                                    NSLog(@"Network ERROR");
                                                                }
                                                            });
                                                        }];
}

@end
