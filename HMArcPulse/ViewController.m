//
//  ViewController.m
//  HMArcPulse
//
//  Created by humiao on 2019/12/5.
//  Copyright © 2019 humiao. All rights reserved.
//

#import "ViewController.h"
#import "HMArcPulseView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = HEX_RGBA(0x0b0324, 1);
    
    HMArcPulseView *pulseView = [[HMArcPulseView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width-60, self.view.bounds.size.width-60) widerThanTheOriginal:5 anmationDuration:2];
    pulseView.center = self.view.center;
    [self.view addSubview:pulseView];
    
    // Do any additional setup after loading the view.
}


@end
