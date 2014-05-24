//
//  BOGViewController.h
//  QuickBogHack
//
//  Created by Matthew Kennard on 24/05/2014.
//  Copyright (c) 2014 Apps On The Move. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BOGGameController;


@interface BOGViewController : UIViewController


@property (nonatomic, weak) IBOutlet UILabel *timeLeftLabel;


- (IBAction)startGame;


@end