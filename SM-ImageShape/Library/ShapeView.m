//
//  ShapeView.m
//  SM-ImageShape
//
//  Created by Huq Majharul on 1/11/16.
//  Copyright © 2016 Huq Majharul. All rights reserved.
//

#import "ShapeView.h"

#define MRScreenWidth      CGRectGetWidth([UIScreen mainScreen].applicationFrame)
#define MRScreenHeight     CGRectGetHeight([UIScreen mainScreen].applicationFrame)

#define OVERVIEW_TAG        8888

@interface ShapeView (Utility)

- (CGRect)zoomRectForScale:(float)scale withCenter:(CGPoint)center;

@end

@implementation ShapeView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self initImageView];
    }
    return self;
}

- (void)initImageView
{
    self.backgroundColor = [UIColor grayColor];
    
    _contentView = [[UIScrollView alloc] initWithFrame:CGRectInset(self.bounds, 0, 0)];
    _contentView.showsHorizontalScrollIndicator = NO;
    _contentView.showsVerticalScrollIndicator = NO;
    [self addSubview:_contentView];

    
    self.imageview = [[UIImageView alloc] initWithFrame:self.bounds];
    _imageview.frame = CGRectMake(0, 0, MRScreenWidth * 2.5, MRScreenWidth * 2.5);
    _imageview.userInteractionEnabled = YES;
    [_contentView addSubview:_imageview];
    
    float minimumScale = self.frame.size.width / _imageview.frame.size.width;
    [_contentView setMinimumZoomScale:minimumScale];
    [_contentView setMaximumZoomScale:4.0f];
    [_contentView setZoomScale:minimumScale];
    
    self.showsHorizontalScrollIndicator = NO;
    self.showsVerticalScrollIndicator = NO;
}

- (void)shapeImage:(CGSize)imageSize
{
    CGRect rect     = CGRectZero;
    CGFloat scale   = 1.0f;
    CGFloat w       = 0.0f;
    CGFloat h       = 0.0f;
    
    if(self.contentView.frame.size.width > self.contentView.frame.size.height)
    {
        w = self.contentView.frame.size.width;
        h = w * imageSize.height / imageSize.width;
        if(h < self.contentView.frame.size.height){
            h = self.contentView.frame.size.height;
            w = h * imageSize.width / imageSize.height;
        }
        
    }else{
    
        h = self.contentView.frame.size.height;
        w = h * imageSize.width / imageSize.height;
        if(w < self.contentView.frame.size.width){
            w = self.contentView.frame.size.width;
            h = w * imageSize.height / imageSize.width;
        }
    }
    rect.size = CGSizeMake(w, h);
    
    CGFloat scale_w = w / imageSize.width;
    CGFloat scale_h = h / imageSize.height;
    if (w > self.frame.size.width || h > self.frame.size.height) {
        scale_w = w / self.frame.size.width;
        scale_h = h / self.frame.size.height;
        if (scale_w > scale_h) {
            scale = 1 / scale_w;
        }else{
            scale = 1 / scale_h;
        }
    }
    
    if (w <= self.frame.size.width || h <= self.frame.size.height) {
        scale_w = w / self.frame.size.width;
        scale_h = h / self.frame.size.height;
        if (scale_w > scale_h) {
            scale = scale_h;
        }else{
            scale = scale_w;
        }
    }
    
    @synchronized(self){
        _imageview.frame = rect;
        CAShapeLayer *maskLayer = [CAShapeLayer layer];
        maskLayer.path = [self.imagePathArea CGPath];
        maskLayer.fillColor = [[UIColor whiteColor] CGColor];
        maskLayer.frame = _imageview.frame;
        self.layer.mask = maskLayer;
        [_contentView setZoomScale:0.2];
        [self setNeedsLayout];
    }
    
    CGFloat slideToX    = floorf((_imageview.frame.size.width - _contentView.frame.size.width)/2);
    [_contentView setContentOffset:CGPointMake(slideToX, 0.0)];
}

@end
