//
//  MassageChatTableViewCell.m
//  MyClassroom
//
//  Created by Darren on 2/23/16.
//  Copyright © 2016 darren. All rights reserved.
//

#import "MassageChatTableViewCell.h"


@interface MassageChatTableViewCell()

@property(nonatomic,strong)UIImageView *headPic;
@property(nonatomic,strong)UIImageView *bg;
@property(nonatomic,strong)UILabel *msgLable;
@property(nonatomic,weak)ChatVO *chatVo;

@end

@implementation MassageChatTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self != nil){
        _headPic = [[UIImageView alloc]init];
        _headPic.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_headPic];
        _bg = [[UIImageView alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:_bg];
        _msgLable = [[UILabel alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:_msgLable];
        self.backgroundColor = [UIColor clearColor];
        
        
        NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:_headPic attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0f constant:0.0f];
        [self addConstraint:leftConstraint];
        
        
//        NSLayoutConstraint *msgLayoutConstarint = []
        
    }
    return self;
}


-(void)setData:(ChatVO *)vo
{
    _chatVo = vo;
    if (vo.type == 1) {
        [self drawSelfCell];
    }else{
        
    }
}
/*
 * 绘制自己的消息样式
 */
-(void)drawSelfCell{
    
    _msgLable.text = _chatVo.msg;
    //计算文本的高度
    NSDictionary *attribute = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
    CGSize size = [_chatVo.msg boundingRectWithSize:CGSizeMake(300, 0) options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:attribute context:nil].size;
    _msgLable.frame = CGRectMake(0, 0,size.width,size.height);
    
    
    _headPic.image = [UIImage imageNamed:_chatVo.icon];
//    _headPic.frame = CGRectMake(250, 0, 50, 50);
  
}


@end
