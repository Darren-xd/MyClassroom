//
//  ChatItemTableViewCell.m
//  MyClassroom
//
//  Created by Darren on 1/13/16.
//  Copyright © 2016 darren. All rights reserved.
//

//自定义Cell分为两个步骤：首先要进行各种控件的初始化工作，这个过程中只要将控件放到Cell的View中同时设置控件显示内容的格式（字体大小、颜色等）即可；然后在数据对象设置方法中进行各个控件的布局（大小、位置）。
//对于单行文本数据的显示调用- (CGSize)sizeWithAttributes:(NSDictionary *)attrs;方法来得到文本宽度和高度。
//对于多行文本数据的显示调用- (CGRect)boundingRectWithSize:(CGSize)size options:(NSStringDrawingOptions)options attributes:(NSDictionary *)attributes context:(NSStringDrawingContext *)context ;方法来得到文本宽度和高度；同时注意在此之前需要设置文本控件的numberOfLines属性为0。
//通常我们会在自定义Cell中设置一个高度属性，用于外界方法调用，因为Cell内部设置Cell的高度是没有用的，UITableViewCell在初始化时会重新设置高度。




#import "ChatItemTableViewCell.h"

@interface ChatItemTableViewCell()

@property (nonatomic,weak) UIImageView *iconView;
@property (nonatomic,weak) UIImageView *pictureView;
@property (nonatomic,weak) UILabel *nameLabel;
@property (nonatomic,weak) UILabel *intorLabel;
@property (nonatomic,weak) UILabel *sendLabel;

@property(nonatomic,strong)ChatVO *chat;

@end


@implementation ChatItemTableViewCell


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
//        UIImageView *iconView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 9, 50, 50)];
        UIImageView *iconView = [[UIImageView alloc]init];
        iconView.translatesAutoresizingMaskIntoConstraints = NO;
        iconView.layer.cornerRadius = 8;
        iconView.layer.masksToBounds = YES;
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        
        
        NSLayoutConstraint *iconLeft = [NSLayoutConstraint constraintWithItem:_iconView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0f constant:10.0f];
        [self addConstraint:iconLeft];
        
        NSLayoutConstraint *iconTop = [NSLayoutConstraint constraintWithItem:_iconView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0f constant:9];
        [self addConstraint:iconTop];
        
        
        UIImageView *pictureView = [[UIImageView alloc]init];
        [self.contentView addSubview:pictureView];
        self.pictureView = pictureView;
        
        UILabel *nameLabel = [[UILabel alloc]init];
        [self.contentView addSubview:nameLabel];
        _nameLabel = nameLabel;
        
        UILabel *intorLabel = [[UILabel alloc]init];
        [self.contentView addSubview:intorLabel];
        intorLabel.textColor = [UIColor grayColor];
        _intorLabel = intorLabel;
        
        UILabel *sendLab = [[UILabel alloc]initWithFrame:CGRectMake(370, 14, 100, 20)];
        [self.contentView addSubview:sendLab];
        sendLab.font = [UIFont systemFontOfSize:12];
        sendLab.textColor = [UIColor grayColor];
        _sendLabel = sendLab;
    }
    return self;
}

-(void)clear{
    
}

-(void)setData:(ChatVO*)name{
    _chat = name;
    _nameLabel.text    = _chat.nickName;
    _intorLabel.text   = _chat.msg;
    _iconView.image = [UIImage imageNamed:_chat.icon];
    _sendLabel.text = @"12:12";
    
    _nameLabel.frame = CGRectMake(70, 14, 500, 20);

    _intorLabel.frame = CGRectMake(70, 36, 500, 20);
    _intorLabel.font = [UIFont systemFontOfSize:14];
    [self layoutIfNeeded];
}





@end
