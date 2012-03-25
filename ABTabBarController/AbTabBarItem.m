//
//  AbTabBarItem.m
//
//  Created by Alexander Blunck on 15.02.12.
//  Copyright (c) 2012 Ablfx. All rights reserved.
//

#import "AbTabBarItem.h"

@implementation AbTabBarItem

@synthesize selectedImage=_selectedImage, image=_image, viewController=_viewController;

-(id) initWithImage:(UIImage*)image selectedImage:(UIImage*)selectedImage viewController:(UIViewController*)viewcontroller {
    if ((self = [super init])) {
        
        self.image = image;
        self.selectedImage = selectedImage;
        self.viewController = viewcontroller;
        
    }return self;
}

@end
