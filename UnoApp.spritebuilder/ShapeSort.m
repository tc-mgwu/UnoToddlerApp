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
#import "Circle.h"
#import "CircleHole.h"
#import "Square.h"
#import "SquareHole.h"
#import "Star.h"
#import "StarHole.h"
#import "Shapes.h"
#import "CCBReader.h"

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
    
   
//    NSArray *_allShapes;
    //array to hold all shapes
    
    NSArray *_allShapeHoles;
    //array to hold all shapes
    
    NSArray *_allShapePositions;
    //arrary to hold shape positions
    
    NSMutableArray *_allShapes;
    
    
    Triangle *_currentTriangle;
    Square *_currentSquare;
    Circle *_currentCircle;
    Star *_currentStar;
    
    TriangleHole *_triHole;
    SquareHole *_squareHole;
    CircleHole *_circleHole;
    StarHole *_starHole;
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
    
    //spawn shape holes here
  

    
    
    
    [self startGame];
}

-(void) didLoadFromCCB
{
    //enable user interaction
    self.userInteractionEnabled = TRUE;

    _allShapes = [NSMutableArray array];
    _allShapeHoles= @[_squareHole,_triHole,_circleHole,_starHole];
    
}

-(void) startGame
{
//pick random shape holes and shapes
    
    [self spawnTriangle];
    [self spawnSquare];
    
}

-(void) spawnTriangleHole
{

    TriangleHole *triHole=(TriangleHole*) [CCBReader load:@"TriangleHole"];
    triHole.positionType = CCPositionTypeNormalized;
    triHole.position= ccp(.8, .5);
    triHole.opacity= .5;
    triHole.scale= 1.1;
    [_contentNode addChild: triHole];
    _triHole=triHole;

}

-(void) spawnCircleHole
{
    CircleHole *circleHole=(CircleHole*) [CCBReader load:@"CircleHole"];
    circleHole.positionType = CCPositionTypeNormalized;
    circleHole.position= ccp(.4, .5);
    circleHole.scale= 1.1;
    circleHole.opacity= .5;
    [_contentNode addChild: circleHole];
    _circleHole=circleHole;
    
}

-(void) spawnStarHole
{
    StarHole *starHole=(StarHole*) [CCBReader load:@"StarHole"];
    starHole.positionType = CCPositionTypeNormalized;
    starHole.position= ccp(.6, .5);
    starHole.scale= 1.1;
    starHole.opacity= .5;
    [_contentNode addChild: starHole];
    _starHole=starHole;

}

-(void) spawnSquareHole
{
    SquareHole *squareHole=(SquareHole*) [CCBReader load:@"SquareHole"];
    squareHole.positionType = CCPositionTypeNormalized;
    squareHole.position= ccp(.2, .5);
    squareHole.scale= 1.1;
    squareHole.opacity= .5;
    [_contentNode addChild: squareHole];
    _squareHole=squareHole;
}





-(void) update:(CCTime)delta
{
    //if bool for a triangle is true
    //and if bounding box for current shape (which is a triangle) intersects with triangle hole bounding box
    //win condition- "correct" displays
//    for (Shapes *_currentShape in _allShapes)
//    {
    
        if (_aTriangle)
        {
            if (CGRectContainsRect(_currentTriangle.boundingBox, _triHole.boundingBox))
            {
                CCLOG(@"Correct");
                _currentTriangle.visible=NO;
                
//                CCParticleSystem *particle1 = (CCParticleSystem *)[CCBReader load:@"Particle1"];
//                particle1.autoRemoveOnFinish = TRUE;
//                particle1.positionInPoints = _currentTriangle.positionInPoints;
//                [_currentTriangle.parent addChild:particle1];
            
            }
        }
    
    if (_aSquare)
    {
        
        if (CGRectContainsRect(_squareHole.boundingBox, _currentSquare.boundingBox))
        {
            CCLOG(@"Correct");
            _currentSquare.visible=NO;
            
        }
    }
    
//    }

}

//shape spawners
-(void) spawnTriangle
{
    Triangle *newtriangle=(Triangle*) [CCBReader load:@"Triangle"];
    newtriangle.positionType = CCPositionTypeNormalized;
    newtriangle.position= ccp(.5, .3);

    [_contentNode addChild: newtriangle];
    _currentTriangle = newtriangle;

    [_allShapes addObject: _currentTriangle];
    _aTriangle=TRUE;
   

}

-(void) spawnSquare
{
    Square *newSquare=(Square*) [CCBReader load:@"Square"];
    newSquare.positionType = CCPositionTypeNormalized;
    newSquare.position= ccp(.7, .3);
    
    [_contentNode addChild: newSquare];
    _currentSquare = newSquare;
    
    [_allShapes addObject: _currentSquare];
    _aSquare=TRUE;
    
    
}

-(void) spawnCircle
{
    Circle *newCircle=(Circle*) [CCBReader load:@"Circle"];
    newCircle.positionType = CCPositionTypeNormalized;
    newCircle.position= ccp(.7, .3);
    
    [_contentNode addChild: newCircle];
    _currentCircle = newCircle;
    
    [_allShapes addObject: _currentCircle];
    _aCircle=TRUE;
    
    
}

-(void) randomShapeSpawner
{
    int randomChance= arc4random_uniform(100);
    //    CCLOG(@"%i",randomChance);
    if (randomChance<=90)
    {
    }
    
}




//touch methods- moved into shapes class
//- (void)touchBegan:(CCTouch *)touch withEvent:(CCTouchEvent *)event
//{
//
//}
//
//- (void)touchMoved:(CCTouch *)touch withEvent:(CCTouchEvent *)event
//{
//    CGPoint touchLocation = [touch locationInNode:_contentNode];
//    if (CGRectContainsPoint([_currentShape boundingBox], touchLocation))
//    {
//        _currentShape.positionInPoints=touchLocation;
//        //positionInPoints works, but .position does not
//    }
//
//}
//
//-(void) touchEnded:(CCTouch *)touch withEvent:(CCTouchEvent *)event
//{
//
//}

@end
