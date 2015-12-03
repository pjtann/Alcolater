//
//  ViewController.m
//  Alcolater
//
//  Created by PT on 11/30/15.
//  Copyright (c) 2015 PeterTanner. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//@property (weak, nonatomic) IBOutlet UITextField *beerPercentTextField;
//@property (weak, nonatomic) IBOutlet UISlider *beerCountSlider;
//@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)textFieldDidChange:(UITextField *)sender {
    NSString *enteredText = sender.text;
    float enteredNumber = [enteredText floatValue];
    if (enteredNumber == 0){
        // The user typed 0, or something that's not a number, so clear field
        sender.text = nil;
    }
    
}
- (IBAction)sliderValueDidChange:(UISlider *)sender {
    NSLog(@"Slider valued changed to %f", sender.value);
    // define variables to hold singular or plural of glasses or shots
    NSString *wineGlasses;
    NSString *whiskeyGlasses;
    // determine if singular or plural needed
    if ((int)sender.value == 1){
        wineGlasses = @"glass";
        whiskeyGlasses = @"shot";
    }else{
        wineGlasses = @"glasses";
        whiskeyGlasses = @"shots";
    }
    // determine which controller is using the slider; wine or whiskey based on the title, then set
    // title with addition of number of shots for whiskey and glasses for wine
    if ([self.navigationItem.title containsString:@"Wine"]){
        NSString *myGlasses = [NSString stringWithFormat: @"Wine (%d %@)", (int)sender.value, wineGlasses];
            self.navigationItem.title = myGlasses;
    }else{
        NSString *myShots = [NSString stringWithFormat: @"Whiskey (%d %@)", (int)sender.value, whiskeyGlasses];
            self.navigationItem.title = myShots;
    }

    [self.beerPercentTextField resignFirstResponder];
}

- (IBAction)buttonPressed:(id)sender {
    [self.beerPercentTextField resignFirstResponder];
    // first, calculate how much alcohol is in all those beers...
    int numberOfBeers = self.beerCountSlider.value;
    int ouncesInOneBeerGlass = 12; // asume they are 12 oz beer bottles
    float alcoholPercentageOfBeer = [self.beerPercentTextField.text floatValue] / 100;
    float ouncesOfAlcoholPerBeer = ouncesInOneBeerGlass * alcoholPercentageOfBeer;
    float ouncesOfAlcoholTotal = ouncesOfAlcoholPerBeer * numberOfBeers;
    // now, calculate the equivilant amount of wine...
    float ouncesInOneWineGlass = 5; // wine glasses are usually 5oz
    float alcoholPercentageOfWine = 0.13; // 13 % is average
    float ouncesOfAlcoholPerWineGlass = ouncesInOneWineGlass * alcoholPercentageOfWine;
    float numberOfWineGlasesForEquivilantAlcoholAmount = ouncesOfAlcoholTotal / ouncesOfAlcoholPerWineGlass;
    // decide whether to use "beer"/"beers" and "glass"/"glasses"
    NSString *beerText;
    if (numberOfBeers == 1){
        beerText = NSLocalizedString(@"glass", @"singular glass");
    } else{
        beerText = NSLocalizedString(@"beers", @"plural of beer");
    }
    NSString *wineText;
    if (numberOfWineGlasesForEquivilantAlcoholAmount == 1) {
        wineText = NSLocalizedString(@"glass", @"singular glass");
    }else{
        wineText = NSLocalizedString(@"glasses", @"plural of glass");
    }
    // generate the result text, and display it on the label
    NSString *resultText = [NSString stringWithFormat:NSLocalizedString(@"%d %@ (with %.2f%% alcohol) contains as much alcohol as %.1f %@ of wine.", nil), numberOfBeers, beerText, [self.beerPercentTextField.text floatValue], numberOfWineGlasesForEquivilantAlcoholAmount, wineText];
    self.resultLabel.text = resultText;
    
    
}
- (IBAction)tapGestureDidFire:(UITapGestureRecognizer *)sender {
    [self.beerPercentTextField resignFirstResponder];
    
}

@end
















