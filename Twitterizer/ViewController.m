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
    
    NSString *stringWithoutO = [stringWithoutI stringByReplacingOccurrencesOfString:@"o" withString:@"xxxxx"];
    
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

-(void)textViewDidChange:(UITextView *)textView {

    NSLog(@"hi");

}


@end
