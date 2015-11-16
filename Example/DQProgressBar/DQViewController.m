//
//  DQViewController.m
//  DQProgressBar
//
//  Created by zengdaqian on 11/13/2015.
//  Copyright (c) 2015 zengdaqian. All rights reserved.
//

#import "DQViewController.h"
#import "DQGradientProgressBar.h"


@interface DQViewController ()
@property (strong, nonatomic) IBOutlet DQGradientProgressBar *progressBar;

@end

IB_DESIGNABLE
@implementation DQViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self.progressBar.progress = 0.5;
    self.progressBar.barColors = @[(id)[UIColor colorWithRed:75/255.0 green:136/255.0 blue:217/255.0 alpha:1.0].CGColor,
                                   (id)[UIColor colorWithRed:235/255.0 green:95/255.0 blue:108/255.0 alpha:1.0].CGColor];
}

- (IBAction)sliderValueChanged:(UISlider *)sender {
    self.progressBar.progress = sender.value;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
