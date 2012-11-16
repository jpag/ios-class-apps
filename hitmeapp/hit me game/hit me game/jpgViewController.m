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
    int score;
    int round;
}

@synthesize slider;
@synthesize targetLabel;
@synthesize scoreLabel;
@synthesize roundLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self startNewRound];
    [self updateLabels];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.slider = nil;
    self.targetLabel = nil;
    self.scoreLabel = nil;
    self.round = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //return UIInterfaceOrientationIsLandscape(interfaceOrientation);
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)showAlert{
    
    int difference = abs(targetValue - currentValue);
    int points = 100 -difference;
    
    score += points;
    
    NSString *message = [NSString stringWithFormat:@"You scored: %d", points];
    
    UIAlertView *alertView = [[UIAlertView alloc]
        initWithTitle:@"Hello, World"
        message:message
        delegate:self
        //delegate:nil changed to self for callback below:
        cancelButtonTitle:@"Close Alert"
        otherButtonTitles:nil];
    
    [alertView show];
    [self startNewRound];
}


//http://stackoverflow.com/questions/9661900/is-there-easy-way-to-handle-uialertview-result-without-delegation
- (void)alertView:(UIAlertView *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    //Checks For Approval
    if (buttonIndex == 1) {
        //do something because they selected button one, yes
    } else {
        //do nothing because they selected no
    }
    [self updateLabels];
}


- (IBAction)sliderMoved:(UISlider *)sender{
    //NSLog(@"the value is %f" , slider.value );
    currentValue = lroundf(sender.value);
}

- (void)updateLabels{
    self.targetLabel.text = [NSString stringWithFormat:@"%d", targetValue];
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", score ];
}

- (void)startNewRound{
    targetValue = 1 + (arc4random() % 100 );
    currentValue = 50;
    self.slider.value = currentValue;
    
}

@end
