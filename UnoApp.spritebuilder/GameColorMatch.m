
//
//  GameColorMatch.m
//  UnoApp
//
//  Created by Toni Chen on 8/23/14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "GameColorMatch.h"
#import "UnoColor.h"
#import "UnoFace.h"

//this is the current version.

@implementation GameColorMatch
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
    
    OALSimpleAudio *AudioPlayer;
    id<ALSoundSource> _Gamecaf;

    NSArray *_allColors;
    
    CCButton *_readyButton;
    
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
   
    AudioPlayer = [OALSimpleAudio sharedInstance];
    [AudioPlayer preloadEffect:@"Published-iOS/Audio/thatsright.caf"];



}

-(void) didLoadFromCCB
{
    //all colors, excluding white color
   
}

-(void) startGame
{

    [self changeColor];

}

-(void) ready
{
    _readyButton.visible=NO;
    _readyButton.enabled=NO;
    [self startGame];

}

-(void) changeColor
{
    int randomChance= arc4random() % 9;
    _currentColor= _allColors[randomChance];
    
    
    if (_currentColor==_color1) //teal
    {
        _color0.visible=NO;
        _color1.visible=YES;
        _color2.visible=NO;
        _color3.visible=NO;
        _color4.visible=NO;
        _color5.visible=NO;
        _color6.visible=NO;
        _color7.visible=NO;
        _color8.visible=NO;
        _color9.visible=NO;

    }
    if (_currentColor==_color2) //orange
    {
        _color0.visible=NO;
        _color1.visible=NO;
        _color2.visible=YES;
        _color3.visible=NO;
        _color4.visible=NO;
        _color5.visible=NO;
        _color6.visible=NO;
        _color7.visible=NO;
        _color8.visible=NO;
        _color9.visible=NO;
 
    }
    if (_currentColor==_color3) //yellow
    {
        _color0.visible=NO;
        _color1.visible=NO;
        _color2.visible=NO;
        _color3.visible=YES;
        _color4.visible=NO;
        _color5.visible=NO;
        _color6.visible=NO;
        _color7.visible=NO;
        _color8.visible=NO;
        _color9.visible=NO;
 
    }
    if (_currentColor==_color4) //green
    {
        _color0.visible=NO;
        _color1.visible=NO;
        _color2.visible=NO;
        _color3.visible=NO;
        _color4.visible=YES;
        _color5.visible=NO;
        _color6.visible=NO;
        _color7.visible=NO;
        _color8.visible=NO;
        _color9.visible=NO;
    }
    
    if (_currentColor==_color5) //magenta
    {
        _color0.visible=NO;
        _color1.visible=NO;
        _color2.visible=NO;
        _color3.visible=NO;
        _color4.visible=NO;
        _color5.visible=YES;
        _color6.visible=NO;
        _color7.visible=NO;
        _color8.visible=NO;
        _color9.visible=NO;
    }

    if (_currentColor==_color6) //purple
    {
        _color0.visible=NO;
        _color1.visible=NO;
        _color2.visible=NO;
        _color3.visible=NO;
        _color4.visible=NO;
        _color5.visible=NO;
        _color6.visible=YES;
        _color7.visible=NO;
        _color8.visible=NO;
        _color9.visible=NO;
    }
    if (_currentColor==_color7) //blue
    {
        _color0.visible=NO;
        _color1.visible=NO;
        _color2.visible=NO;
        _color3.visible=NO;
        _color4.visible=NO;
        _color5.visible=NO;
        _color6.visible=NO;
        _color7.visible=YES;
        _color8.visible=NO;
        _color9.visible=NO;
    }

    if (_currentColor==_color8) //pink
    {
        _color0.visible=NO;
        _color1.visible=NO;
        _color2.visible=NO;
        _color3.visible=NO;
        _color4.visible=NO;
        _color5.visible=NO;
        _color6.visible=NO;
        _color7.visible=NO;
        _color8.visible=YES;
        _color9.visible=NO;
    }
    if (_currentColor==_color9) //red
    {
        _color0.visible=NO;
        _color1.visible=NO;
        _color2.visible=NO;
        _color3.visible=NO;
        _color4.visible=NO;
        _color5.visible=NO;
        _color6.visible=NO;
        _color7.visible=NO;
        _color8.visible=NO;
        _color9.visible=YES;
    }
}



-(void) press1 //teal
{
    if (_currentColor==_color1)
    {
        CCLOG(@"Teal~Correct!");
        [self changeColor];
        
        [AudioPlayer playEffect:@"Published-iOS/Audio/thatsright.caf"];

      
    }
    else
    {
        CCLOG(@"Try again!");
    }
   
    
}

-(void) press2 //orange
{
    
    if (_currentColor==_color2)
    {
        CCLOG(@"Orange~Correct!");
        [self changeColor];
        
    }
    else
    {
        CCLOG(@"Try again!");
    }

    
}

-(void) press3 //yellow
{
    
    if (_currentColor==_color3)
    {
        CCLOG(@"Yellow~Correct!");
        [self changeColor];
       

    }
    else
    {
        CCLOG(@"Try again!");
    }

}

-(void) press4 //green
{
    
    if (_currentColor==_color4)
    {
        CCLOG(@"Green~Correct!");
        [self changeColor];

    }
    else
    {
        CCLOG(@"Try again!");
    }

}

-(void) press5 //magenta
{


    if (_currentColor==_color5)
    {
        CCLOG(@"Magenta~Correct!");
        [self changeColor];
        
    }
    else
    {
        CCLOG(@"Try again!");
    }

}

-(void) press6 //purple
{
    if (_currentColor==_color6)
    {
        CCLOG(@"Purple, correct!");
        [self changeColor];
    }
    else
    {
        CCLOG(@"Try Again");
    }
}


-(void) press7 //blue
{
    if (_currentColor==_color7)
    {
        CCLOG(@"blue, correct!");
        [self changeColor];
    }
    else
    {
        CCLOG(@"Try Again");
    }
}


-(void) press8 //pink
{
    if (_currentColor==_color8)
    {
        CCLOG(@"pink, correct!");
        [self changeColor];
    }
    else
    {
        CCLOG(@"Try Again");
    }
}

-(void) press9 //red
{
    if (_currentColor==_color9)
    {
        CCLOG(@"red, correct!");
        [self changeColor];
    }
    else
    {
        CCLOG(@"Try Again");
    }
}
@end
