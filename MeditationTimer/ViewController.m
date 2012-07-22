//
//  ViewController.m
//  MeditationTimer
//
//  Created by Joe Elwell on Jul/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVAudioPlayer.h>

@interface ViewController ()

@end

@implementation ViewController

@synthesize cancelButton;
@synthesize timePicker;
@synthesize pauseButton;
@synthesize startButton;

#pragma mark Utility methods
- (AVAudioPlayer *) soundNamed:(NSString *)name {
    NSString * path;
    AVAudioPlayer * snd;
    NSError * err;
    
    path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:name];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSURL * url = [NSURL fileURLWithPath:path];
        snd = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&err];
        if (! snd) {
            NSLog(@"Sound named '%@' had error %@", name, [err localizedDescription]);
        } else {
            [snd prepareToPlay];
        }
    } else {
        NSLog(@"Sound file '%@' doesn't exist at '%@'", name, path);
    }
    //change
    return snd;
}


/*
 * This method starts a one shot timer of random (< 1 minute, < 5 minutes) duration.
 * Each time the timer fires, we play a 'tick' sound. 
*/
- (void) startTicker {
    //start random timer
}

/*
 * Plays tick, invalidates timer, and starts timer again
 */
- (void) handleTickTimer {
    [self startTicker];
}


#pragma mark UIPickerViewDataSource methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 10;
}


#pragma mark View LifeCycle methods
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self startTicker];
}

- (void)viewDidUnload
{
    [self setStartButton:nil];
    [self setPauseButton:nil];
    [self setCancelButton:nil];
    [self setTimePicker:nil];
    [super viewDidUnload];

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark Event messages
- (IBAction)startTouched:(id)sender {
}

- (IBAction)pauseTouched:(id)sender {
}

- (IBAction)cancelTouched:(id)sender {
}

@end
