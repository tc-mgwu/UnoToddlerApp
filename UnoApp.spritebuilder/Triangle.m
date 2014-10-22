//
//  Triangle.m
//  UnoApp
//
//  Created by Toni Chen on 10/21/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Triangle.h"

@implementation Triangle



- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint touchLocation = [touch locationInNode:self];
    // create a 'hero' sprite
    self.position = touchLocation;
    CCLOG(@"Received a touch");
}


- (void)touchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint touchLocation = [touch locationInNode:self];
    self.position = touchLocation;
}
@end
