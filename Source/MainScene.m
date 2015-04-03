#import "MainScene.h"

@implementation MainScene

-(instancetype)init
{
	if((self = [super init])){
		self.color = [CCColor blueColor];
		
		CCSprite *sprite = [CCSprite spriteWithImageNamed:@"image.png"];
		sprite.positionType = CCPositionTypeNormalized;
		sprite.position = ccp(0.5, 0.5);
		[self addChild:sprite];
		
		CGSize size = [CCDirector sharedDirector].viewSize;
		float scale = [CCDirector sharedDirector].contentScaleFactor;
		
		NSString *str = [NSString stringWithFormat:@"Size in points: (%.1f, %.1f)\nContent scale: %.2f", size.width, size.height, scale];
		CCLabelTTF *label = [CCLabelTTF labelWithString:str fontName:nil fontSize:24];
		label.positionType = CCPositionTypeNormalized;
		label.position = ccp(0.5, 0.2);
		label.horizontalAlignment = CCTextAlignmentCenter;
		[self addChild:label];
	}
	
	return self;
}

@end
