//
//  TabBarCoordinator.h
//  qtum wallet
//
//  Created by Никита Федоренко on 02.03.17.
//  Copyright © 2017 Designsters. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseCoordinator.h"
#import "TabBarController.h"


@protocol TabBarCoordinatorDelegate <NSObject>

@required
-(void)newsTabDidSelectedWithController:(UIViewController*)controller;
-(void)sendTabDidSelectedWithController:(UIViewController*)controller;
-(void)profileTabDidSelectedWithController:(UIViewController*)controller;
-(void)walletTabDidSelectedWithController:(UIViewController*)controller;

@end

@protocol ApplicationCoordinatorDelegate;

@interface TabBarCoordinator : BaseCoordinator <Coordinatorable,TabBarCoordinatorDelegate>

@property (weak,nonatomic) id <ApplicationCoordinatorDelegate> delegate;

-(instancetype)initWithTabBarController:(TabBarController*)tabBarController;

@end
