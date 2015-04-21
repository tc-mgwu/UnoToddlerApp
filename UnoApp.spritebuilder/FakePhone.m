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
    //yeah! content node! for things.
    CCNode *_contentNode;
    
    //ignore this stuff- just face and face color nodes
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
    
    //mutable array to store numbers entered
    NSMutableArray *_phoneNumEnter;
    
    //array to store positions (there are 9 positions that the numbers can show up at)
    NSArray *_numberPositions;
   
    //other array crap.
    int i;
    int count;
    
    //back to menu
    UIButton *_back;
    
    //at first, I was going to have a textual representation of the numbers, but have decided to use sprites to show the numbers so I have more control over the visuals.
    CCLabelTTF *_numberText;
    
    //nodes for positioning reference
    CCNode *_Pos1;
    CCNode *_Pos2;
    CCNode *_Pos3;
    CCNode *_Pos4;
    CCNode *_Pos5;
    CCNode *_Pos6;
    CCNode *_Pos7;
    CCNode *_Pos8;
    CCNode *_Pos9;

//    numberOne *_newOne; lols. another method I tried was to spawn the numbers using their own classes, but that was stupid.
    
//    CCSprite *_numberOne; ignore
}

-(void) onEnter
{

    [super onEnter];
    
    //initiate this array!
    _phoneNumEnter = [NSMutableArray array];
    
   //initialize number position array with ccnode positions
    _numberPositions = @[_Pos1, _Pos2, _Pos3, _Pos4, _Pos5, _Pos6, _Pos7, _Pos8, _Pos9];
    
   //more crap to ignore- this is just the face and face position
    _currentColor=(UnoColor *)[CCBReader load:@"UnoColor" owner:self];
    _currentColor.positionType = CCPositionTypeNormalized;
    
    //face color node
    _currentColor.position = ccp(0.5, .8);
    [self addChild:_currentColor];
    
    //load face
    _currentFace =(UnoFace *) [CCBReader load:@"UnoFace" owner: self];
    _currentFace.positionType = CCPositionTypeNormalized;
    
    //position face and load neutral face color
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
    //check to see if the number entered is greater than 9
    if ([_phoneNumEnter count]> 9 )
    {
        //DISPLAY PRESS CALL BUTTON! Haven't gotten this far yet.
    }
    
}

-(void) update:(CCTime)delta{


}
-(void) press1
{
    //if the button 1 is pressed, load the number 1 sprite and set position to normalized
    CCSprite *_numberOne = (CCSprite *) [CCBReader load:@"1num" owner:self];
    _numberOne.positionType = CCPositionTypeNormalized;
   
    //then count the positions in the position array
    count = [_numberPositions count];
    
    //position the sprite at the right ccnode within the positions array
    for (i=0; i < count; i++) {
        _numberOne.position = (((CCNode *)_numberPositions).position);
    }

     [self addChild:_numberOne];
}

-(void) press2
{
    //do the same as (void) press1
    CCSprite *_numberTwo = (CCSprite *) [CCBReader load:@"2num" owner:self];
    _numberTwo.positionType = CCPositionTypeNormalized;
    _numberTwo.position = _Pos2.position;
    [self addChild:_numberTwo];
    
}

-(void) press3
{
     //do the same as (void) press1
    CCSprite *_numberThree = (CCSprite *) [CCBReader load:@"3num" owner:self];
    _numberThree.positionType = CCPositionTypeNormalized;
    _numberThree.position = _Pos3.position;
    [self addChild:_numberThree];
    
    
}


-(void) press4
{
     //do the same as (void) press1
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
    //only have sprites up to 5 to see if I can get the array thing working
    
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
    //back button just goes back to main menu
    CCScene *main = [CCBReader loadAsScene:@"MainScene"];
    CCTransition *transition = [CCTransition transitionFadeWithDuration:0.8f];
    [[CCDirector sharedDirector] presentScene:main withTransition:transition];
    
}

@end
