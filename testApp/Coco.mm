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

@synthesize body;
@synthesize head;
@synthesize rightFoot;
@synthesize leftFoot;
@synthesize rightHand;
@synthesize leftHand;

- (void) dealloc
{
    [super dealloc];
}

- (id) initWithSpeed: (float) speed
{
    if(self = [super init])
    {
        currentCoco = [CurrentCoco createWithSpeed: 0];

        swimmingCoco = [SwimmingCoco createWithSpeed: 0];
        runningCoco = [RunningCoco createWithSpeed: 0];
        scramblingCoco = [ScramblingCoco createWithSpeed: 0];
        goingDownCoco = [GoingDownCoco createWithSpeed: 0];
        
        [swimmingCoco retain];
        swimmingCoco.tag = kSwimmingAction;
        
        [runningCoco retain];
        runningCoco.tag = kRunningAction;
        
        [scramblingCoco retain];
        scramblingCoco.tag = kScramblingAction;
        
        [goingDownCoco retain];
        goingDownCoco.tag = kGoingDownAction;
        goingDownCoco.scaleX = -1;
        
        currentGroundSpeed = 0;
        
        //[self addChild: currentCoco];
        //[self addChild: swimmingCoco];
        //[self addChild: runningCoco];
        
        //runningCoco.scale = 0;
        //swimmingCoco.scale = 0;
        
    }
    
    return self;
}

- (void) doAction: (NSInteger) numberOfAction withSpeed: (float) speed
{
    if(numberOfAction == 0)
    {
        
        /*currentCoco.body.frames = runningCoco.body.frames;
        currentCoco.head.frames = runningCoco.head.frames;
        currentCoco.leftHand.frames = runningCoco.leftHand.frames;
        currentCoco.rightHand.frames = runningCoco.rightHand.frames;
        currentCoco.rightFoot.frames = runningCoco.rightFoot.frames;
        currentCoco.leftFoot.frames = runningCoco.leftFoot.frames;*/
        
        if(currentAction != kRunningAction)
        {
            [self removeChildByTag: currentAction cleanup: NO];
            [self addChild: runningCoco];
            currentAction = kRunningAction;
        }
        
        [runningCoco increaseSpeed];
        currentGroundSpeed = [runningCoco getCurrentCocoSpeed];
        
        //[currentCoco increaseSpeed];
    }
    else if(numberOfAction == 1)
    {
        
        /*currentCoco.body.frames = swimmingCoco.body.frames;
        currentCoco.head.frames = swimmingCoco.head.frames;
        currentCoco.leftHand.frames = swimmingCoco.leftHand.frames;
        currentCoco.rightHand.frames = swimmingCoco.rightHand.frames;
        currentCoco.rightFoot.frames = swimmingCoco.rightFoot.frames;
        currentCoco.leftFoot.frames = swimmingCoco.leftFoot.frames;*/
        
        if(currentAction != kSwimmingAction)
        {
            [self removeChildByTag: currentAction cleanup: NO];
            [self addChild: swimmingCoco];
            currentAction = kSwimmingAction;
        }
        
        [swimmingCoco increaseSpeed];
        currentGroundSpeed = [swimmingCoco getCurrentCocoSpeed];
        
        //[currentCoco increaseSpeed];
    }
    else if(numberOfAction == 2)
    {
        if(currentAction == kRunningAction)
        {
            ICanJump = NO;
            
            [self runAction: [CCJumpTo actionWithDuration: 0.7 position: self.position height: 50 jumps: 1]];
            [self runAction:
                    [CCSequence actions:
                                [CCDelayTime actionWithDuration: 0.7],
                                [CCCallFunc actionWithTarget: self
                                                    selector: @selector(solveJump)],
                     nil]
             ];
        }
    }
    else if(numberOfAction == 3)
    {
        if(currentAction != kScramblingAction)
        {
            [self removeChildByTag: currentAction cleanup: NO];
            [self addChild: scramblingCoco];
            currentAction = kScramblingAction;
        }
        
        [scramblingCoco increaseSpeed];
        currentGroundSpeed = [scramblingCoco getCurrentCocoSpeed];
        
        //[currentCoco increaseSpeed];
    }
    else if(numberOfAction == 4)
    {
        if(currentAction != kGoingDownAction)
        {
            [self removeChildByTag: currentAction cleanup: NO];
            [self addChild: goingDownCoco];
            currentAction = kGoingDownAction;
        }
        
        [goingDownCoco increaseSpeed];
        currentGroundSpeed = [goingDownCoco getCurrentCocoSpeed];
        
        //[currentCoco increaseSpeed];
    }

}

- (float) getCurrentGroundSpeed
{
    return currentGroundSpeed;
}

- (void) solveJump
{
    ICanJump = YES;
}

- (void) increaseSpeed
{
    [body increaseSpeedAnimation];
    [head increaseSpeedAnimation];
    [rightHand increaseSpeedAnimation];
    [leftHand increaseSpeedAnimation];
    [rightFoot increaseSpeedAnimation];
    [leftFoot increaseSpeedAnimation];
}

+ (Coco *) createWithSpeed: (float) speed
{
    Coco *coco = [[[Coco alloc] initWithSpeed: speed] autorelease];
    
    return coco;
}

@end
