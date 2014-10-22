//
//  ShapeSort.m
//  UnoApp
//
//  Created by Toni Chen on 10/21/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "ShapeSort.h"
#import "UnoColor.h"
#import "UnoFace.h"
#import "Triangle.h"
#import "TriangleHole.h"

@implementation ShapeSort
{
    CCNode *_contentNode;
    
    UnoFace *_currentFace;
    UnoColor *_currentColor;
    UnoColor *_color0;
    UnoColor *_color1;
    UnoColor *_color2;
    UnoColor *_color3;
    UnoColor *_color4;
    UnoColor *_color5;
    UnoColor *_color6;
    UnoColor *_color7;
    UnoColor *_color8;
    UnoColor *_color9;
    
   
    NSArray *_allShapes;
    //array to hold all shapes
    
    NSArray *_allShapeHoles;
    //array to hold all shapes
    
    NSArray *_allShapePositions;
    //arrary to hold shape positions
}

-(void) onEnter
{
    //clean this up later.
    [super onEnter];
    
    _currentColor=(UnoColor *)[CCBReader load:@"UnoColor" owner:self];
    _currentColor.positionType = CCPositionTypeNormalized;
    
    _currentColor.position = ccp(0.5, .81);
    [self addChild:_currentColor];
    
    _currentFace =(UnoFace *) [CCBReader load:@"UnoFace" owner: self];
    _currentFace.positionType = CCPositionTypeNormalized;
    
    _currentFace.position = _currentColor.position;
    [self addChild:_currentFace];
    _color0.visible=YES;
    _color1.visible=NO;
    _color2.visible=NO;
    _color3.visible=NO;
    _color4.visible=NO;
    _color5.visible=NO;
    _color6.visible=NO;
    _color7.visible=NO;
    _color8.visible=NO;
    _color9.visible=NO;
    
    [self startGame];
}

-(void) didLoadFromCCB
{
    //enable user interaction
    self.userInteractionEnabled = TRUE;

}

-(void) startGame
{

    [self spawnTriangle];
    

}



-(void) spawnTriangle
{
    Triangle *newtraingle=(Triangle*) [CCBReader load:@"Triangle"];
    
    newtraingle.positionType = CCPositionTypeNormalized;
    newtraingle.position=ccp (.5,.5);
    [self addChild: newtraingle];

}
@end
