//
//  CalculatorBrain.m
//  jpcalc
//
//  Created by Jean-Pierre Gary on 6/15/12.
//  Copyright (c) 2012 Noise New York. All rights reserved.
//

#import "CalculatorBrain.h"

//stack makes it self a bit bigger or smaller as needed.
@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *operandStack;
@end;

//strong helps manage the memory (makes the variable strong in the memory...)


@implementation CalculatorBrain


//creates the getter and setter 
@synthesize operandStack = _operandStack;

//getter has lazy instantition added
- (NSMutableArray *)operandStack{
    //lazy instantition.. allocate at the last moment when needed.
    //if( _operandStack == nil)
    if( !_operandStack) _operandStack = [[NSMutableArray alloc] init];
    return _operandStack;
}

/*
//setter
-(void)setOperandStack:(NSMutableArray *)operandStack{
    _operandStack = operandStack;
}
*/

-(void)pushOperand:(double)operand{
	
    
	[self.operandStack addObject:[NSNumber numberWithDouble:operand] ];
    
};

-(double)popOperand{
    NSNumber *operandObject = [self.operandStack lastObject]; //pointer to last object NOT a copy.
    
    //if( operandObject != nil )
	if( operandObject ) [self.operandStack removeLastObject];
    
    return[ operandObject doubleValue];
}

-(double)performOperation:(NSString *)operation{
	
    
    double result = 0;
    
    if( [operation isEqualToString:@"+"]){
        result = [self popOperand] + [self popOperand ];
    }else if( [@"*" isEqualToString:operation]){
        result = [self popOperand] + [self popOperand ];
    }
    
    //push result back into the stack
    [self pushOperand:result];
    
    
    return result;
};

@end
