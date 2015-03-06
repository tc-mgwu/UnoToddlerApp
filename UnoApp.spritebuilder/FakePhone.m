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
#import "numberOne.h"

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
    
    NSArray *_phonenumber;
    UIButton *_back;
    CCLabelTTF *_numberText;
    
    CCNode *_Pos1;
    numberOne *_newOne;
}

-(void) onEnter
{

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


}

-(void) storePhoneNumber
{
    if ([_phonenumber count]> 9 )
    {
        //DISPLAY PRESS CALL!
    }
}
-(void) press1
{

    
    _newOne = (numberOne *)[CCBReader load:@"1num" owner: self];
    _newOne.positionType = CCPositionTypeNormalized;
    _newOne.position = _Pos1.position;
    [self addChild:_newOne];

}

-(void) press2
{
    
    
}

-(void) press3
{
    
    
}


-(void) press4
{
    
    
}

-(void) press5
{
    
    
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
