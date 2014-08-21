//
//  AppDelegate.h
//  FullScreeniAdTest
//
//  Created by Zoyt on Wednesday, August 20, 2014
//  Copyright (c) Zoyt. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FullScreeniAdAddOn.h"

@class CodeaViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) CodeaViewController *viewController;

@property (strong, nonatomic) FullScreeniAdAddOn *fullScreenAd;

@end
