//
//  ViewController.m
//  ABTabBarSample
//
//  Created by Alexander Blunck on 25.03.12.
//  Copyright (c) 2012 Ablfx. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

@synthesize number=_number;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [numberLabel setText:[NSString stringWithFormat:@"%i", self.number]];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
