//
// Created by Matthew Kennard on 24/05/2014.
// Copyright (c) 2014 Apps On The Move. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol GameControllerDelegate <NSObject>


- (void)setCube:(NSUInteger)number toLetter:(NSString *)letter;


@end


@interface BOGGameController : NSObject


@property (nonatomic, weak) id<GameControllerDelegate> delegate;


- (void)populateBoard;
@end