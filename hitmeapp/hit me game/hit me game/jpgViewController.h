//
//  jpgViewController.h
//  hit me game
//
//  Created by jpg on 10/10/12.
//  Copyright (c) 2012 com.jpg. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface jpgViewController : UIViewController;

@property (nonatomic, strong) IBOutlet UISlider * slider;
@property (nonatomic, strong) IBOutlet UILabel * targetLabel;
@property (nonatomic, strong) IBOutlet UILabel * scoreLabel;
@property (nonatomic, strong) IBOutlet UILabel * roundLabel;

- (IBAction)showAlert;

- (IBAction)sliderMoved:(UISlider*)sender;

@end
