//
//  Coco.h
//  testApp
//
//  Created by Mac on 30.09.12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "CurrentCoco.h"
#import "RunningCoco.h"
#import "SwimmingCoco.h"

@interface Coco : CCNode 
{
    CurrentCoco *currentCoco;
    
    RunningCoco *runningCoco;
    SwimmingCoco *swimmingCoco;
}

+ (Coco *) create;

@end
