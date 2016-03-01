//
//  NewTableViewCell.m
//  MyClassroom
//
//  Created by Darren on 2/4/16.
//  Copyright © 2016 darren. All rights reserved.
//

#import "NewTableViewCell.h"
#import "ChatItemTableViewCell.h"

@interface NewTableViewCell()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong) NSMutableArray *datas;

@end


@implementation NewTableViewCell




-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.delegate = self;
        self.dataSource = self;
        _datas = [[NSMutableArray alloc]init];
        
        
    }
    return self;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ChatItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(cell == nil){
        cell = [[ChatItemTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        NSLog(@"crate cell ",nil);
    }
    return cell;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _datas.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(void)initData
{
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
