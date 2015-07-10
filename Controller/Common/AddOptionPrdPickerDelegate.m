//
//  MastPickerDelegate.m
//  OML Mobile
//
//  Created by Mac Mini on 15-01-25.
//  Copyright (c) 2015 Mac Mini. All rights reserved.
//

#import "AddOptionPrdPickerDelegate.h"

NSString *const Mast_Height = @"Mast Height";
NSString *const Carriage    = @"Carriage";
NSString *const Fork        = @"Fork";

@implementation AddOptionPrdPickerDelegate

@synthesize data, selectedData, product, optionType;

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1; //give components here
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [data count];   //give rows here
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [data objectAtIndex:row];  // give titles
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component {
    self.selectedData = [self.data objectAtIndex:row];
    //NSLog(@"Selected Data %@", self.selectedData);
    if( [optionType isEqualToString:Mast_Height] )
        self.product.mastHeight = self.selectedData;
    else if( [optionType isEqualToString:Carriage] )
        self.product.carriage = self.selectedData;
    else if( [optionType isEqualToString:Fork] )
        self.product.fork = self.selectedData;
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
}

@end
