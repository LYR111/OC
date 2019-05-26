//
//  ViewController.m
//  QQChatDemo
//
//  Created by hellovoidworld on 14/12/8.
//  Copyright (c) 2014年 hellovoidworld. All rights reserved.
//

#import "ViewController.h"
#import "Message.h"
#import "MessageCell.h"
#import "MessageFrame.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate>

/** 聊天区tableView */
@property (weak, nonatomic) IBOutlet UITableView *tableView;

/** 信息记录数据 */
@property(nonatomic, strong) NSMutableArray *messages;

/** 信息输入框 */
@property (weak, nonatomic) IBOutlet UITextField *inputView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 设置dataSource
    self.tableView.dataSource = self;
    
    // 设置tableView的delegate
    self.tableView.delegate = self;
    
    // 设置tableView背景色,当键盘呼出隐藏的时候，避免默认的黑色背景出现太突兀
    self.tableView.backgroundColor = BACKGROUD_COLOR;
    
    // 设置聊天区TableView
    // 不使用分割线
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    // 禁止选中cell
    [self.tableView setAllowsSelection:NO];
    
    // 设置虚拟键盘监听器
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    // 设置TextField文字左间距
    self.inputView.leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 8, 0)];
    self.inputView.leftViewMode = UITextFieldViewModeAlways;
    
    // 设置信息输入框的代理
    self.inputView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

#pragma mark - 数据加载
/** 延迟加载plist文件数据 */
- (NSMutableArray *)messages {
    if (nil == _messages) {
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"message1.plist" ofType:nil]];
        
        NSMutableArray *mdictArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            Message *message = [Message messageWithDictionary:dict];
            
            // 判断是否发送时间与上一条信息的发送时间相同，若是则不用显示了
            MessageFrame *lastMessageFrame = [mdictArray lastObject];
            if (lastMessageFrame && [message.time isEqualToString:lastMessageFrame.message.time]) {
                message.hideTime = YES;
            }
            
            MessageFrame *messageFrame = [[MessageFrame alloc] init];
            messageFrame.message = message;
            [mdictArray addObject:messageFrame];
        }
        
        _messages = mdictArray;
    }
    
    return _messages;
}

#pragma mark - dataSource方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  self.messages.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageCell *cell = [MessageCell cellWithTableView:self.tableView];
    cell.messageFrame = self.messages[indexPath.row];
    
    return cell;
}


#pragma mark - tableView代理方法
/** 动态设置每个cell的高度 */
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessageFrame *messageFrame = self.messages[indexPath.row];
    return messageFrame.cellHeight;
}

#pragma mark - scrollView 代理方法
/** 点击拖曳聊天区的时候，缩回键盘 */
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    // 1.缩回键盘
    [self.view endEditing:YES];
}


#pragma mark - 监听事件
- (void) keyboardWillChangeFrame:(NSNotification *) note {
    // 1.取得弹出后的键盘frame
    CGRect keyboardFrame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    // 2.键盘弹出的耗时时间
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
    
    // 3.键盘变化时，view的位移，包括了上移/恢复下移
    CGFloat transformY = keyboardFrame.origin.y - self.view.frame.size.height;
    
    [UIView animateWithDuration:duration animations:^{
        self.view.transform = CGAffineTransformMakeTranslation(0, transformY);
    }];
}

#pragma mark - TextField 代理方法
/** 回车响应事件 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // 我方发出信息
    [self sendMessageWithMyContent:textField.text andType:MessageTypeMe];
    NSLog(@"%@",textField.text);
    // 自动回复
    [self sendMessageWithOtherContent:[NSString stringWithFormat:@"你好"] andType:MessageTypeOhter];
    
    // 消除消息框内容
    self.inputView.text = nil;
    
    [self.tableView reloadData];
    
    // 滚动到最新的消息
    NSIndexPath *lastIndexPath = [NSIndexPath indexPathForRow:self.messages.count - 1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:lastIndexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    
    return YES; // 返回值意义不明
}


static NSDate * _Nonnull extracted(long long timestamp) {
    return [NSDate dateWithTimeIntervalSince1970:timestamp / 1000.0];
}

+ (NSString *)timeStr:(long long)timestamp
{
    // 创建日历对象
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    // 获取当前时间
    NSDate *currentDate = [NSDate date];
    
    // 获取当前时间的年、月、日。利用日历
    NSDateComponents *components = [calendar components:NSCalendarUnitYear| NSCalendarUnitMonth|NSCalendarUnitDay fromDate:currentDate];
    NSInteger currentYear = components.year;
    NSInteger currentMonth = components.month;
    NSInteger currentDay = components.day;
    
    // 获取消息发送时间的年、月、日
    NSDate *msgDate = extracted(timestamp);
    components = [calendar components:NSCalendarUnitYear| NSCalendarUnitMonth|NSCalendarUnitDay fromDate:msgDate];
    CGFloat msgYear = components.year;
    CGFloat msgMonth = components.month;
    CGFloat msgDay = components.day;
    
    // 进行判断
    NSDateFormatter *dateFmt = [[NSDateFormatter alloc] init];
    if (currentYear == msgYear && currentMonth == msgMonth && currentDay == msgDay) {
        //今天
        dateFmt.dateFormat = @"HH:mm";
    }else if (currentYear == msgYear && currentMonth == msgMonth && currentDay-1 == msgDay ){
        //昨天
        dateFmt.dateFormat = @"昨天 HH:mm";
    }else{
        //昨天以前
        dateFmt.dateFormat = @"MM-dd HH:mm";
    }
    // 返回处理后的结果
    return [dateFmt stringFromDate:msgDate];
}
// 发送消息
- (void) sendMessageWithMyContent:(NSString *) text andType:(MessageType) type {
    // 获取当前时间
    NSDate *date = [NSDate date];
//    调用上面的处理时间的方法
    [ViewController timeStr:10000000];
   
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MMM-dd hh:mm:ss";
    NSString *dateStr = [formatter stringFromDate:date];
    
    // 我方发出信息
    NSDictionary *dict = @{@"text":text,
                           @"time":dateStr,
                           @"type":[NSString stringWithFormat:@"%d", type]};
    
    Message *message = [[Message alloc] init];
    [message setValuesForKeysWithDictionary:dict];
    MessageFrame *messageFrame = [[MessageFrame alloc] init];
    messageFrame.message = message;
    
    [self.messages addObject:messageFrame];
}


-(void)sendMessageWithOtherContent:(NSString *)text andType:(MessageType) type
{
//    系统发出的信息
    NSDictionary *dict = @{@"text":text,
                           
                           @"type":[NSString stringWithFormat:@"%d", type]};
    
    Message *message = [[Message alloc] init];
    [message setValuesForKeysWithDictionary:dict];
    MessageFrame *messageFrame = [[MessageFrame alloc] init];
    messageFrame.message = message;
    
    [self.messages addObject:messageFrame];
}
@end
