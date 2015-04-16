//
//  FakePhone.m
//  UnoApp
//
//  Created by Toni Chen on 9/30/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "FakePhone.h"
#import "UnoColor.h"
#import "UnoFace.h"
#import "CCBReader.h"
#import "CCAnimationManager.h"
//#import "numberOne.h"

@implementation FakePhone
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
    
    NSMutableArray *_phoneNumEnter;
    NSArray *_numberPositions;
   
    int i;
    int count;
    
    UIButton *_back;
    CCLabelTTF *_numberText;
    
    CCNode *_Pos1;
    CCNode *_Pos2;
    CCNode *_Pos3;
    CCNode *_Pos4;
    CCNode *_Pos5;
    CCNode *_Pos6;
    CCNode *_Pos7;
    CCNode *_Pos8;
    CCNode *_Pos9;

//    numberOne *_newOne;
    
//    CCSprite *_numberOne;
}

-(void) onEnter
{

    [super onEnter];
    
    _phoneNumEnter = [NSMutableArray array];
    
   //initialize number position arrary with objects
    _numberPositions = @[_Pos1, _Pos2, _Pos3, _Pos4, _Pos5, _Pos6, _Pos7, _Pos8, _Pos9];
    
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


}

-(void) storePhoneNumber
{
    if ([_phoneNumEnter count]> 9 )
    {
        //DISPLAY PRESS CALL!
    }
    
}

-(void) update:(CCTime)delta{


//    count = [_numberPositions count];
//    
//    for (i=0; i < count; i++) {
//        NSLog(@"Position %i = %@", i, [_numberPositions objectAtIndex:i]);
//        //set button to position 1
//    }

}
-(void) press1
{

    
//    _newOne = (numberOne *)[CCBReader load:@"1num" owner: self];
//    _newOne.positionType = CCPositionTypeNormalized;
//    _newOne.position = _Pos1.position;
//    [self addChild:_newOne];
    
    CCSprite *_numberOne = (CCSprite *) [CCBReader load:@"1num" owner:self];
    _numberOne.positionType = CCPositionTypeNormalized;
//    _numberOne.position = _Pos1.position;
   
    
    count = [_numberPositions count];
    
    for (i=0; i < count; i++) {
        _numberOne.position = (((CCNode *)_numberPositions).position);
    }

     [self addChild:_numberOne];
}

-(void) press2
{
    CCSprite *_numberTwo = (CCSprite *) [CCBReader load:@"2num" owner:self];
    _numberTwo.positionType = CCPositionTypeNormalized;
    _numberTwo.position = _Pos2.position;
    [self addChild:_numberTwo];
    
}

-(void) press3
{
    CCSprite *_numberThree = (CCSprite *) [CCBReader load:@"3num" owner:self];
    _numberThree.positionType = CCPositionTypeNormalized;
    _numberThree.position = _Pos3.position;
    [self addChild:_numberThree];
    
    
}


-(void) press4
{
    CCSprite *_numberFour = (CCSprite *) [CCBReader load:@"4num" owner:self];
    _numberFour.positionType = CCPositionTypeNormalized;
    _numberFour.position = _Pos4.position;
    [self addChild:_numberFour];
    
}

-(void) press5
{
    
    CCSprite *_numberFive = (CCSprite *) [CCBReader load:@"5num" owner:self];
    _numberFive.positionType = CCPositionTypeNormalized;
    _numberFive.position = _Pos5.position;
    [self addChild:_numberFive];
}

-(void) press6
{
    
    
}

-(void) press7
{
    
    
}


-(void) press8
{
    
    
}

-(void) press9
{
    
    
}

-(void) back
{
    
    CCScene *main = [CCBReader loadAsScene:@"MainScene"];
    CCTransition *transition = [CCTransition transitionFadeWithDuration:0.8f];
    [[CCDirector sharedDirector] presentScene:main withTransition:transition];
    
}

@end
