//
//  PaintView.m
//  MyClassroom
//
//  Created by Darren on 2/5/16.
//  Copyright © 2016 darren. All rights reserved.
//

#import "PaintView.h"

@implementation PaintView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.




- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 0, 0);
    
}


@end
