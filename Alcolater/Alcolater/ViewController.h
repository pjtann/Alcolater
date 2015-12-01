//
//  ViewController.h
//  Alcolater
//
//  Created by PT on 11/30/15.
//  Copyright (c) 2015 PeterTanner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *beerPercentTextField;
@property (weak, nonatomic) IBOutlet UISlider *beerCountSlider;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;


- (void) buttonPressed:(UIButton *) sender;

@end

