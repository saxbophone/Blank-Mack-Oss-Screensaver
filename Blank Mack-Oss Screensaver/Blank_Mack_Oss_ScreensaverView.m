//
//  Blank_Mack_Oss_ScreensaverView.m
//  Blank Mack-Oss Screensaver
//
//  Created by Joshua Saxby on 2019-04-16.
//  Copyright © 2019 Joshua Saxby. All rights reserved.
//

#import "Blank_Mack_Oss_ScreensaverView.h"

@implementation Blank_Mack_Oss_ScreensaverView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        [self setAnimationTimeInterval:1/30.0];
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
}

- (void)animateOneFrame
{
    /*
     * simple "show that we are doing something" drawing code
     * -- fill screen with white
     */
    [[NSColor whiteColor] setFill];
    NSRectFill(self.bounds);
    return;
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

@end
