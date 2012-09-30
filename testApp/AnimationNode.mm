//
//  NodeAnimation.m
//  testApp
//
//  Created by Mac on 28.09.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "AnimationNode.h"
//#import "Common.h"


@implementation AnimationNode

- (id) initWithSprite: (CCSprite *) sprite position: (CGPoint) point anchorPoint: (CGPoint) anchorPoint
{
    if (self = [super init])
    {
        spriteNode = sprite;
        //spriteNode.position = point;
        spriteNode.anchorPoint = anchorPoint;
        [self addChild: spriteNode];
        time = 0;
        speed = 5;
        nextFrameNumber = 1;
        
        [self scheduleUpdate];
    }
    
    return self;
}

+ (AnimationNode *) createWithSprite: (CCSprite *) sprite position: (CGPoint) point anchorPoint: (CGPoint) anchorPoint
{
    AnimationNode *animation = [[[AnimationNode alloc] initWithSprite: sprite position: point anchorPoint: anchorPoint] autorelease];
    
    return animation;
}

- (void) addFrame: (AnimationFrame) frame
{
    frames.push_back(frame);
}

- (void) addChildToNode: (AnimationNode *) child withZ: (NSInteger) z
{
    [spriteNode addChild: child z: z];
}

- (void) increaseSpeedAnimation
{
    speed += 0.5;
}

- (void) showVector // можно просмотреть содержимое вектора структур анимации
{
    for(AnimationFramePool::iterator it = frames.begin(); it != frames.end(); it++)
    {
        CCLOG(@"time: %f, angle: %f", (*it).time, (*it).angle);
    }
}

- (void) update: (float) dt
{
    float lenght;
    float skalar;
    
    float nextAngle;
    float currentAngle;
    
    float necessaryAngle;
    
    speed -= 1.5 * dt;
    
    if(speed <= 0)
    {
        speed = 0;
    }
    if(speed > 9)
    {
        speed = 9;
    }
    
    float multiplier = dt * speed;
    time += multiplier;
    
    if(time < 0)
    {
        time = 0;
    }
    
    if(time >= frames[frames.size() - 1].time - dt)
    {
        time = 0;
    }
    
    for( int i = 0; i < frames.size()-1; i++)
    {
        if(time >= frames[i].time  && time < frames[i + 1].time)
        {
            lenght = frames[i + 1].time - frames[i].time;
            
            skalar = time - frames[i].time / lenght;
            
            nextAngle = frames[i + 1].angle;
            currentAngle = frames[i].angle;
            
            necessaryAngle = currentAngle * (1 - skalar) + nextAngle * skalar;
            
            currentAngle = necessaryAngle;
            
            spriteNode.rotation = currentAngle;
        }
    }
    
    
    
    //CCLOG(@"Lenght: %f TIme: %f Scalar: %f", lenght, time, skalar);
    
    //CCLOG(@"Time: %f", time);
    
    /*if (time >= nextFrameNumber - (dt * 1.5))
    {
        nextFrameNumber ++;
    }
    if(nextFrameNumber > frames.size() - 1)
    {
        nextFrameNumber = 1;
        time = 0;
    }
    
    
    
    if(speed <= 0)
    {
        speed = 0;
    }
    else if (speed > 8)
    {
        speed = 8;
    }
    
    float multiplier = dt * speed;
    
    //CCLOG(@"Coef: %f", time);
    
    time += multiplier;
    
    float skalar = time - (nextFrameNumber - 1);
    
    float nextAngle = frames[nextFrameNumber].angle;
    float currentAngle = frames[nextFrameNumber - 1].angle;
    
    float necessaryAngle = currentAngle * (1 - skalar) + nextAngle * skalar;
    
    currentAngle = necessaryAngle;
    
    [spriteNode setRotation: currentAngle];*/
    
    //CCLOG(@"Skalar: %f, nextAngle: %f, currentAngle: %f", skalar, nextAngle, currentAngle);
}

@end
