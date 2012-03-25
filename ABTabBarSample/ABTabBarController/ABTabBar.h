//
//  ABTabBar.h
//
//  Created by Alexander Blunck on 15.02.12.
//  Copyright (c) 2012 Ablfx. All rights reserved.
//

#import <UIKit/UIKit.h>

//Delegate Declaration
@protocol ABTabBarDelegate <NSObject>

@required //These methods need to be implemented
-(void) abTabBarSwitchView:(UIViewController*)viewController;

@end

@interface ABTabBar : UIView {
    float tabBarHeight;
}

@property (nonatomic, retain) NSMutableArray *tabBarItemArray;
@property (nonatomic, retain) NSMutableArray *buttonArray;

-(id) initWithTabItems:(NSArray*)tabBarItemsArray height:(float)tbHeight backgroundImage:(UIImage*)bgImage;
-(void) createTabs;
-(void) loadDefaultView;

//Declare Delegate as property
@property(nonatomic, retain) id <ABTabBarDelegate> delegate;

@end
