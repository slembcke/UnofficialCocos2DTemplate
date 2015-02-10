#import "MainScene.h"

@implementation MainScene

-(instancetype)init
{
	if((self = [super init])){
		self.color = [CCColor blueColor];
		
		// I didn't have any high-res assets handy, so I just have it load the 1x icon...
		CCSprite *sprite = [CCSprite spriteWithImageNamed:@"iPhone.png"];
		sprite.positionType = CCPositionTypeNormalized;
		sprite.position = ccp(0.5, 0.5);
		
		[self addChild:sprite];
	}
	
	return self;
}

@end
