//
//  ABTabBarController.m
//  Enoda
//
//  Created by Alexander Blunck on 09.03.12.
//  Copyright (c) 2012 Ablfx. All rights reserved.
//

#import "ABTabBarController.h"

@implementation ABTabBarController

@synthesize tabBarItems=_tabBarItems, tabBarHeight=_tabBarHeight, backgroundImage=_backgroundImage;

- (void)viewDidLoad{
    [super viewDidLoad];
    
    tabBar = [[ABTabBar alloc] initWithTabItems:self.tabBarItems height:self.tabBarHeight backgroundImage:self.backgroundImage];
    tabBar.delegate = self;
    [self.view addSubview:tabBar];
    [tabBar loadDefaultView];
}

//ABTabBarDelegate Methods
-(void) abTabBarSwitchView:(UIViewController *)viewController {
    //Remove Current active View by getting it via it's tag
    UIView *currentActiveView = [self.view viewWithTag:ACTIVE_ABTABBAR_VIEW];
    [currentActiveView removeFromSuperview];
    
    //Add New View and set it's tag to the new active view
    viewController.view.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-self.tabBarHeight);
    viewController.view.tag = ACTIVE_ABTABBAR_VIEW;
    [self.view insertSubview:viewController.view belowSubview:tabBar];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

-(void) dealloc {
    [super dealloc];
    [tabBar release];
}

@end
