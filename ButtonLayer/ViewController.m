//
//  ViewController.m
//  ButtonLayer
//
//  Created by zhanghaidi on 2017/8/13.
//  Copyright © 2017年 zhanghaidi. All rights reserved.
//

#import "ViewController.h"
#import "POP.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(80, 100, 80, 80);
    button.backgroundColor = [UIColor orangeColor];
    [button setTitle:@"抢" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:30];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;

    button.layer.cornerRadius = 40;

    CFTimeInterval beginTime = CACurrentMediaTime();
    
    for (int i = 0; i < 3; i++) {
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        shapeLayer.frame = CGRectMake(0, 0, 80, 80);
        UIBezierPath *bezier = [UIBezierPath bezierPathWithArcCenter:CGPointMake(40, 40) radius:40 startAngle:0 endAngle:2 * M_PI clockwise:YES];
        shapeLayer.path = bezier.CGPath;
        shapeLayer.strokeColor = [UIColor redColor].CGColor;
        shapeLayer.fillColor = [UIColor clearColor].CGColor;
        
        POPBasicAnimation *animations = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerScaleXY];
        animations.toValue =[NSValue valueWithCGPoint:CGPointMake(2, 2)];
        animations.repeatForever = YES;
        animations.duration = 1.2;
        animations.beginTime = beginTime + (double)i * 1.2 / (double)3;
        animations.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
        [shapeLayer pop_addAnimation:animations forKey:@"scale"];
        
        POPBasicAnimation *animation1 = [POPBasicAnimation animationWithPropertyNamed:kPOPLayerOpacity];
        animation1.toValue = @0;
        animation1.repeatForever = YES;
        animation1.duration = 1.2;
        animation1.beginTime = beginTime + (double)i * 1.2 / (double)3;
        animation1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
        [shapeLayer pop_addAnimation:animation1 forKey:@"opacity"];
        
        [button.layer addSublayer:shapeLayer];
    }
    
     POPBasicAnimation *animation1 = [POPBasicAnimation animationWithPropertyNamed:kPOPViewScaleXY];
     animation1.duration = 0.8;
     animation1.repeatForever = YES;
     animation1.autoreverses = YES;
    animation1.beginTime = beginTime;
     animation1.toValue = [NSValue valueWithCGSize:CGSizeMake(0.6, 0.6)];
     [button.titleLabel pop_addAnimation:animation1 forKey:@"text_scale"];
}

- (void)click {
    NSLog(@"------");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
