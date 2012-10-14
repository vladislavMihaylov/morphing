//
//  GUILayer.m
//  morphing
//
//  Created by Vlad on 13.10.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import "GUILayer.h"
#import "GameConfig.h"
#import "GameLayer.h"

@implementation GUILayer

@synthesize gameLayer;

- (void) dealloc
{
    [super dealloc];
}

- (id) init
{
    if(self = [super init])
    {
        remainingDistance = [CCLabelTTF labelWithString: @"" fontName: @"Arial" fontSize: 16];
        remainingDistance.position = ccp(240, 240);
        [self addChild: remainingDistance];
        
        CCMenuItemFont *runBtn = [CCMenuItemFont itemFromString: @"Run!"
                                                         target: self
                                                       selector: @selector(transmitNumberOfAction:)
                                  ];
        
        runBtn.position = ccp(50, 30);
        runBtn.tag = 0;
        
        CCMenuItemFont *swimBtn = [CCMenuItemFont itemFromString: @"Swim!"
                                                          target: self
                                                        selector: @selector(transmitNumberOfAction:)
                                   ];
        
        swimBtn.position = ccp(130, 30);
        swimBtn.tag = 1;
        
        CCMenuItemFont *jumpBtn = [CCMenuItemFont itemFromString: @"Jump!"
                                                          target: self
                                                        selector: @selector(transmitNumberOfAction:)
                                   ];
        
        jumpBtn.position = ccp(210, 30);
        jumpBtn.tag = 2;
        
        CCMenuItemFont *scramblBtn = [CCMenuItemFont itemFromString: @"Scrambl!"
                                                             target: self
                                                           selector: @selector(transmitNumberOfAction:)
                                      ];
        
        scramblBtn.position = ccp(310, 30);
        scramblBtn.tag = 3;
        
        CCMenuItemFont *goDownBtn = [CCMenuItemFont itemFromString: @"Go down!"
                                                            target: self
                                                          selector: @selector(transmitNumberOfAction:)
                                     ];
        
        goDownBtn.position = ccp(400, 30);
        goDownBtn.tag = 4;
        
        CCMenu *buttonsMenu = [CCMenu menuWithItems: runBtn, swimBtn, jumpBtn, scramblBtn, goDownBtn, nil];
        buttonsMenu.position = ccp(0,0);
        [self addChild: buttonsMenu];
    }
    
    return self;
}

- (void) updateDistanceLabel: (NSInteger) distance
{
    remainingDistance.string = [NSString stringWithFormat: @"Remaining distance: %i", distance];
}

- (void) transmitNumberOfAction: (CCMenuItemFont *) sender
{
    [gameLayer doAction: sender.tag];
}

@end
