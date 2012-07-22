//
//  ViewController.h
//  MeditationTimer
//
//  Created by Joe Elwell on Jul/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDelegate>

- (IBAction)startTouched:(id)sender;
- (IBAction)pauseTouched:(id)sender;
- (IBAction)cancelTouched:(id)sender;

//UIPickerViewDataSource methods
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView;
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component;

@property (assign,nonatomic) IBOutlet UIPickerView *timePicker;
@property (assign, nonatomic) IBOutlet UIButton *pauseButton;
@property (assign, nonatomic) IBOutlet UIButton *startButton;
@property (assign, nonatomic) IBOutlet UIButton *cancelButton;
@end
