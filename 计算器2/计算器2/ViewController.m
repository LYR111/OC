//
//  ViewController.m
//  计算器2
//
//  Created by 刘亚茹 on 2019/2/12.
//  Copyright © 2019 LIUYARU. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *Label1;
@property (weak, nonatomic) IBOutlet UILabel *Label2;
@property (assign,nonatomic)char c;
@property (assign,nonatomic)float result;
@end

@implementation ViewController




- (IBAction)add {
 

    
    if(_c == '\0')
    {
    
        _Label2.text = _Label1.text;
        _Label1.text = @"";
        _c = '+';
    }else{
    
       
        NSString *num1String = _Label1.text;
        NSString *num2String = _Label2.text;
//               将字符串转化为整形
       float num1 = [num1String floatValue];
      float num2 = [num2String  floatValue];
//                计算结果
        if(_c == '+')
        {
        _result = num1 + num2;
        }else if (_c == '-')
        {
              _result = num2 - num1;
        }else if(_c == '*')
        {
            _result = num2 * num1;
        }else if (_c == '/')
        {
            _result = num2 / num1;
        }else
        {
            _result = ( NSInteger)num2 % (NSInteger)num1;
        }
        
//               将结果转化为字符串类型
        _Label2.text = [NSString stringWithFormat:@"%ld",(long)_result];
        _Label1.text = @"";
 
        _c = '+';
    }
}
- (IBAction)subtract {
   
    
    
    if(_c == '\0')
    {
        _c = '-';
        _Label2.text = _Label1.text;
        _Label1.text = @"";
        
    }else{
        
        
        NSString *num1String = _Label1.text;
        NSString *num2String = _Label2.text;
        //               将字符串转化为整形
       float num1 = [num1String floatValue];
        float  num2 = [num2String floatValue];
        //                计算结果
        if(_c == '+')
        {
            _result = num1 + num2;
        }else if (_c == '-')
        {
            _result = num2 - num1;
        }else if(_c == '*')
        {
            _result = num2 * num1;
        }else if (_c == '/')
        {
            _result = num2 / num1;
        }else
        {
            _result = ( NSInteger)num2 % (NSInteger)num1;
        }
        //               将结果转化为字符串类型
        _Label2.text = [NSString stringWithFormat:@"%f",_result];
        _Label1.text = @"";
        _c = '-';
    }
}
- (IBAction)multiply {
  
    
    if(_c == '\0')
    {
        _c = '*';
        _Label2.text = _Label1.text;
        _Label1.text = @"";
        
    }else{
        
        NSString *num1String = _Label1.text;
        NSString *num2String = _Label2.text;
        //               将字符串转化为整形
        float  num1 = [num1String floatValue];
      float  num2 = [num2String floatValue];
        //                计算结果
        if(_c == '+')
        {
            _result = num1 + num2;
        }else if (_c == '-')
        {
            _result = num2 - num1;
        }else if(_c == '*')
        {
            _result = num2 * num1;
        }else if (_c == '/')
        {
            _result = num2 / num1;
        }else
        {
         _result = ( NSInteger)num2 % (NSInteger)num1;
        }        //               将结果转化为字符串类型
        _Label2.text = [NSString stringWithFormat:@"%f",_result];
        _Label1.text = @"";
        _c = '*';
    }
  
}
- (IBAction)divide {
  
    if(_c == '\0')
    {
        _c = '/';
        _Label2.text = _Label1.text;
        _Label1.text = @"";
        
    }else{
        
        NSString *num1String = _Label1.text;
        NSString *num2String = _Label2.text;
        //               将字符串转化为整形
      float  num1 = [num1String floatValue];
      float  num2 = [num2String floatValue];
        //                计算结果
        if(_c == '+')
        {
            _result = num1 + num2;
        }else if (_c == '-')
        {
            _result = num2 - num1;
        }else if(_c == '*')
        {
            _result = num2 * num1;
        }else if (_c == '/')
        {
            _result = num2 / num1;
        }else
        {
         _result = ( NSInteger)num2 % (NSInteger)num1;
        }
        //               将结果转化为字符串类型
        _Label2.text = [NSString stringWithFormat:@"%f",_result];
        _Label1.text = @"";
        _c = '/';
    }
}
- (IBAction)quyu {

    if(_c == '\0')
    {
        _c = '%';
        _Label2.text = _Label1.text;
        _Label1.text = @"";
        
    }else{
        
        NSString *num1String = _Label1.text;
        NSString *num2String = _Label2.text;
        //               将字符串转化为整形
      float  num1 = [num1String floatValue];
        float  num2 = [num2String floatValue];
        //                计算结果
        if(_c == '+')
        {
            _result = num1 + num2;
        }else if (_c == '-')
        {
            _result = num2 - num1;
        }else if(_c == '*')
        {
            _result = num2 * num1;
        }else if (_c == '/')
        {
            _result = num2 / num1;
        }else
        {
             _result = ( NSInteger)num2 % (NSInteger)num1;
        }
        //               将结果转化为字符串类型
        _Label2.text = [NSString stringWithFormat:@"%f",_result];
        _Label1.text = @"";
        _c = '%';
    }
}
- (IBAction)Inverse {
    NSString *num1String = _Label1.text;
    float num1 = [num1String integerValue];
    num1 = 0 -num1;
    _Label1.text = [NSString stringWithFormat:@"%f", num1];
}
- (IBAction)delete {
    _Label2.text = @"";
    _Label1.text = @"";
    _c = '\0';
}

- (IBAction)calculate {
    
    NSString *num1String = _Label1.text;
    NSString *num2String = _Label2.text;
    //               将字符串转化为整形
    float num1 = [num1String floatValue];
    float num2 = [num2String  floatValue];
    if(_c == '+')
    {
        _result = num1 + num2;
    }else if (_c == '-')
    {
        _result = num2 - num1;
    }else if(_c == '*')
    {
        _result = num2 * num1;
    }else if (_c == '/')
    {
        _result = num2 / num1;
    }else
    {
        _result = ( NSInteger)num2 % (NSInteger)num1;
    }
     _Label1.text = [NSString stringWithFormat:@"%f",_result];
    _Label2.text = @"";
    _c = '\0';
}


- (void)viewDidLoad {
    [super viewDidLoad];

}
- (IBAction)btn1 {
      _Label1.text =  [_Label1.text stringByAppendingString:@"1"];
}

- (IBAction)btn2 {
    _Label1.text =  [_Label1.text stringByAppendingString:@"2"];
}
- (IBAction)btn3 {
      _Label1.text =  [_Label1.text stringByAppendingString:@"3"];
}
-(IBAction)btn4{
      _Label1.text =  [_Label1.text stringByAppendingString:@"4"];
}
-(IBAction)btn5{
      _Label1.text =  [_Label1.text stringByAppendingString:@"5"];
}
-(IBAction)btn6{
      _Label1.text =  [_Label1.text stringByAppendingString:@"6"];
}
-(IBAction)btn7{
      _Label1.text =  [_Label1.text stringByAppendingString:@"7"];
}
-(IBAction)btn8{
      _Label1.text =  [_Label1.text stringByAppendingString:@"8"];
}
-(IBAction)btn9{
      _Label1.text =  [_Label1.text stringByAppendingString:@"9"];
}
-(IBAction)btn0{
      _Label1.text =  [_Label1.text stringByAppendingString:@"0"];
}
-(IBAction)point{
      _Label1.text =  [_Label1.text stringByAppendingString:@"."];
}

@end
