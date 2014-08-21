//
//  FullScreeniAdAddOn.m
//  FullScreeniAdTest
//
//  Created by Nathan Flurry on 8/20/14.
//  Copyright (c) 2014 MyCompany. All rights reserved.
//

#import "lua.h"
#import "FullScreeniAdAddOn.h"

@implementation FullScreeniAdAddOn

#pragma mark - Initialisation

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        FullScreeniAdAddOnInstance = self;
        
        self.adVC = [FullScreeniAdViewController new];
    }
    return self;
}

#pragma mark - CodeaAddon Delegate

- (void) codea:(CodeaViewController*)controller didCreateLuaState:(struct lua_State*)L
{
    NSLog(@"FullScreeniAdAddOn Registering Functions");
    
    lua_register(L, "showAd", showAd); // Shows ad in view controller's view, calls cycle ad automatically
    lua_register(L, "closeAd", closeAd); // Dismisses the ad, will not pay you (as much) money as a full ad
    
    self.codeaViewController = controller;
}

#pragma mark - Show App

static int showAd (struct lua_State *state) {
    [FullScreeniAdAddOnInstance showAdAction];
    
    return 0;
}

- (void)showAdAction {
    [self.codeaViewController presentViewController:self.adVC animated:YES completion:nil];
}

static int closeAd (struct lua_State *state) {
    [FullScreeniAdAddOnInstance closeAdAction];
    
    return 0;
}

- (void) closeAdAction {
    [self.adVC dismissViewControllerAnimated:YES completion:nil];
}

@end