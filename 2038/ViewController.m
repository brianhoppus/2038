//
//  ViewController.m
//  2038
//
//  Created by Brian Saunders on 12/29/14.
//  Copyright (c) 2014 Brian Saunders. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    int hours, minutes, seconds, days, years;
    int secondsLeft;
    int currentUnixTime;
    int maxUnixTime;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // setup shape, outline, and color of the "More Info" button
    self.moreInfoButton.layer.cornerRadius = 4;
    self.moreInfoButton.layer.borderWidth = 1;
    self.moreInfoButton.layer.borderColor = [UIColor blueColor].CGColor;
    
    // grab the current ammount of seconds since January 1st, 1970.
    currentUnixTime = [[NSDate date] timeIntervalSince1970];
    maxUnixTime = 2147526847;
    secondsLeft = maxUnixTime - currentUnixTime;
    [self countdownTimer];    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateCounter:(NSTimer *)timer {
    if (secondsLeft > 0) {
        secondsLeft--;
        years = (secondsLeft / ((secondsLeft % 3600) / 60));
        days = (secondsLeft / 86400);
        hours = (secondsLeft / 3600);
        minutes = (secondsLeft % 3600) / 60;
        seconds = (secondsLeft % 3600) % 60;
//        self.counterLabel.text = [NSString stringWithFormat:@"Time Left: %02d:%02d:%02d", hours, minutes, seconds];
        self.counterLabel.text = [NSString stringWithFormat:@"Seconds Left: %d", secondsLeft];
    } else {
        self.counterLabel.text = @"Time's up!";
    }
}

- (void)countdownTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(updateCounter:) userInfo:nil repeats:YES];
}

- (IBAction)showMoreInfo:(id)sender {
    NSURL *y2038Url = [NSURL URLWithString:@"http:en.m.wikipedia.org/wiki/Year_2038_problem"];
    [[UIApplication sharedApplication] openURL:y2038Url];
}

@end
