//
//  LoginCoordinator.m
//  qtum wallet
//
//  Created by Никита Федоренко on 21.02.17.
//  Copyright © 2017 Designsters. All rights reserved.
//

#import "LoginCoordinator.h"
#import "LoginViewController.h"


@interface LoginCoordinator () <LoginCoordinatorDelegate>

@property (nonatomic,strong) UINavigationController *navigationController;
@property (weak,nonatomic) LoginViewController *loginController;

@end

@implementation LoginCoordinator

-(instancetype)initWithNavigationViewController:(UINavigationController*)navigationController{
    self = [super init];
    if (self) {
        _navigationController = navigationController;
    }
    return self;
}

-(void)start{
    LoginViewController* controller = (LoginViewController*)[[ControllersFactory sharedInstance] createLoginController];
    controller.delegate = self;
    [_navigationController pushViewController:controller animated:NO];
    self.loginController = controller;
}

-(void)passwordDidEntered:(NSString*)password{
    if ([password isEqualToString:[WalletManager sharedInstance].PIN]) {
        if ([self.delegate respondsToSelector:@selector(coordinatorDidLogin:)]) {
            [self.delegate coordinatorDidLogin:self];
        }
    }else {
        [self.loginController applyFailedPasswordAction];
    }
}

-(void)confirmPasswordDidCanceled{
    if ([self.delegate respondsToSelector:@selector(coordinatorDidCanceledLogin:)]) {
        [self.delegate coordinatorDidCanceledLogin:self];
    }
}


@end
