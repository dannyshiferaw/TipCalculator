//
//  ViewController.m
//  TipCalculator
//
//  Created by Daniel Shiferaw on 6/26/18.
//  Copyright © 2018 Daniel Shiferaw. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billTextFiled;

@property (weak, nonatomic) IBOutlet UILabel *tipLabel;

@property (weak, nonatomic) IBOutlet UILabel *totalLabel;

@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@property (weak, nonatomic) IBOutlet UILabel *tip;

@property (weak, nonatomic) IBOutlet UILabel *billLabel;

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"Tip Calculator";

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// is called when the user taps outside of the text box
- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

// is called when the user makes any changes to the text box
- (IBAction)edited:(id)sender {
    double bill = [self.billTextFiled.text doubleValue];
    //Tip percentages
    NSArray *percentages = @[@(0.15), @(0.20), @(0.22)];
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    double tip = tipPercentage * bill;
    double total = tip + bill;
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat: @"$%.2f", total];
}

- (IBAction)onEditingBegin:(id)sender {
    
    CGRect newBillTextFiledFrame = self.billTextFiled.frame;
    newBillTextFiledFrame.origin.y += 30;
    
    CGRect newBillLableFrame = self.billLabel.frame;
    newBillLableFrame.origin.y += 30;
    
    [UIView animateWithDuration:0.2 animations:^{
        self.billTextFiled.frame = newBillTextFiledFrame;
        self.billLabel.frame = newBillLableFrame;
        self.tipLabel.alpha = 0;
        self.tip.alpha = 0;
    }];

}
- (IBAction)onEditingEnd:(id)sender {
    
    //Update bill text filed frame
    CGRect newBillTextFiledFrame = self.billTextFiled.frame;
    newBillTextFiledFrame.origin.y -= 30;
    
    //update bill label frame
    CGRect newBillLabelFrame = self.billLabel.frame;
    newBillLabelFrame.origin.y -= 30;
    
    [UIView animateWithDuration:0.2 animations: ^{
        self.billTextFiled.frame = newBillTextFiledFrame;
        self.billLabel.frame = newBillLabelFrame;
        self.tipLabel.alpha = 1;
        self.tip.alpha = 1;

    }];
    
}


@end
