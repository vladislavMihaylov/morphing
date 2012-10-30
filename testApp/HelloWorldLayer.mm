//
//  HelloWorldLayer.m
//  testApp
//
//  Created by Mac on 17.09.12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "Common.h"
#import "GameLayer.h"
//#import "Coco.h"

#import "GameConfig.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
    
	// return the scene
	return scene;
}

- (void) dealloc
{
	[super dealloc];
}

-(id) init
{
	if( (self=[super init])) {
		
		CCMenuItemFont *playCoco = [CCMenuItemFont itemFromString: @"PLAY WITH COCO"
                                                           target: self
                                                         selector: @selector(play:)];
        playCoco.position = ccp(240, 160);
        playCoco.tag = 0;
        
        CCMenuItemFont *playFrancois = [CCMenuItemFont itemFromString: @"PLAY WITH FRANCOIS"
                                                               target: self
                                                             selector: @selector(play:)];
        playFrancois.position = ccp(240, 100);
        playFrancois.tag = 1;
        
        CCMenu *menu = [CCMenu menuWithItems: playCoco, playFrancois, nil];
        menu.position = ccp(0,0);
        [self addChild: menu];
	}
	return self;
}

- (void) play: (CCMenuItemFont *) sender
{
    typeCharacter = sender.tag;
    [[CCDirector sharedDirector] replaceScene: [CCTransitionFade transitionWithDuration: 1 scene: [GameLayer scene]]];
}


@end
