//
//  ViewController.m
//  加法计算器
//
//  Created by 刘亚茹 on 2019/2/16.
//  Copyright © 2019 LIUYARU. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textField1;
@property (weak, nonatomic) IBOutlet UITextField *textField2;
@property (weak, nonatomic) IBOutlet UILabel *result;
@property (weak, nonatomic) IBOutlet UIButton *tutton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (IBAction)btn {
    //    取出输入框中的数字
    NSString *String1 = _textField1.text;
    if(String1.length == 0)
    {
        UIAlertView *alertView1 = [[UIAlertView alloc]initWithTitle:@"输入有误" message:@"第一个输入框不能为空" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView1  show];
        return;
    }
    NSString *String2 =_textField2.text;
    if(String2.length == 0)
    {
        UIAlertView *alertView1 = [[UIAlertView alloc]initWithTitle:@"输入有误" message:@"第二个输入框不能为空" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView1  show];
        return;
    }
    //    将字符串类型转化为整数类型
    NSInteger num1 = [String1 integerValue];
    NSInteger num2 = [String2 integerValue];
    //    将数字进行加法运算
    NSInteger result = num1 + num2;
    //    将整型的数转化为字符串类型的
    _result.text = [NSString stringWithFormat:@"%ld",result];
 
}


@end
