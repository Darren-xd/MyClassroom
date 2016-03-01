//
//  LiveChatViewController.m
//  MyClassroom
//
//  Created by Darren on 12/21/15.
//  Copyright © 2015 darren. All rights reserved.
//

#import "LiveChatViewController.h"
#import "ChatVO.h"
#import "MassageChatTableViewCell.h"

@interface LiveChatViewController ()<UIGestureRecognizerDelegate,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

@property(nonatomic,strong) UITextField *inputTextField;
@property(nonatomic,strong) ChatVO *data;
@property(nonatomic,strong) UIImagePickerController *imagePickerController;
@property(nonatomic,strong) UITableView *tableView;
@property(nonatomic,strong) NSMutableArray *chatArray;

@end

@implementation LiveChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _chatArray = [[NSMutableArray alloc]init];
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    //去掉分割线
//    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    
    //隐藏屏幕下方四个导航按钮
    self.tabBarController.tabBar.hidden = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    _inputTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 31, self.view.frame.size.width, 30)];
    _inputTextField.backgroundColor = [UIColor whiteColor];
    _inputTextField.returnKeyType = UIReturnKeySend;
    _inputTextField.borderStyle = UITextBorderStyleRoundedRect;
    _inputTextField.delegate = self;
    
    [self.view addSubview:_inputTextField];
    //添加背景点击事件
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(fingerIncident)];
    recognizer.delegate = self;
    [self.view addGestureRecognizer:recognizer];
    //动态获得键盘高度
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardShow:)name:UIKeyboardWillShowNotification object:nil];
    
    ChatVO *vo = [[ChatVO alloc]init];
    vo.nickName = @"Guzi";
    vo.msg = @"hello";
    vo.type = 1;
    vo.icon = @"head.png";
    [_chatArray addObject:vo];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _chatArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellId = @"chatCell";
    MassageChatTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil) {
        cell = [[MassageChatTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    [cell setData:_chatArray[indexPath.row]];
    return cell;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"return send msg %@",_inputTextField.text);
    ChatVO *vo = [[ChatVO alloc]init];
    vo.nickName = @"Guzi";
    vo.msg = _inputTextField.text;
    vo.icon = @"head.png";
    vo.type = 1;
    [_chatArray addObject:vo];
    
    _inputTextField.text = @"";

    [_tableView reloadData];
    return NO;
}



#pragma 动态获取键盘高度，并调整窗口位置
-(void)keyboardShow:(NSNotification *)notification
{
    //获取键盘高度，并调整内容高度
    NSDictionary *inif = [notification userInfo];
    CGSize bkSize = [[inif objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    self.view.center = CGPointMake(self.view.center.x, self.view.center.y - bkSize.height);
}

#pragma 关闭键盘调整窗口位置
-(void)fingerIncident
{
    self.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [_inputTextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)setViewData:(ChatVO *)vo{
    self.data = vo;
    self.navigationItem.title = vo.nickName;
}


@end
