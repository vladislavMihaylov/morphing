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

#import "Coco.h"


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
		
		// create and initialize a Label
		label = [CCLabelTTF labelWithString:@"" fontName:@"Marker Felt" fontSize:24];

		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
	
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/2 );
		
		// add the label as a child to this Layer
        
        [self addChild: label];
        
        Coco *coco = [Coco create];
        [self addChild: coco];
	}
	return self;
}

- (void) askAboutTime
{
    
    NSDate *currentDate = [NSDate date];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter new] autorelease];
    [dateFormatter setDateStyle: kCFDateFormatterNoStyle];
    [dateFormatter setTimeStyle: kCFDateFormatterFullStyle];
    
    //label.string = [NSString stringWithFormat: @"%@", currentDate];
    label.string = [dateFormatter stringFromDate: currentDate];
    
}


@end
