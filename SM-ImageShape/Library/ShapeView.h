//
//  ShapeView.h
//  SM-ImageShape
//
//  Created by Huq Majharul on 1/11/16.
//  Copyright © 2016 Huq Majharul. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface ShapeView : UIScrollView

@property (nonatomic, retain) UIScrollView  *contentView;
@property (nonatomic, retain) UIBezierPath *imagePathArea;
@property (nonatomic, retain) UIImageView   *imageview;

- (void)shapeImage:(CGSize)imageSize;

@end
