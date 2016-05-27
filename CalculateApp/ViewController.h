//
//  ViewController.h
//  CalculateApp
//
//  Created by Tim on 2016/4/27.
//  Copyright © 2016年 Tim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic) BOOL typingNumber; //check if user is typing a number
@property (nonatomic) float firstNumber;
@property (nonatomic) float secondNumber;
@property (nonatomic, copy) NSString *operation; // plus or minus operation


@end

