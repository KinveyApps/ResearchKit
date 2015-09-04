/*
 Copyright (c) 2015, Apple Inc. All rights reserved.
 
 Redistribution and use in source and binary forms, with or without modification,
 are permitted provided that the following conditions are met:
 
 1.  Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.
 
 2.  Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation and/or
 other materials provided with the distribution.
 
 3.  Neither the name of the copyright holder(s) nor the names of any contributors
 may be used to endorse or promote products derived from this software without
 specific prior written permission. No license is granted to the trademarks of
 the copyright holders even if such marks are included in this software.
 
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
 FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
 OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */


#import "ORKPasscodeStepView.h"
#import "ORKHelpers.h"
#import "ORKSkin.h"
#import "ORKTintedImageView.h"


@implementation ORKPasscodeStepView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        // Header view configuration.
        self.headerView.captionLabel.text = ORKLocalizedString(@"PASSCODE_PROMPT_MESSAGE", nil);

        // Additional configuration for the passcode text field.
        self.textField = [ORKPasscodeTextField new];
        self.textField.defaultTextAttributes = @{NSKernAttributeName : @(20.0f),
                                                 NSFontAttributeName : [UIFont fontWithName:@"Courier" size:35.0]};
        self.textField.textAlignment = NSTextAlignmentCenter;
        self.textField.translatesAutoresizingMaskIntoConstraints = NO;
        
        self.stepView = self.textField;
        
        [self addConstraints:@[
                               [NSLayoutConstraint constraintWithItem:self.textField
                                                            attribute:NSLayoutAttributeWidth
                                                            relatedBy:NSLayoutRelationEqual
                                                               toItem:self
                                                            attribute:NSLayoutAttributeWidth
                                                           multiplier:1.0
                                                             constant:0]
                               ]];
        
        [self updateAppearance];
    }
    return self;
}

- (void)updateAppearance {
    _textField.text = (_passcodeType == ORKPasscodeType4Digit) ? k4DigitPin : k6DigitPin;
}

- (void)setPasscodeType:(ORKPasscodeType)passcodeType {
    _passcodeType = passcodeType;
    [self updateAppearance];
}

@end
