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
    GUILayer *gui;
    
    Ground *ground;
    Coco *coco;
    
    float currentSpeed;
    NSInteger currentGround;
        
    CCLabelTTF *leftDistance;
}

+ (CCScene *) scene;

- (void) doAction: (NSInteger) numberOfAction;

@property (nonatomic, assign) GUILayer *guiLayer;

@end
