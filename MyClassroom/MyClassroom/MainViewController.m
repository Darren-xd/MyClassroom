//
//  MainViewController.m
//  MyClassroom
//
//  Created by Darren on 12/9/15.
//  Copyright © 2015 darren. All rights reserved.
//

#import "MainViewController.h"
#import "ChatViewController.h"

@interface MainViewController ()

@property (nonatomic,strong) UITextField *inputTextField;


@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    // Do any additional setup after loading the view.
    
//    UITabBarController *tabBar = [[UITabBarController alloc]init];
//    tabBar.delegate = self;
//    
//    ChatViewController *chat = [[ChatViewController alloc]init];
//    
//    NSArray *viewControllerArray = [NSArray arrayWithObjects:chat, nil];
//    
//    tabBar.viewControllers = viewControllerArray;
//    tabBar.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.si   ze.height);
//    [self.view addSubview:tabBar];
//
    _inputTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 25, 200, 35)];
    [self.view addSubview:_inputTextField];
    _inputTextField.text = @"你好啊";
    UIFont *uiFont = [UIFont boldSystemFontOfSize:20.0f];
    _inputTextField.font = uiFont;
    _inputTextField.backgroundColor = [UIColor redColor];
    
    
//    [ChatViewController getDeviceInfo];
    
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
