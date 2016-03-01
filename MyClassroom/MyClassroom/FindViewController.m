//
//  FindViewController.m
//  MyClassroom
//
//  Created by Darren on 12/18/15.
//  Copyright © 2015 darren. All rights reserved.
//

#import "FindViewController.h"
#import "ChatItemTableViewCell.h"
#import "ChatVO.h"

@interface FindViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) NSMutableArray *datas;
@property(nonatomic,strong) UITableView *tableView;

@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"发现";
    [self initData];
    _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    [_tableView reloadData];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChatItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil){
        cell = [[ChatItemTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    [cell setData:_datas[indexPath.row]];
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _datas.count;
}


-(void)initData
{
    _datas = [[NSMutableArray alloc]init];
    ChatVO *vo;
    int index = 0;
    for (int i = 0; i<100; i++) {
        vo = [[ChatVO alloc]init];
        vo.nickName = [NSString stringWithFormat:@"test -> %d",i];
        vo.msg = [NSString stringWithFormat:@"消息水水水水%d",i];
        if(i % 4 == 0){
            index = 0;
        }
        index ++;
        vo.icon = [NSString stringWithFormat:@"image%d.jpg",index];
        [_datas addObject:vo];
    }
    NSLog(@"initData");

}



@end
