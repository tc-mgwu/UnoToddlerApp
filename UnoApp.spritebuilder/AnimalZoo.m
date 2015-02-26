//
//  AnimalZoo.m
//  UnoApp
//
//  Created by Toni Chen on 2/12/15.
//  Copyright (c) 2015 Apportable. All rights reserved.
//

#import "AnimalZoo.h"
#import "UnoColor.h"
#import "UnoColor.h"
#import "UnoFace.h"
#import "CCBReader.h"

#import "CCAnimationManager.h"

@implementation AnimalZoo
{
    CCNode *_contentNode;
    
    CCSprite *_elephant;
    CCSprite *_lion;
    
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
    
    OALSimpleAudio *AudioPlayer;
    id<ALSoundSource> _Gamecaf;
    
    NSArray *_allColors;
    
 
    
}

-(void) onEnter
{
    [super onEnter];
    
    _currentColor=(UnoColor *)[CCBReader load:@"UnoColor" owner:self];
    _currentColor.positionType = CCPositionTypeNormalized;
    
    _currentColor.position = ccp(0.5, .81);
    [self addChild:_currentColor];
    
    _currentFace =(UnoFace *) [CCBReader load:@"UnoFace" owner: self];
    _currentFace.positionType = CCPositionTypeNormalized;
    
    _currentFace.position = _currentColor.position;
    [self addChild:_currentFace];
    
    //initialize color states here
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
    _allColors= @[_color1,_color2,_color3,_color4,_color5,_color6,_color7,_color8,_color9];
 

}


@end
