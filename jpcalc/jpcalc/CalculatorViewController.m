//
//  CalculatorViewController.m
//  jpcalc
//
//  Created by Jean-Pierre Gary on 6/13/12.
//  Copyright (c) 2012 All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) CalculatorBrain *brain;
@end;

@implementation CalculatorViewController

@synthesize display = _display;
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;

@synthesize brain = _brain;

-(CalculatorBrain*)brain{
    if( !_brain) _brain = [[CalculatorBrain alloc] init];
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender {
	
    //copy to local variable digit 
    NSString *digit =[sender currentTitle];
    // %@ argument is an object
	//NSLog(@"digit pressed = %@",digit);
    
    //UILabel *myDisplay = [self display];
    //UILabel *myDisplay = self.display;
    //NSString *currentText = myDisplay.text; //getter .text
    //NSString *currentText = self.display.text;
    //NSString *newText = [currentText stringByAppendingString:digit];
    
    //[myDisplay setText:newText];
    //myDisplay.text = newText; //setter .text
    
    if( self.userIsInTheMiddleOfEnteringANumber ){
	    self.display.text = [self.display.text stringByAppendingString:digit];
    }else{
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
    
}

- (IBAction)enterPressed {
    //no sender argument.
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;
}


- (IBAction)operationPressed:(UIButton *)sender {
    
    //for convenience.
    if( self.userIsInTheMiddleOfEnteringANumber ){ 
        [self enterPressed ];
        NSLog(@" CALL ENTER ");
    }
    
    //[self.brain pushOperand:[self.display.text doubleValue]];
    //self.userIsInTheMiddleOfEnteringANumber = NO;
    double result = [self.brain performOperation:sender.currentTitle];
    NSString *resultString = [NSString stringWithFormat:@"%g",result];
    
    self.display.text = resultString;
    
    
}



@end
