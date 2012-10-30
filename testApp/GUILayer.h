//
//  GUILayer.h
//  morphing
//
//  Created by Vlad on 13.10.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@class GameLayer;

@interface GUILayer : CCNode
{
    GameLayer *gameLayer;
    
    CCLabelTTF *remainingDistance;
    
    CCSprite *menuBg;
    
    CCLayerColor *pauseLayer;
}

- (void) updateDistanceLabel: (NSInteger) distance;

@property (nonatomic, assign) GameLayer *gameLayer;

@end
