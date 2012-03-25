//
//  ABTabBar.m
//
//  Created by Alexander Blunck on 15.02.12.
//  Copyright (c) 2012 Ablfx. All rights reserved.
//

#import "ABTabBar.h"
#import "AbTabBarItem.h"

@implementation ABTabBar

@synthesize delegate;
@synthesize tabBarItemArray=_tabBarItemArray, buttonArray=_buttonArray;

-(id) initWithTabItems:(NSArray*)tabBarItemsArray height:(float)tbHeight backgroundImage:(UIImage*)bgImage{
    if ((self = [super init])) {
        
        //Set TabBar Height
        tabBarHeight = tbHeight;
        
        //Frame
        self.frame = CGRectMake(0, 480-20-tabBarHeight, 320, tabBarHeight);
        
        //BackgroundImage if not set use simple black background
        if (bgImage == nil) {
            self.backgroundColor = [UIColor blackColor];
        } else {
            self.backgroundColor = [UIColor colorWithPatternImage:bgImage];
        }
        
        //Load all tabBarItems into local Array
        self.tabBarItemArray= [NSMutableArray arrayWithArray:tabBarItemsArray];
        
        //Alocate Array to hold the UIButtons created from the ABTabBarItems
        self.buttonArray = [NSMutableArray array];
        
        [self createTabs];
        
    }return self;
}

-(void) createTabs {
    
    //Calculate Tab Width
    int tabCount = self.tabBarItemArray.count;
    float tabWidth = 320 / tabCount;
    
    int tabCounter = 0;
    
    for (AbTabBarItem *aTabBarItem in self.tabBarItemArray) {
        
        float buttonXValue = tabWidth*tabCounter;
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = tabCounter;
        button.frame = CGRectMake(buttonXValue, 0, tabWidth, tabBarHeight);
        
        //Set Images for different States
        [button setBackgroundImage:aTabBarItem.image forState:UIControlStateNormal];
        [button setBackgroundImage:aTabBarItem.selectedImage forState:UIControlStateHighlighted];
        [button setBackgroundImage:aTabBarItem.selectedImage forState:UIControlStateSelected];
        
        //Keep button from "darkening out" when selected twice
        [button setAdjustsImageWhenHighlighted:NO];
        
        [button addTarget:self action:@selector(tabTouchedDown:) forControlEvents:UIControlEventTouchDown];
        [button addTarget:self action:@selector(tabTouchedUp:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.buttonArray addObject:button];
        [self addSubview:button];
        
        tabCounter += 1;
    }
    
}

-(void) tabTouchedDown:(UIButton*)touchedTab {
    //Get ABTabBarItem index in array for corresponding button
    int indexOfTabInArray = [self.buttonArray indexOfObject:touchedTab];
    
    //Make sure to only switch views if you select an other tab than the one you are in now
    if (!touchedTab.selected) {
        //Get ViewController of touched tabBarItem
        UIViewController *viewController = [[self.tabBarItemArray objectAtIndex:indexOfTabInArray] viewController];
        
        //Tell Delegate to Switch View
        [self.delegate abTabBarSwitchView:viewController];
    }
    
}

-(void) tabTouchedUp:(UIButton*)touchedTab {
    //Set All other tabs unselected
    for (UIButton *button in self.buttonArray) {
        [button setSelected:NO];
    }
    //Set touched tab selected
    [touchedTab setSelected:YES];
}

-(void) loadDefaultView {
    [self tabTouchedDown:[self.buttonArray objectAtIndex:0]];
    [self tabTouchedUp:[self.buttonArray objectAtIndex:0]];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
