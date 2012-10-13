

#import <Foundation/Foundation.h>
#import "cocos2d.h"

#import "AnimationNode.h"

@interface RunningCoco : CCNode 
{
    AnimationNode *body;
    AnimationNode *head;
    AnimationNode *rightHand;
    AnimationNode *leftHand;
    AnimationNode *rightFoot;
    AnimationNode *leftFoot;
    
    float currentSpeed;
}

+ (RunningCoco *) createWithSpeed: (float) speed;
- (void) increaseSpeed;
- (float) getCurrentCocoSpeed;

@property (nonatomic, assign) AnimationNode *body;
@property (nonatomic, assign) AnimationNode *head;
@property (nonatomic, assign) AnimationNode *rightHand;
@property (nonatomic, assign) AnimationNode *leftHand;
@property (nonatomic, assign) AnimationNode *rightFoot;
@property (nonatomic, assign) AnimationNode *leftFoot;

@end
