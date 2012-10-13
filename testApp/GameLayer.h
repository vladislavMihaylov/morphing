//
//  MyCocos2DClass.h
//  morphing
//
//  Created by Vlad on 09.10.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "Ground.h"
#import "Coco.h"

#import "GUILayer.h"

@interface GameLayer: CCNode
{
    GUILayer *guiLayer;
    
    Ground *ground;
    Coco *coco;
    
    float currentSpeed;
    NSInteger currentGround;
    
    float distance;
    
    CCLabelTTF *leftDistance;
}

+ (CCScene *) scene;

- (void) showLabelWithDistance: (NSInteger) distance;

@property (nonatomic, assign) GUILayer *guiLayer;

@end
