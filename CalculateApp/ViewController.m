//
//  ViewController.m
//  CalculateApp
//
//  Created by Tim on 2016/4/27.
//  Copyright © 2016年 Tim. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *calculatorDisplay;
@property (nonatomic,strong) NSString * temp;

@end

@implementation ViewController
- (IBAction)numberPressed:(UIButton *)sender {
    NSString *number = sender.currentTitle;
    if (self.typingNumber)
    {
        self.calculatorDisplay.text = [self.calculatorDisplay.text stringByAppendingString:number];
    } else
    {
        self.calculatorDisplay.text = number;
        self.typingNumber = YES;
    }
    
}

- (IBAction)saveButton:(UIButton *)sender {
    //self.temp = self.calculatorDisplay.text;
    [[NSUserDefaults standardUserDefaults]setObject:self.calculatorDisplay.text forKey:@"temp"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}


- (IBAction)recover:(UIButton *)sender {
    //self.calculatorDisplay.text = self.temp;
    self.calculatorDisplay.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"temp"];
}



- (IBAction)calculationPressed:(UIButton *)sender {
    self.typingNumber = NO;
    self.firstNumber = [self.calculatorDisplay.text floatValue];
    self.operation = [sender currentTitle];
}
- (IBAction)setNumberZero:(UIButton *)sender {
    float result = 0;
    self.calculatorDisplay.text = [NSString stringWithFormat:@"%f", result];
}

- (IBAction)equalsPressed:(UIButton *)sender {
    self.typingNumber = NO;
    self.secondNumber = [self.calculatorDisplay.text floatValue];
    
    float result = 0;
    
    if ([self.operation isEqualToString:@"+"])
    {
        result = self.firstNumber + self.secondNumber;
    }
    else if ([self.operation isEqualToString:@"-"])
    {
        result = self.firstNumber - self.secondNumber;
    }
    else if ([self.operation isEqualToString:@"*"])
    {
        result = self.firstNumber * self.secondNumber;
    }
    else if ([self.operation isEqualToString:@"/"])
    {
        result = self.firstNumber / self.secondNumber;
    }

    self.calculatorDisplay.text = [NSString stringWithFormat:@"%f", result];
}

@end
