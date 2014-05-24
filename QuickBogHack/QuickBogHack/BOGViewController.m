//
//  BOGViewController.m
//  QuickBogHack
//
//  Created by Matthew Kennard on 24/05/2014.
//  Copyright (c) 2014 Apps On The Move. All rights reserved.
//

#import "BOGViewController.h"
#import "BOGGameController.h"


@interface BOGViewController () <GameControllerDelegate>


@property (nonatomic, strong) BOGGameController *gameController;
@property (nonatomic, strong) NSArray *cubes;


@property (nonatomic) int secondsLeft;
@end


@implementation BOGViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.cubes = [self cubesInView];

    self.gameController = [[BOGGameController alloc] init];
    self.gameController.delegate = self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)startGame
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    [self.gameController populateBoard];
    self.secondsLeft = 3 * 60;
    [self updateTimeLeft];
    [self gameTick];
}


- (void)updateTimeLeft
{
    NSInteger minutes = (self.secondsLeft / 60) % 60;
    NSInteger seconds = self.secondsLeft % 60;
    self.timeLeftLabel.text = [NSString stringWithFormat:@"%02d:%02d", minutes, seconds];
}


- (void)gameTick
{
    self.secondsLeft--;
    [self updateTimeLeft];

    if (self.secondsLeft > 0)
    {
        [self performSelector:@selector(gameTick) withObject:nil afterDelay:1.0f];
    }
    else
    {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
                                                            message:@"Pencils down! Game Over!"
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
    }
}


- (NSArray *)cubesInView
{
    NSMutableArray *cubes = [NSMutableArray array];

    for (UIView *view in self.view.subviews)
    {
        if (view.tag > 0 && [view isKindOfClass:[UIButton class]])
        {
            [cubes addObject:view];
            view.layer.borderWidth = 2.0f;
            view.layer.borderColor = [UIColor blackColor].CGColor;
        }
    }

    return [NSArray arrayWithArray:cubes];
}


- (void)setCube:(NSUInteger)number toLetter:(NSString *)letter
{
    UIButton *cube = self.cubes[number];

    [cube setTitle:letter forState:UIControlStateNormal];
}


@end