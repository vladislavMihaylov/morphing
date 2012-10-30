//
//  MyCocos2DClass.m
//  morphing
//
//  Created by Vlad on 09.10.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "GameLayer.h"
#import "GameConfig.h"



@implementation GameLayer

@synthesize guiLayer;

+ (CCScene *) scene
{
    CCScene *scene = [CCScene node];
    
    GameLayer *layer = [GameLayer node];
    
    GUILayer *gui = [GUILayer node];
    
    [scene addChild: layer];

    [scene addChild: gui];
    
    layer.guiLayer = gui;
    gui.gameLayer = layer;
        
    return scene;
}

- (void) dealloc
{
    [super dealloc];
}

- (id) init
{
    if (self = [super init])
    {
        IsGameActive = YES;
        
        ground = [Ground create];
        [self addChild: ground];
        
        if(typeCharacter == 0)
        {
            coco = [Coco createWithSpeed: currentSpeed];
            [self addChild: coco];
            
            coco.scale = 0.3;
            coco.position =ccp(100, 105);
            
            [coco doAction: 0 withSpeed: 0];
        }
        else if(typeCharacter == 1)
        {
            francois = [Francois createWithSpeed: currentSpeed];
            [self addChild: francois];
            
            francois.scale = 0.3;
            francois.position =ccp(100, 105);
            
            [francois doAction: 0 withSpeed: 0];
        }
        
        leftDistance = [CCLabelTTF labelWithString: @"" fontName: @"Arial" fontSize: 14];
        leftDistance.position = ccp(240, 160);
        //[leftDistance retain];
        [self addChild: leftDistance];

        
        currentSpeed = 0;
        
        // Buttons 
        
       
        
        [self scheduleUpdate];
    }
    
    return self;
}

- (void) restartGame
{
    //[self removeChild: ground cleanup: YES];
    [ground restart];
    
    if(typeCharacter == 0)
    {
        //[coco doAction: 0 withSpeed: 0];
        [self removeChild: coco cleanup: YES];
        currentSpeed = 0;
        curAction = 1000;
        
        coco = [Coco createWithSpeed: currentSpeed];
        [self addChild: coco];
        
        coco.scale = 0.3;
        coco.position =ccp(100, 105);
        
        [coco doAction: 0 withSpeed: 0];

    }
    if(typeCharacter == 1)
    {
        [francois doAction: 0 withSpeed: 0];
    }
    
}

- (void) doAction: (NSInteger) numberOfAction
{
    //CCLOG(@"Current Action: %i", curAction);
    
    if (curAction != 1002)
    {
        if ((curAction - 1000) != numberOfAction)
        {
            CCLOG(@"PZDC!!!");
        }
        else
        {
            currentSpeed += 0.5;
            
            if(typeCharacter == 0)
            {
                [coco doAction: numberOfAction withSpeed: currentSpeed];
                [ground increaseSpeedAnimation: [coco getCurrentGroundSpeed]];

            }
            else if(typeCharacter == 1)
            {
                [francois doAction: numberOfAction withSpeed: currentSpeed];
                [ground increaseSpeedAnimation: [francois getCurrentGroundSpeed]];

            }
        }
    }
    else if(curAction == 1002)
    {
        if ((curAction - 1000) != numberOfAction)
        {
            CCLOG(@"PZDC!!!");
        }
        else
        {
            if(ICanJump)
            {
                //currentSpeed = 5.5;
                
                if(typeCharacter == 0)
                {
                    
                    [coco doAction: 0 withSpeed: currentSpeed];
                    [coco doAction: numberOfAction withSpeed: currentSpeed];
                    [ground increaseSpeedAnimation: [coco getCurrentGroundSpeed]];
                }
                else if(typeCharacter == 1)
                {
                    [francois doAction: 0 withSpeed: currentSpeed];
                    [francois doAction: numberOfAction withSpeed: currentSpeed];
                    [ground increaseSpeedAnimation: [francois getCurrentGroundSpeed]];

                }
            }
        }
    }
}


- (void) update: (float) dt
{
    curAction = [ground getCurrentActionNumber];
    
    //[guiLayer updateDistanceLabel: 500 - [ground getCurrentDistance]];
    
    currentSpeed -= 1.5 * dt;
    
    
    
    if(currentSpeed <= 0)
    {
        currentSpeed = 0;
    }
    if(currentSpeed > 9)
    {
        currentSpeed = 9;
    }
}

@end
