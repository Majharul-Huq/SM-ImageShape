//
//  ViewController.m
//  SM-ImageShape
//
//  Created by Huq Majharul on 1/11/16.
//  Copyright © 2016 Huq Majharul. All rights reserved.
//

#import "ViewController.h"
#import "ShapeView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor   = [UIColor grayColor];
    
    NSError *error        = nil;
    
    // Triangle Shape
    NSData  *dataFromFile = [NSData dataWithContentsOfFile:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"shape3.json"]];
    
    // Polygon Shape
    //NSData  *dataFromFile = [NSData dataWithContentsOfFile:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"shape3.json"]];
    
    // Rectangle Shape
    //NSData  *dataFromFile = [NSData dataWithContentsOfFile:[[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"shape3.json"]];
    
    // Read Data From Sample JSON file saved in Res
    NSDictionary *data    = [NSJSONSerialization JSONObjectWithData:dataFromFile
                                                            options:kNilOptions
                                                            error:&error];
    
    // Convert JSON to Points Arrasy
    NSMutableArray  *jsonPoints   = [data valueForKey:@"Points"];
    UIBezierPath    *path         = [UIBezierPath bezierPath];
    
    // Making Bezier Path
    for(int i = 0; i < jsonPoints.count; i++){
        NSMutableArray *points = [jsonPoints objectAtIndex:i];
        CGPoint point = CGPointMake([[points objectAtIndex:0] floatValue], [[points objectAtIndex:1] floatValue]);
        (i == 0) ?[path moveToPoint:point] : [path addLineToPoint:point];
    }
    
    // Makeing Shape
    ShapeView *shapeView1 = [[ShapeView alloc] initWithFrame:self.view.frame];
    [shapeView1 setClipsToBounds:YES];
    [shapeView1 setBackgroundColor:[UIColor clearColor]];
    shapeView1.imagePathArea = path;
    shapeView1.imageview.image = [UIImage imageNamed:@"test-background.png"];
    [shapeView1 shapeImage:[UIImage imageNamed:@"test-background.png"].size];
    [self.view addSubview:shapeView1];
    [path closePath];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
