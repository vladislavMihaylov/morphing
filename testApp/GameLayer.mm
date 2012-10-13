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
        
        CCMenuItemFont *runBtn = [CCMenuItemFont itemFromString: @"Run!" block:^(id sender)
        {
            currentSpeed += 0.5;
            [coco doAction: 0 withSpeed: currentSpeed];
            
            
            
            [ground increaseSpeedAnimation: [coco getCurrentGroundSpeed]];
        }];
        runBtn.position = ccp(50, 30);
        
        CCMenuItemFont *swimBtn = [CCMenuItemFont itemFromString: @"Swim!" block:^(id sender)
        {
            currentSpeed += 0.5;
            [coco doAction: 1 withSpeed: currentSpeed];
            [ground increaseSpeedAnimation: [coco getCurrentGroundSpeed]];
        }];
        swimBtn.position = ccp(130, 30);
        
        CCMenuItemFont *jumpBtn = [CCMenuItemFont itemFromString: @"Jump!" block:^(id sender)
        {
            if(ICanJump)
            {
                [coco doAction: 2 withSpeed: currentSpeed];
            }
        }];
        jumpBtn.position = ccp(210, 30);
        
        CCMenuItemFont *scramblBtn = [CCMenuItemFont itemFromString: @"Scrambl!" block:^(id sender)
            {
                currentSpeed += 0.5;
                [coco doAction: 3 withSpeed: currentSpeed];
                [ground increaseSpeedAnimation: [coco getCurrentGroundSpeed]];
            }];
        scramblBtn.position = ccp(310, 30);
        
        CCMenuItemFont *goDownBtn = [CCMenuItemFont itemFromString: @"Go down!" block:^(id sender)
                                      {
                                          currentSpeed += 0.5;
                                          [coco doAction: 4 withSpeed: currentSpeed];
                                          [ground increaseSpeedAnimation: [coco getCurrentGroundSpeed]];
                                      }];
        goDownBtn.position = ccp(400, 30);
        
        CCMenu *buttonsMenu = [CCMenu menuWithItems: runBtn, swimBtn, jumpBtn, scramblBtn, goDownBtn, nil];
        buttonsMenu.position = ccp(0,0);
        [self addChild: buttonsMenu];
        
        [self scheduleUpdate];
    }
    
    return self;
}

- (void) showLabelWithDistance: (NSInteger) intLeftDistance
{
    //[self removeChild: leftDistance cleanup: YES];
    leftDistance.string = [NSString stringWithFormat: @"left distance: %i", intLeftDistance];
}

- (void) update: (float) dt
{
    
    
    currentSpeed -= 1.5 * dt;
    
    distance += currentSpeed / 5;
    
    if(distance > 1000)
    {
        [self showLabelWithDistance: 2000 - distance];
    }
    if(distance > 2000)
    {
        leftDistance.string = @"";
        distance = 0;
        [ground showWater];
    }
    
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
