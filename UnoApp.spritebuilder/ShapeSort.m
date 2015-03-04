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
    
    CCNode *_spawnNode1;
    CCNode *_spawnNode2;
    CCNode *_spawnNode3;
    CCNode *_spawnNode4;
    CCNode *_spawnNode5;
    CCNode *_spawnNode6;
    
    UIButton *_back;

//    NSArray *_allShapes;
    //array to hold all shapes
    
    NSArray *_allShapeHoles;
    //array to hold all shapes
    
     NSArray *_allSpawnNodes;
    
    NSArray *_allShapePositions;
    //arrary to hold shape positions
    
    NSMutableArray *_allShapes;
    
    Shapes *_currentShape1;
    Shapes *_currentShape2;
    
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
    
    _currentColor.position = ccp(0.5, .8);
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
//    _allShapeHoles= @[_squareHole,_triHole,_circleHole,_starHole];
    
    
}

-(void) startGame
{
    [self randomShapePicker];
}

-(void) spawnTriangleHole
{

    TriangleHole *triHole=(TriangleHole*) [CCBReader load:@"TriangleHole"];
    triHole.positionType = CCPositionTypeNormalized;
    if (self.combo1 || self.combo9) {
        triHole.position = _spawnNode1.position;
    }
    
    if (self.combo2 || self.combo7) {
        triHole.position = _spawnNode2.position;
    }
    
    if (self.combo3 || self.combo8) {
        triHole.position = _spawnNode3.position;
    }
    triHole.opacity= .5;
    triHole.scale= 1.1;
    [_contentNode addChild: triHole];
    _triHole=triHole;

}

-(void) spawnCircleHole
{
    CircleHole *circleHole=(CircleHole*) [CCBReader load:@"CircleHole"];
    circleHole.positionType = CCPositionTypeNormalized;
    
    if (self.combo1 || self.combo4 || self.combo7) {
        circleHole.position = _spawnNode3.position;
    }
    
    if (self.combo2 || self.combo5 || self.combo8) {
        circleHole.position = _spawnNode1.position;
    }
    
    if (self.combo3 || self.combo6 || self.combo9) {
        circleHole.position = _spawnNode2.position;
    }

    circleHole.scale= 1.1;
    circleHole.opacity= .5;
    [_contentNode addChild: circleHole];
    _circleHole=circleHole;
    
}

-(void) spawnStarHole
{
    StarHole *starHole=(StarHole*) [CCBReader load:@"StarHole"];
    starHole.positionType = CCPositionTypeNormalized;
    
    if (self.combo4 || self.combo7) {
        starHole.position = _spawnNode1.position;
    }
    
    if (self.combo5 || self.combo8) {
        starHole.position = _spawnNode2.position;
    }
    
    if (self.combo6 || self.combo9) {
        starHole.position = _spawnNode3.position;
    }
    
    starHole.scale= 1.1;
    starHole.opacity= .5;
    [_contentNode addChild: starHole];
    _starHole=starHole;

}

-(void) spawnSquareHole
{
    SquareHole *squareHole=(SquareHole*) [CCBReader load:@"SquareHole"];
    squareHole.positionType = CCPositionTypeNormalized;
  
    if (self.combo1 || self.combo4) {
        squareHole.position = _spawnNode2.position;
    }
    
    if (self.combo2 || self.combo4) {
        squareHole.position = _spawnNode3.position;
    }
    if (self.combo3 || self.combo6) {
        squareHole.position = _spawnNode1.position;
    }

    squareHole.scale= 1.1;
    squareHole.opacity= .5;
    [_contentNode addChild: squareHole];
    _squareHole=squareHole;
}


-(void) randomShapePicker
{
    int randomChance = arc4random_uniform(10) + 1;
    
    if (randomChance <= 1) {
        self.combo1=YES;
        self.combo2=NO;
        self.combo3=NO;
        self.combo4=NO;
        self.combo5=NO;
        self.combo6=NO;
        self.combo7=NO;
        self.combo8=NO;
        self.combo9=NO;
        
        [self spawnSquareHole];
        [self spawnTriangleHole];
        [self spawnCircleHole];
        [self spawnTriangle];
        [self spawnSquare];
        [self spawnCircle];
  

    }
    
    if (randomChance == 2) {
        self.combo1=NO;
        self.combo2=YES;
        self.combo3=NO;
        self.combo4=NO;
        self.combo5=NO;
        self.combo6=NO;
        self.combo7=NO;
        self.combo8=NO;
        self.combo9=NO;
        [self spawnSquareHole];
        [self spawnTriangleHole];
        [self spawnCircleHole];
        [self spawnTriangle];
        [self spawnSquare];
        [self spawnCircle];
     
    
    }
    
    
    if (randomChance == 3) {
        self.combo1=NO;
        self.combo2=NO;
        self.combo3=YES;
        self.combo4=NO;
        self.combo5=NO;
        self.combo6=NO;
        self.combo7=NO;
        self.combo8=NO;
        self.combo9=NO;
        [self spawnSquareHole];
        [self spawnTriangleHole];
        [self spawnCircleHole];
        [self spawnTriangle];
        [self spawnSquare];
        [self spawnCircle];

    }
    
    if (randomChance == 4) {
        self.combo1=NO;
        self.combo2=NO;
        self.combo3=NO;
        self.combo4=YES;
        self.combo5=NO;
        self.combo6=NO;
        self.combo7=NO;
        self.combo8=NO;
        self.combo9=NO;
        [self spawnSquareHole];
        [self spawnStarHole];
        [self spawnCircleHole];
        [self spawnStar];
        [self spawnSquare];
        [self spawnCircle];
    }
    if (randomChance == 5) {
        self.combo1=NO;
        self.combo2=NO;
        self.combo3=NO;
        self.combo4=NO;
        self.combo5=YES;
        self.combo6=NO;
        self.combo7=NO;
        self.combo8=NO;
        self.combo9=NO;
        [self spawnSquareHole];
        [self spawnStarHole];
        [self spawnCircleHole];
        [self spawnStar];
        [self spawnSquare];
        [self spawnCircle];
    }
    
    if (randomChance == 6) {
        self.combo1=NO;
        self.combo2=NO;
        self.combo3=NO;
        self.combo4=NO;
        self.combo5=NO;
        self.combo6=YES;
        self.combo7=NO;
        self.combo8=NO;
        self.combo9=NO;
        [self spawnSquareHole];
        [self spawnStarHole];
        [self spawnCircleHole];
        [self spawnStar];
        [self spawnSquare];
        [self spawnCircle];
    }
    if (randomChance == 7) {
        self.combo1=NO;
        self.combo2=NO;
        self.combo3=NO;
        self.combo4=NO;
        self.combo5=NO;
        self.combo6=NO;
        self.combo7=YES;
        self.combo8=NO;
        self.combo9=NO;
        [self spawnTriangleHole];
        [self spawnStarHole];
        [self spawnCircleHole];
        [self spawnStar];
        [self spawnTriangle];
        [self spawnCircle];
    }
    
    if (randomChance == 8) {
        self.combo1=NO;
        self.combo2=NO;
        self.combo3=NO;
        self.combo4=NO;
        self.combo5=NO;
        self.combo6=NO;
        self.combo7=NO;
        self.combo8=YES;
        self.combo9=NO;
        [self spawnTriangleHole];
        [self spawnStarHole];
        [self spawnCircleHole];
        [self spawnStar];
        [self spawnTriangle];
        [self spawnCircle];
    }
    if (randomChance >= 9) {
        self.combo1=NO;
        self.combo2=NO;
        self.combo3=NO;
        self.combo4=NO;
        self.combo5=NO;
        self.combo6=NO;
        self.combo7=NO;
        self.combo8=NO;
        self.combo9=YES;
        [self spawnTriangleHole];
        [self spawnStarHole];
        [self spawnCircleHole];
        [self spawnStar];
        [self spawnTriangle];
        [self spawnCircle];
    }
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
    
    if (_aTriangle)
    {
        
        if (CGRectContainsRect(_triHole.boundingBox, _currentTriangle.boundingBox))
        {
            CCLOG(@"Correct");
            _currentTriangle.visible=NO;
            
        }
    }
    
    if (_aStar)
    {
        
        if (CGRectContainsRect(_starHole.boundingBox, _currentStar.boundingBox))
        {
            CCLOG(@"Correct");
            _currentStar.visible=NO;
            
        }
    }
//    }

}

//shape spawners
-(void) spawnTriangle
{
    Triangle *newtriangle=(Triangle*) [CCBReader load:@"Triangle"];
    newtriangle.positionType = CCPositionTypeNormalized;
    newtriangle.position= _spawnNode1.position;

  
 
    newtriangle.position = _spawnNode5.position;

    
    [_contentNode addChild: newtriangle];
    _currentTriangle = newtriangle;

    [_allShapes addObject: _currentTriangle];
    _aTriangle=TRUE;
}

-(void) spawnSquare
{
    Square *newSquare=(Square*) [CCBReader load:@"Square"];
    newSquare.positionType = CCPositionTypeNormalized;

   
    newSquare.position = _spawnNode4.position;
    

    [_contentNode addChild: newSquare];
    _currentSquare = newSquare;
    
    [_allShapes addObject: _currentSquare];
    _aSquare=TRUE;
    
    
}

-(void) spawnCircle
{
    Circle *newCircle=(Circle*) [CCBReader load:@"Circle"];
    newCircle.positionType = CCPositionTypeNormalized;
    

    newCircle.position = _spawnNode6.position;
     
    [_contentNode addChild: newCircle];
    _currentCircle = newCircle;
    
    [_allShapes addObject: _currentCircle];
    _aCircle=TRUE;
    
    
}

-(void) spawnStar
{
    Star *newStar=(Star*) [CCBReader load:@"Star"];
    newStar.positionType = CCPositionTypeNormalized;
    
    if (self.combo4 || self.combo5 || self.combo6 || self.combo7 || self.combo8) {
        newStar.position = _spawnNode5.position;
        }
 
    if (self.combo9) {
        newStar.position = _spawnNode4.position;
        }
    
    [_contentNode addChild: newStar];
    _currentStar = newStar;
    
    [_allShapes addObject: _currentStar];
    _aStar=TRUE;
    
    
}



-(void) back
{
    
    CCScene *main = [CCBReader loadAsScene:@"MainScene"];
    CCTransition *transition = [CCTransition transitionFadeWithDuration:0.8f];
    [[CCDirector sharedDirector] presentScene:main withTransition:transition];
    
}

@end
