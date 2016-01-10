# Image Shape

#### Image Draw through Bezier Path
#### Json to Path Points

[![](https://raw.githubusercontent.com/Majharul-Huq/SM-ImageShape/master/SM-ImageShape/Screenshot-1.png)](Screenshot-1.png)
[![](https://raw.githubusercontent.com/Majharul-Huq/SM-ImageShape/master/SM-ImageShape/Screenshot-2.png)](Screenshot-2.png)
[![](https://raw.githubusercontent.com/Majharul-Huq/SM-ImageShape/master/SM-ImageShape/Screenshot-3.png)](Screenshot-3.png)

## Simply use
    ShapeView *shapeView1 = [[ShapeView alloc] initWithFrame:self.view.frame];
    [shapeView1 setClipsToBounds:YES];
    [shapeView1 setBackgroundColor:[UIColor clearColor]];
    shapeView1.imagePathArea = path; // Check the code,used sample json to get path data from file
    shapeView1.imageview.image = [UIImage imageNamed:@"test-background.png"];
    [shapeView1 shapeImage:[UIImage imageNamed:@"test-background.png"].size];
    [self.view addSubview:shapeView1];
    [path closePath];
    
## Author

Majharul Huq, sumancsc@gmail.com


## License

Image Shape is available under the MIT license. See the LICENSE file for more info.
