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
#import "HelloWorldLayer.h"

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
        CCMenuItemImage *pauseBtn = [CCMenuItemImage itemFromNormalImage: @"pauseBtn.png"
                                                           selectedImage: @"pauseBtn.png"
                                                                  target: self
                                                                selector: @selector(showPauseMenu)
                                     ];
        
        pauseBtn.position = ccp(440, 280);
        
        
        CCMenu *guiMenu = [CCMenu menuWithItems: pauseBtn, nil];
        guiMenu.position = ccp(0,0);
        
        [self addChild: guiMenu];
        
        /////////////////////////////
        
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

- (void) showPauseMenu
{
    if(IsGameActive)
    {
        IsGameActive = NO;
        
        pauseLayer = [CCLayerColor layerWithColor: ccc4(0, 0, 0, 200)];
        pauseLayer.position = ccp(0,0);
        [self addChild: pauseLayer];
        
        menuBg = [CCSprite spriteWithFile: @"menuBg.png"];
        menuBg.position = ccp(240, 480);
        [self addChild: menuBg];
        
        
        CCMenuItemImage *playMenuBtn = [CCMenuItemImage itemFromNormalImage: @"playBtn.png"
                                                              selectedImage: @"playBtn.png"
                                                                      block: ^(id sender) {
                                                                          IsGameActive = YES;
                                                                          [self removeChild: menuBg cleanup: YES];
                                                                          [self removeChild: pauseLayer cleanup: YES];
                                                                      }
                                        ];
        
        CCMenuItemImage *exitMenuBtn = [CCMenuItemImage itemFromNormalImage: @"exitBtn.png"
                                                              selectedImage: @"exitBtn.png"
                                                                      block: ^(id sender) {
                                                                          [[CCDirector sharedDirector] replaceScene: [CCTransitionFade transitionWithDuration: 1 scene: [HelloWorldLayer scene]]];
                                                                      }
                                        ];
        
        CCMenuItemImage *restartGameBtn = [CCMenuItemImage itemFromNormalImage: @"restartBtn.png"
                                                                 selectedImage: @"restartBtn.png"
                                                                        target: self
                                                                      selector: @selector(restartGame)
                                           ];
        
        exitMenuBtn.position = ccp(100, 40);
        playMenuBtn.position = ccp(200, 40);
        restartGameBtn.position = ccp(300, 40);
        
        CCMenu *menu = [CCMenu menuWithItems: exitMenuBtn, playMenuBtn, restartGameBtn, nil];
        menu.position = ccp(0,0);
        
        [menuBg addChild: menu];
        
        
        [menuBg runAction: [CCMoveTo actionWithDuration: 1 position: ccp(240, 160)]];
    }
}

- (void) restartGame
{
    IsGameActive = YES;
    
    [gameLayer restartGame];
    [self removeChild: menuBg cleanup: YES];
    [self removeChild: pauseLayer cleanup: YES];
}

- (void) updateDistanceLabel: (NSInteger) distance
{
    //remainingDistance.string = [NSString stringWithFormat: @"Remaining distance: %i", distance];
}

- (void) transmitNumberOfAction: (CCMenuItemFont *) sender
{
    [gameLayer doAction: sender.tag];
}

@end
