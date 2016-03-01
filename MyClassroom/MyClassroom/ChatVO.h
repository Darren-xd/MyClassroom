//
//  ChatVO.h
//  MyClassroom
//
//  Created by Darren on 12/20/15.
//  Copyright © 2015 darren. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ChatVO : NSObject

@property(nonatomic,strong)NSString *nickName;
@property(nonatomic,strong)NSString *msg;
@property(nonatomic,strong)NSString *icon;
@property(nonatomic,assign)int type;


@end
