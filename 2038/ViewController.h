//
//  ViewController.h
//  2038
//
//  Created by Brian Saunders on 12/29/14.
//  Copyright (c) 2014 Brian Saunders. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (strong, nonatomic) NSTimer *timer;
@property (weak, nonatomic) IBOutlet UILabel *counterLabel;
@property (strong, nonatomic) IBOutlet UIButton *moreInfoButton;

- (void)updateCounter:(NSNumber *)timer;
- (void)countdownTimer;
- (IBAction)showMoreInfo:(id)sender;

@end

