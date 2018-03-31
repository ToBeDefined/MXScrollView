//
//  MXImageView.m
//  MXScrollViewDemo
//
//  Created by apple on 16/3/24.
//  Copyright © 2016年 PRO. All rights reserved.
//

#import "MXImageView.h"

@implementation MXImageView

- (instancetype)initWithFrame:(CGRect)frame
                         hasTable:(BOOL)hasTable {
    self = [super initWithFrame:frame];
    if (self) {
        self.autoresizesSubviews = YES;
        self.userInteractionEnabled = YES;
        self.backgroundColor = [UIColor clearColor];
        self.contentMode = hasTable ? UIViewContentModeScaleAspectFill : UIViewContentModeScaleToFill;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                       initWithTarget:self
                                       action:@selector(tapImageView:)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)setImageWithSource:(id)imageSource
          placeholderImage:(UIImage *)placeholderImage
     downloadImageFunction:(DownloadImageFunction _Nullable)downloadImageFunction {
    if ([imageSource isKindOfClass:[UIImage class]]) {
        self.image = (UIImage *)imageSource;
    } else {
        NSURL *imageSourceURL;
        self.image = placeholderImage;
        if ([imageSource isKindOfClass:[NSString class]]) {
            imageSourceURL = [NSURL URLWithString:(NSString *)imageSource];
        } else if ([imageSource isKindOfClass:[NSURL class]]) {
            imageSourceURL = (NSURL *)imageSource;
        }
        if (downloadImageFunction) {
            downloadImageFunction(self, imageSourceURL);
        }
    }
}

- (void)tapImageView:(UITapGestureRecognizer *)tap {
    if (self.didTapImageViewHandle) {
        self.didTapImageViewHandle();
    }
}

@end
