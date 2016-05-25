//
//  ViewController.m
//  Twitterizer
//
//  Created by Ernie Barojas 2 on 5/25/16.
//  Copyright © 2016 Salar Kohnechi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}


- (IBAction)twitterizeButton:(id)sender {
    NSString *enteredText = self.textView.text;
    NSMutableString *twitterizeOutput = [[NSMutableString alloc] init];
    
    for (int i = 0; i < self.textView.text.length - 1; i++) {
         
    }
}

@end
