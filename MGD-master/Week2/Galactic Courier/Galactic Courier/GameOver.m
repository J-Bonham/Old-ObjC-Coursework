//
//  GameOver.m
//  Galactic Courier
//
//  Created by Jeremiah Bonham on 5/14/15.
//  Copyright (c) 2015 Jeremiah.Bonham. All rights reserved.
//

#import "GameOver.h"
#import "LevelOne.h"

@interface GameOver()
{

    SKSpriteNode *bg1;
    SKNode *brokenShip;
    SKAction *playExplode;
}

@end


@implementation GameOver

-(instancetype)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
    }
    return self;
}


-(void)didMoveToView:(SKView *)view {
    self.scaleMode = SKSceneScaleModeAspectFill;
    
    playExplode = [SKAction playSoundFileNamed:@"explosion.mp3" waitForCompletion:YES];
    [self runAction:playExplode];

    bg1 = [SKSpriteNode spriteNodeWithImageNamed:@"bg020"];
    bg1.anchorPoint = CGPointZero;
    bg1.position = CGPointMake(0, 0);
    [self addChild:bg1];
    
    brokenShip = [SKSpriteNode spriteNodeWithImageNamed:@"explosion"];
    
    brokenShip.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMinY(self.frame) + 100);
    [self addChild:brokenShip];

    
        SKLabelNode *gameOver = [SKLabelNode labelNodeWithFontNamed:@"Futura Medium"];
        
        gameOver.text = @"GAME OVER";
        gameOver.fontColor = [SKColor whiteColor];
        gameOver.fontSize = 40;
        gameOver.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        [self addChild:gameOver];
        
        
        
        SKLabelNode *tryAgain = [SKLabelNode labelNodeWithFontNamed:@"Futura Medium"];
        
        tryAgain.text = @"Tap To Try Again";
        tryAgain.fontColor = [SKColor whiteColor];
        tryAgain.fontSize = 20;
        tryAgain.position = CGPointMake(self.frame.size.width/2, -50);
        
        SKAction *moveLabel = [SKAction moveToY:(self.frame.size.height/2 - 40) duration: 1.0];
        [tryAgain runAction:moveLabel];
        
        [self addChild:tryAgain];
    
  
};

-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    LevelOne *firstScene = [LevelOne sceneWithSize:self.size];
    [self.view presentScene:firstScene transition:[SKTransition doorsOpenHorizontalWithDuration:(1.25)]];
}

@end