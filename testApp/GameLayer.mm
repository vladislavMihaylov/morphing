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
        ground = [Ground create];
        [self addChild: ground];
        
        coco = [Coco createWithSpeed: currentSpeed];
        [self addChild: coco];
        
        coco.scale = 0.3;
        coco.position =ccp(100, 105);
        
        [coco doAction: 0 withSpeed: 0];
        
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

- (void) doAction: (NSInteger) numberOfAction
{
    if(numberOfAction == 2)
    {
        if(ICanJump)
        {
            [coco doAction: numberOfAction withSpeed: currentSpeed];
        }
    }
    else
    {
        currentSpeed += 0.5;
        [coco doAction: numberOfAction withSpeed: currentSpeed];
        [ground increaseSpeedAnimation: [coco getCurrentGroundSpeed]];
    }
}


- (void) update: (float) dt
{
    [guiLayer updateDistanceLabel: 3000 - [ground getCurrentDistance]];
    
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
