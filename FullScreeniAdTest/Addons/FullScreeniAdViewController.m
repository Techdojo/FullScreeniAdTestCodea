//
//  FullScreeniAdViewController.m
//  FullScreeniAdTest
//
//  Created by Nathan Flurry on 8/20/14.
//  Copyright (c) 2014 MyCompany. All rights reserved.
//

#import "FullScreeniAdViewController.h"

@interface FullScreeniAdViewController ()

@end

@implementation FullScreeniAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.view.backgroundColor = [UIColor clearColor];
    
    self.adView = [[UIView alloc] initWithFrame:self.view.bounds];
//    self.adView.layer.zPosition = -10;
    
    self.interstitial = [ADInterstitialAd new];
    [self.interstitial presentInView:self.adView];
    
    
    self.closeButton = [UIButton new];
    
    [self.closeButton setTitle:@"X" forState:UIControlStateNormal];
    self.closeButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
    self.closeButton.frame = CGRectMake(20, 20, 36, 36);
    
    self.closeButton.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.2];
    self.closeButton.layer.cornerRadius = self.closeButton.frame.size.width/2;
    
    [self.closeButton addTarget:self action:@selector(closeButtonTapped) forControlEvents:UIControlEventTouchUpInside];
    [self.closeButton addTarget:self action:@selector(closeButtonDown) forControlEvents:UIControlEventTouchDown];
    [self.closeButton addTarget:self action:@selector(closeButtonOut) forControlEvents:UIControlEventTouchUpOutside];
    
    [self.view addSubview:self.adView];
    [self.view addSubview:self.closeButton];
    
}

- (void)closeButtonTapped {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)closeButtonDown {
    self.closeButton.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.6];
}

- (void)closeButtonOut {
    [UIView animateWithDuration:0.5 animations:^{
        self.closeButton.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.2];
    }];
}

- (void)dismissViewControllerAnimated:(BOOL)flag completion:(void (^)(void))completion {
    [super dismissViewControllerAnimated:flag completion:completion];
    
    self.closeButton.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
