//
//  Shapes.m
//  UnoApp
//
//  Created by Toni Chen on 1/8/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "Shapes.h"

@implementation Shapes
{
    
    CGPoint startTouch;
    CGPoint endTouch;
    CGPoint lastTouch;
    
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
    
}

- (void)touchMoved:(CCTouch *)touch withEvent:(CCTouchEvent *)event
{
    CGPoint touchLocation = [touch locationInNode: _parent];
    if (CGRectContainsPoint([self boundingBox], touchLocation))
    {
        self.positionInPoints=touchLocation;
        //positionInPoints works, but .position does not
    }
    
}

-(void) touchEnded:(CCTouch *)touch withEvent:(CCTouchEvent *)event
{
    
}

@end
