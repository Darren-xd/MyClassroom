//
//  ChatItemTableViewCell.h
//  MyClassroom
//
//  Created by Darren on 1/13/16.
//  Copyright © 2016 darren. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChatVO.h"

@interface ChatItemTableViewCell : UITableViewCell
{
//    UILabel *nameLable;
//    UILabel *intorLabel;
//    UIImageView *picView;
//    UIImageView *iconView;
}

#pragma mark cell 高度
@property (assign,nonatomic) CGFloat *cellHeight;

-(void)setData:(ChatVO*)name;

@end
