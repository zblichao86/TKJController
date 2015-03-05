//
//  BackMessageViewController.m
//  TKJController
//
//  Created by apple on 15/3/3.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "BackMessageViewController.h"

@interface BackMessageViewController ()

@end

@implementation BackMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.backTextView.delegate = self;
    [_backTextView becomeFirstResponder];
    
    UIToolbar * topView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, screenWidth, 30)];
    [topView setBarStyle:UIBarStyleDefault];
    
    UIBarButtonItem * button1 =[[UIBarButtonItem alloc]initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem * button2 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem: UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem * doneButton = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone target:self action:@selector(resignKeyboard)];
    NSArray * buttonsArray = [NSArray arrayWithObjects:button1,button2,doneButton,nil];
    [topView setItems:buttonsArray];
    [_backTextView setInputAccessoryView:topView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)backButton {
    [_backTextView resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)senderMessage {
    
}

- (void)resignKeyboard
{
    
    [_backTextView resignFirstResponder];
}

@end
