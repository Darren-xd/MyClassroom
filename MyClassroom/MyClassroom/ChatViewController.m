//
//  ChatViewController.m
//  MyClassroom
//
//  Created by Darren on 12/9/15.
//  Copyright © 2015 darren. All rights reserved.
//

#import "ChatViewController.h"
#import "LiveChatViewController.h"
#import "ChatItemTableViewCell.h"

@interface ChatViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_contacts;
    UIImageView *_imageBg;
    
}
@end

@implementation ChatViewController


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

#pragma 初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    //修改导航栏背景色
//    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    
    [self initData];
    
    UILabel *customLab = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 30)];
    [customLab setTextColor:[UIColor whiteColor]];
    [customLab setText:@"微信"];
    customLab.font = [UIFont systemFontOfSize:20];
    customLab.textAlignment = NSTextAlignmentCenter;
    
    self.navigationItem.title = @"微信";
    
//    self.navigationItem.titleView = customLab;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(clickAddHandal)];
    NSString *url = @"https://ss0.bdstatic.com/5aV1bjqh_Q23odCf/static/superman/img/logo/bd_logo1_31bdc765.png";
    UIImage *image = [[UIImage alloc]initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url]]];
    _imageBg = [[UIImageView alloc]initWithImage:image];
    //自动下移视图
//    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
//    _tableView.requiresConstraintBasedLayout = NO;
    
    
//    NSLayoutConstraint *tableLeft = [NSLayoutConstraint constraintWithItem:_imageBg attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0f constant:0.0f];
//    
//    [self.view addConstraint:tableLeft];
    
    
//    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:_imageBg attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeRight multiplier:1.0f constant:0.0f];
//    [self.view addConstraint:leftConstraint];
    
    
    
//    _tableView style
    
    NSLog(@"xxxxxx=>%f",self.view.frame.size.height);
    
    _tableView.dataSource = self;
    _tableView.delegate = self;
    [self.view addSubview:_tableView];
//    [self.view addSubview:_imageBg];
    
}
#pragma 设置数据源
-(void)initData
{
    _contacts = [[NSMutableArray alloc]init];

    ChatVO *vo;
    int index = 0;
    for (int i = 0; i<100; i++) {
        vo = [[ChatVO alloc]init];
        vo.nickName = [NSString stringWithFormat:@"谷子 -> %d",i];
        vo.msg = [NSString stringWithFormat:@"消息水水水水%d",i];
        if(i % 4 == 0){
            index = 0;
        }
        index ++;
        vo.icon = @"head.png";
        [_contacts addObject:vo];
    }
    NSLog(@"initData");
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _contacts.count;
}

#pragma 获得单个Cell高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //获得Cell中的高度
//    ChatItemTableViewCell *cell = (ChatItemTableViewCell *) [self tableView:_tableView cellForRowAtIndexPath:indexPath];
//    return cell.frame.size.height;
    return 68;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"Cell";
    
    ChatItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell  = [[ChatItemTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    //cell样式
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    [cell setData:_contacts[indexPath.row]];
    return cell;
}

#pragma  点击行处理
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_tableView deselectRowAtIndexPath:indexPath animated:YES];
    LiveChatViewController *liveChat = [[LiveChatViewController alloc]init];
    [liveChat setViewData:_contacts[indexPath.row]];
    [self.navigationController pushViewController:liveChat animated:YES];
}

#pragma 行列表点击事件
-(void)clickAddHandal{
    NSLog(@"click add button",nil);
    //弹出提示窗口
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"暂时不提供该功能" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *okBtn = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * alert)
    {
        NSLog(@"点击OK按钮");
    }];
    [alertController addAction:okBtn];
    
    UIAlertAction *cancelBtn = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:cancelBtn];
    
    [self presentViewController:alertController animated:YES completion:^{
        //动画完成事件
        NSLog(@"animated complete ");
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)getDeviceInfo
{
    UIDevice *device = [[UIDevice alloc]init];
    [_contacts addObject:[NSString stringWithFormat:@"许德=>%@",device.name]];
    [_contacts addObject:[NSString stringWithFormat:@"许德=>%@",[[UIDevice currentDevice] localizedModel]]];
}

@end
