//
//  Coco.m
//  testApp
//
//  Created by Mac on 30.09.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "Coco.h"

#import "GameConfig.h"

@implementation Coco

- (void) dealloc
{
    [super dealloc];
}

- (id) init
{
    if(self = [super init])
    {
        //swimmingCoco = [SwimmingCoco create];
        //[self addChild: swimmingCoco z: 1 tag: 666];
        
        //runningCoco = [RunningCoco create];
        //[self addChild: runningCoco z: 1 tag: 666];
        
        //currentCoco = [CurrentCoco create];
        //[self addChild: currentCoco];
        
        
        
        CCMenuItemFont *swim = [CCMenuItemFont itemFromString: @"Swim" target: self selector: @selector(increaseSpeed:)];
        swim.tag = 0;
        swim.position = ccp(100, 50);
        
        CCMenuItemFont *run = [CCMenuItemFont itemFromString: @"Run" target: self selector: @selector(increaseSpeed:)];
        run.tag = 1;
        run.position = ccp(220, 50);
        
        CCMenu *actionsMenu = [CCMenu menuWithItems: swim, run, nil];
        actionsMenu.position = ccp(0,0);
        [self addChild: actionsMenu];
    }
    
    return self;
}

- (void) increaseSpeed: (CCMenuItemFont *) sender
{
    if(sender.tag == 0)
    {
        [self removeChildByTag: 11 cleanup: YES];
        
        if(![self getChildByTag: 10])
        {
            swimmingCoco = [SwimmingCoco create];
            [self addChild: swimmingCoco z: 1 tag: 10];
        }
        
        [swimmingCoco increaseSpeed];
    }
    else if(sender.tag == 1)
    {
        [self removeChildByTag: 10 cleanup: YES];
        
        if(![self getChildByTag: 11])
        {
            runningCoco = [RunningCoco create];
            [self addChild: runningCoco z: 1 tag: 11];
        }
        
        [runningCoco increaseSpeed];
        
    }
}

+ (Coco *) create
{
    Coco *coco = [[[Coco alloc] init] autorelease];
    
    return coco;
}

@end
