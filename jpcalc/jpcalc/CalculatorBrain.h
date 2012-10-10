//
//  CalculatorBrain.h
//  jpcalc
//
//  Created by Jean-Pierre Gary on 6/15/12.
//  Copyright (c) 2012
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

-(void)pushOperand:(double)operand;
-(double)performOperation:(NSString *)operation;

@end
