//
//  ViewController.m
//  UIScrollview的常见属性
//
//  Created by 刘亚茹 on 2019/2/12.
//  Copyright © 2019 LIUYARU. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIImageView
    UIImage *image = [UIImage imageNamed:@"1"];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    [self.scrollView addSubview:imageView];
//    设置contentSize
    self.scrollView.contentSize = image.size;
}


- (IBAction)top {
//    [UIView animateWithDuration:2.0 animations:^{
//        CGPoint offset = self.scrollView.contentOffset;
//        offset.y = 0;
//        self.scrollView.contentOffset = offset;
        self.scrollView.contentOffset = CGPointMake(self.scrollView.contentOffset.x, 0);
//    }];
    
}

- (IBAction)left {
    [ self.scrollView setContentOffset:CGPointMake(0, self.scrollView.contentOffset.y)  animated:YES];
}

- (IBAction)bottom {
    CGFloat offsetX = self.scrollView.contentOffset.x;
    CGFloat offsetY = self.scrollView.contentSize.height - self.scrollView.frame.size.height;
    CGPoint offset = CGPointMake(offsetX, offsetY);
    [self.scrollView setContentOffset:offset animated:YES];
}

- (IBAction)rightTop {
}


- (IBAction)right {
    [ self.scrollView setContentOffset:CGPointMake(self.scrollView.contentOffset.x, 0)  animated:YES];
    
}
- (IBAction)leftBottom {
    
    
}


@end
