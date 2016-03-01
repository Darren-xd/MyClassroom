//
//  FriendsViewController.m
//  MyClassroom
//
//  Created by Darren on 12/18/15.
//  Copyright © 2015 darren. All rights reserved.
//

#import "FriendsViewController.h"


@interface FriendsViewController ()<UIGestureRecognizerDelegate>

@property(nonatomic,strong) UITextField *inputTextField;
@property(nonatomic,strong) UIImageView *imageView;
@property(nonatomic,strong) UIPageControl *uipageView;
@property(nonatomic,strong) UIScrollView *scrollView;
@end

@implementation FriendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"通讯录";
    
    _uipageView = [[UIPageControl alloc]initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height)];
    _uipageView.currentPageIndicatorTintColor = [UIColor redColor];
    _uipageView.pageIndicatorTintColor = [UIColor darkGrayColor];
    _uipageView.numberOfPages = 4;
    [_uipageView addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _scrollView.backgroundColor = [UIColor redColor];
    for (int i = 0; i < 4; i++) {
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, i* 10, self.view.frame.size.width, self.view.frame.size.width)];
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"image%d.jpg",i]];
        imageView.image = image;
//        [_scrollView addSubview:imageView];
    }
    
    
    
    [self.view addSubview:_scrollView];
    [self.view addSubview:_uipageView];
    /*
    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, self.view.frame.size.width, self.view.frame.size.height)];
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.userInteractionEnabled = YES;
    [_imageView setImage:[UIImage imageNamed:@"image4.jpg"]];
    [self.view addSubview:_imageView];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(UserClick:)];
    singleTap.delegate = self;
    [_imageView addGestureRecognizer:singleTap];
    
    _inputTextField= [[UITextField alloc]initWithFrame:CGRectMake(10, 100, 200, 30)];
    _inputTextField.text = @"你好啊";
    _inputTextField.clearButtonMode = UITextFieldViewModeAlways;
//    _inputTextField.secureTextEntry = YES;
    //获得焦点 弹出键盘
//    [_inputTextField becomeFirstResponder];
    
    
    
//    [self.view addSubview:_inputTextField];
    //观察者模式，点击北京关闭键盘
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(fingerIncident:)];
    recognizer.delegate = self;
    [self.view addGestureRecognizer:recognizer];
    
*/
}


-(void)changePage:(UIPageControl *)pageControl
{
    NSString *msg = [NSString stringWithFormat:@"page index is %ld",(long)pageControl.currentPage];
    NSLog(msg,nil);
    
    
    
}


-(void)UserClick:(UITapGestureRecognizer *)sender
{
    NSLog(@"click image",nil);
    int index = arc4random() % 4 + 1;
    NSString *jpgName = [NSString stringWithFormat:@"image%d.jpg",index];
    [_imageView setImage:[UIImage imageNamed:jpgName]];
}

-(void)fingerIncident:(UITapGestureRecognizer *)sender{
    [_inputTextField resignFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
