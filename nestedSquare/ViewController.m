//
//  ViewController.m
//  nestedSquare
//
//  Created by Apple on 12/26/15.
//  Copyright (c) 2015 AMOSC. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController{
    float recwidth;
    CGPoint center;
    float margin;
}

- (void) initProject{
    margin = 10.0;
    recwidth = self.view.bounds.size.width - margin*2;
    center = CGPointMake(self.view.bounds.size.width*0.5, self.view.bounds.size.height*0.5);
    self.view.backgroundColor = [UIColor blackColor];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initProject];
    [self drawnestedSquare];
    
    [self performSelector:@selector(squarerotating) withObject:nil afterDelay:2];
    
}
- (void) squarerotating{
    [UIView animateWithDuration:2.0 animations:^{
        
        for (int i=0; i<self.view.subviews.count; i++){
            
            if (i%2==0){
                //transform
                ((UIView*)self.view.subviews[i]).transform = CGAffineTransformMakeRotation(M_PI);
           
            }
            else {
                ((UIView*)self.view.subviews[i]).transform = CGAffineTransformIdentity;
            }
        }
        
    }];
   
    
    
}
- (void) drawnestedSquare{
    int i;
    for (i=0; i<=10; i++){
        // add each rectangular
        BOOL rotate;
        if (i%2==0) rotate=false;
        else rotate=true;
        
        [self squaredwidth:recwidth withrotate:rotate];
        
        recwidth = recwidth*0.707;
        
    }
    
}
- (void) squaredwidth:(float) width withrotate:(BOOL) rotate{
    UIView *image = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, width)];
    image.center=center;
   // NSLog(@"%2.1f %2.1f",center.x,center.y);
    image.backgroundColor = rotate? [UIColor whiteColor]: [UIColor darkGrayColor];
    image.transform = rotate? CGAffineTransformMakeRotation(M_PI_4) : CGAffineTransformIdentity;
    
    [self.view addSubview:image];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
