//
//  ViewController.m
//  Twitterizer
//
//  Created by Ernie Barojas 2 on 5/25/16.
//  Copyright © 2016 Salar Kohnechi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
self.countLabel.text = @"Character count: 0";
}


- (IBAction)twitterizeButton:(id)sender {
    
    //step 2: grab nsstring from the uitextview
    NSString *enteredText = self.textView.text;
    
    //step2: loop over characters in nsstring and remove vowels
    //    NSMutableString *twitterizeOutput = [[NSMutableString alloc] init];
    
    // we added -1 to the condition due to the index starting at 0, otherwise we would miss the last character in the textView.
    
// original for loop idea:
//    for (int i = 0; i <= self.textView.text.length - 1; i++) {
    
    NSString *stringWithoutA = [enteredText stringByReplacingOccurrencesOfString:@"a" withString:@""];
    
    NSLog(@"without A - %@",stringWithoutA);
    
    NSString *stringWithoutE = [stringWithoutA stringByReplacingOccurrencesOfString:@"e" withString:@""];

    NSLog(@"without E - %@", stringWithoutE);
    
    NSString *stringWithoutI = [stringWithoutE stringByReplacingOccurrencesOfString:@"i" withString:@""];
    
    NSLog(@"without I - %@", stringWithoutI);
    
    NSString *stringWithoutO = [stringWithoutI stringByReplacingOccurrencesOfString:@"o" withString:@""];
    
    NSLog(@"without O - %@", stringWithoutO);
    
    NSString *stringWithoutU = [stringWithoutO stringByReplacingOccurrencesOfString:@"u" withString:@""];
    
    NSLog(@"without U - %@", stringWithoutU);
    
    self.textView.text = stringWithoutU;
    
    
    
//        if ([enteredText characterAtIndex:i] ="a" || [enteredText characterAtIndex:i] = "E") {
//            ;
//        }
//        
//        NSLog(@"%c",character);
//        
    
//    }
}
// textViewDidChange is a method that is called every time you type a letter in the text view. This counts the characters for us.
-(void)textViewDidChange:(UITextView *)textView {
    NSUInteger *counter = self.textView.text.length;
    
  // We created a stringWithFormat to allow us to add a string with an integer.
    self.countLabel.text = [NSString stringWithFormat:@"Character Count: %i", counter];
    NSLog(@"%i", counter);
    
    if (self.textView.text.length >= 140) {
        
        
        NSLog(@"140 characters");

    } else {
    
    }
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {

    if ([self.textView.text length] < 140) {
        return YES;
    } else if ([@"" isEqualToString:text]) {
        self.textView.text = [self.textView.text substringToIndex:140];
    } else {
    return NO;
    }
    return YES;
}

@end
