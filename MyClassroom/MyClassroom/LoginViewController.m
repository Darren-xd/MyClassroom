//
//  LoginViewController.m
//  MyClassroom
//
//  Created by Darren on 12/7/15.
//  Copyright © 2015 darren. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"

@interface LoginViewController ()

@property (nonatomic,strong) UITextField *userNameTextField;
@property (nonatomic,strong) UITextField *userPwdTextField;
@property (nonatomic,strong) UIButton *loginBtn;


@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _userNameTextField = [[UITextField alloc]initWithFrame:CGRectMake(100,50, 200, 30)];
    _userNameTextField.layer.borderColor = [UIColor grayColor].CGColor;
    _userNameTextField.layer.borderWidth = 1;
    _userNameTextField.placeholder = @"请输入账号";
    [self.view addSubview:_userNameTextField];
    _userPwdTextField = [[UITextField alloc]initWithFrame:CGRectMake(100,90, 200, 30)];
    _userPwdTextField.layer.borderColor = [UIColor grayColor].CGColor;
    _userPwdTextField.layer.borderWidth = 1;
    _userPwdTextField.placeholder = @"请输入密码";
    _userPwdTextField.secureTextEntry = YES;
    
   
    [self.view addSubview:_userPwdTextField];
    
    _loginBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];//[[UIButton alloc]initWithFrame:CGRectMake(150, 150, 80, 30)];
    _loginBtn.frame = CGRectMake(150, 150, 80, 30);
    _loginBtn.backgroundColor = [UIColor brownColor];
    [_loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    [_loginBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:_loginBtn];
    
    [_loginBtn addTarget:self action:@selector(loginAction) forControlEvents:UIControlEventTouchUpInside];
    
    //使用观察者模式检测文本修改
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(txtChange) name:UITextFieldTextDidChangeNotification object:self.userNameTextField];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(txtChange) name:UITextFieldTextDidChangeNotification object:self.userPwdTextField];
    
    self.loginBtn.enabled = NO;
    
}

-(void)txtChange{
    if (self.userPwdTextField.text.length >= 6 && self.userNameTextField.text.length) {
        self.loginBtn.enabled = YES;
    }else{
        self.loginBtn.enabled = NO;
    }
}


-(void)loginAction{
    
    if ([self.userNameTextField.text isEqualToString:@"xd"] && [self.userPwdTextField.text isEqualToString:@"123456"]) {

//        [self showTipWindow:@"登陆成功"];
        MainViewController *mainView = [[MainViewController alloc]init];
        [self presentViewController:mainView animated:YES completion:nil];
        
//        [self.navigationController pushViewController:mainView animated:YES];
        
    }else{
        [self showTipWindow:@"用户名或密码错误"];
    }
}

-(void)showTipWindow:(NSString *)msg{
    UIAlertAction *delAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:msg preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:delAction];
    [self presentViewController:alert animated:YES completion:nil];
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
