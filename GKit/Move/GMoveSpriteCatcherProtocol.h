//
//  GMoveSpriteCatcherProtocol.h
//  FreeMove
//
//  Created by Glare on 13-4-12.
//  Copyright (c) 2013年 Hoewo. All rights reserved.
//

@class GMoveSnapshot;
@class GMoveScene;
@protocol GMoveSpriteProtocol;

#define GMoveSpriteCatcherProtocol() NSProtocolFromString(@"GMoveSpriteCatcherProtocol")

@protocol GMoveSpriteCatcherProtocol <NSObject>

@optional
// find sprite
- (UIView<GMoveSpriteProtocol> *)requireSpriteAtPoint:(CGPoint)point inScene:(GMoveScene *)scene;

// prepare
- (GMoveSnapshot *)prepareSnapshotForOwnSprite:(UIView *)sprite;
- (CGRect)prepareFrameForSnapshot:(GMoveSnapshot *)snapshot;
- (void)didPrepareSnapshot:(GMoveSnapshot *)snapshot;

// moving snapshot
- (void)beginCatchingSnapshot:(GMoveSnapshot *)snapshot;
- (void)isCatchingSnapshot:(GMoveSnapshot *)snapshot;
- (void)endCatchingSnapshot:(GMoveSnapshot *)snapshot;

// did finish
- (void)didCatchSnapshot:(GMoveSnapshot *)snapshot;
- (void)removeOwnSprite:(UIView *)sprite;

@end

