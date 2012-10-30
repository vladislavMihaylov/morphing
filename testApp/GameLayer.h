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
#import "Francois.h"

#import "GUILayer.h"

@interface GameLayer: CCNode
{
    GUILayer *gui;
    
    Ground *ground;
    Coco *coco;
    Francois *francois;
    
    float currentSpeed;
    NSInteger currentGround;
    NSInteger curAction;
        
    CCLabelTTF *leftDistance;
}

+ (CCScene *) scene;

- (void) restartGame;

- (void) doAction: (NSInteger) numberOfAction;

@property (nonatomic, assign) GUILayer *guiLayer;

@end
