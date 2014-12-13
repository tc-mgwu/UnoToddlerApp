//
//  Triangle.m
//  UnoApp
//
//  Created by Toni Chen on 10/21/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Triangle.h"

@implementation Triangle

{
    
    CGPoint startTouch;
    CGPoint endTouch;


}

- (id)init
{
    self = [super init];
    
    return self;
}

- (void) onEnter                    //onenter= on screen
{
    [super onEnter];
    self.userInteractionEnabled = TRUE;
    //    self.scale=.8;
}


- (void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event
{
    CGPoint touchLocation = [touch locationInNode:self];
    // create a 'hero' sprite
    self.position = touchLocation;
    CCLOG(@"Received a touch");
}


- (void)touchMoved:(CCTouch *)touch withEvent:(CCTouchEvent *)event
{
    CGPoint touchLocation = [touch locationInNode:self];
    self.position = touchLocation;
}
@end
