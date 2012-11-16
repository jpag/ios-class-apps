//
//  jpgViewController.m
//  hit me game
//
//  Created by jpg on 10/10/12.
//  Copyright (c) 2012 com.jpg. All rights reserved.
//

#import "jpgViewController.h"

@interface jpgViewController ()

@end

@implementation jpgViewController{
    //put variables in here:
    int currentValue;
    int targetValue;
}

@synthesize slider;
@synthesize targetLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self startNewRound];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.slider = nil;
    self.targetLabel = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //return UIInterfaceOrientationIsLandscape(interfaceOrientation);
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)showAlert{
    
    NSString *message = [NSString stringWithFormat:@"The value of the slider is: %d\nThe Target value is: %d", currentValue, targetValue];
    
    UIAlertView *alertView = [[UIAlertView alloc]
        initWithTitle:@"Hello, World"
        message:message
        delegate:nil
        cancelButtonTitle:@"Close Alert"
        otherButtonTitles:nil];
    
    [alertView show];
    [self startNewRound];
}

- (IBAction)sliderMoved:(UISlider *)sender{
    //NSLog(@"the value is %f" , slider.value );
    currentValue = lroundf(sender.value);
}

- (void)updateLabels{
    self.targetLabel.text = [NSString stringWithFormat:@"%d", targetValue];
}

- (void)startNewRound{
    targetValue = 1 + (arc4random() % 100 );
    currentValue = 50;
    self.slider.value = currentValue;
    
}

@end
