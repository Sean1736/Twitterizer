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

// Inserting hashtags
- (IBAction)hashTagButton:(id)sender {
    NSMutableString *hash = [[NSMutableString alloc] init];
    // Putting a hashtag at the very beginning.
    [hash insertString:@"#" atIndex:0];
    NSLog(@"value of hash variable: %@", hash);
    // This replacing a blank space with a space and hashtag.
    NSString *insertedHash = [self.textView.text stringByReplacingOccurrencesOfString:@" " withString:@" #"];
    NSLog(@"val of insertedHash: %@", insertedHash);
    // ???
    [hash insertString:insertedHash atIndex:1];
    NSLog(@"%@", hash);
    int x = 0;
    for (int i = 0; i < hash.length; i++) {
        char character = [hash characterAtIndex:i];
        NSLog(@"%c - character", character);
        NSString *charString = [NSString stringWithFormat:@"%c", character];
        
        if ([charString containsString:@"#"]) {
            NSLog(@"# found");
            x++;
            NSLog(@"%i", x);
        if (x%2) {
            //odd
            [charString stringByReplacingOccurrencesOfString:@"#" withString:@""];
        } else {
            //even
        }
            
        }
        
        
    }
  
    
    
    // This places the hashes in the actual text view.
    self.textView.text = hash;
}


- (IBAction)twitterizeButton:(id)sender {
    
    //step 2: grab nsstring from the uitextview
    NSString *enteredText = self.textView.text;
    
    //step2: loop over characters in nsstring and remove vowels
    //    NSMutableString *twitterizeOutput = [[NSMutableString alloc] init];
    
    // we added -1 to the condition due to the index starting at 0, otherwise we would miss the last character in the textView.
    
// original for loop idea:
//    for (int i = 0; i <= self.textView.text.length - 1; i++) {
    
    NSString *stringWithoutALower = [enteredText stringByReplacingOccurrencesOfString:@"a" withString:@""];
    NSLog(@"without alower - %@",stringWithoutALower);
    NSString *stringWithoutELower = [stringWithoutALower stringByReplacingOccurrencesOfString:@"e"withString:@""];
    NSLog(@"without elower - %@", stringWithoutELower);
    NSString *stringWithoutILower = [stringWithoutELower stringByReplacingOccurrencesOfString:@"i" withString:@""];
    NSLog(@"without ilower - %@", stringWithoutILower);
    NSString *stringWithoutOLower = [stringWithoutILower stringByReplacingOccurrencesOfString:@"o" withString:@""];
    NSLog(@"without olower - %@", stringWithoutOLower);
    NSString *stringWithoutULower = [stringWithoutOLower stringByReplacingOccurrencesOfString:@"u" withString:@""];
    NSLog(@"without ulower - %@", stringWithoutULower);
    
    NSString *stringWithoutAUpper = [stringWithoutULower stringByReplacingOccurrencesOfString:@"A" withString:@""];
    NSLog(@"without aupper - %@",stringWithoutAUpper);
    NSString *stringWithoutEUpper = [stringWithoutAUpper stringByReplacingOccurrencesOfString:@"E" withString:@""];
    NSLog(@"without eupper- %@",stringWithoutEUpper);
    NSString *stringWithoutIUpper = [stringWithoutEUpper stringByReplacingOccurrencesOfString:@"I" withString:@""];
    NSLog(@"without iupper - %@",stringWithoutIUpper);
    NSString *stringWithoutOUpper = [stringWithoutIUpper stringByReplacingOccurrencesOfString:@"O" withString:@""];
    NSLog(@"without oupper - %@",stringWithoutOUpper);
    NSString *stringWithoutUUpper = [stringWithoutOUpper stringByReplacingOccurrencesOfString:@"U" withString:@""];
    NSLog(@"without uupper - %@",stringWithoutUUpper);
    
    // -(NSString)vowelMethod:(NSString *)vowel:
    
    self.textView.text = stringWithoutUUpper;
    
  
    
    // To update count label instantly when hitting twitterize button. Added Character count text to keep consistent.
    self.countLabel.text = [NSString stringWithFormat:@"Character count: %i", self.textView.text.length];
    
//        if ([enteredText characterAtIndex:i] ="a" || [enteredText characterAtIndex:i] = "E") {
//            ;
//        }
//        
//        NSLog(@"%c",character);
//        
    
//    }
}
// textViewDidChange is a method that is called every time you type a letter in the text view. This counts the characters for us.


/* Alternate way of limiting characters to 140:
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    return textView.text.length + (text.length - range.length) <= 140;
}*/

// How to limit to 140 characters without disabling the textview entirely.
-(void)textViewDidChange:(UITextView *)textView {
    NSUInteger counter = self.textView.text.length;
    
  // We created a stringWithFormat to allow us to add a string with an integer.

    self.countLabel.text = [NSString stringWithFormat:@"Character Count: %lu", (unsigned long)counter];
    NSLog(@"%lu", counter);
    
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
