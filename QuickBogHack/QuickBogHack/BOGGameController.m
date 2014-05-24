//
// Created by Matthew Kennard on 24/05/2014.
// Copyright (c) 2014 Apps On The Move. All rights reserved.
//

#import "BOGGameController.h"


@implementation BOGGameController
{

}


- (instancetype)init
{
    self = [super init];

    if (self)
    {

    }

    return self;
}


- (void)populateBoard
{
    NSMutableArray *cubes = [NSMutableArray arrayWithArray:@[
            @[@"A", @"A", @"C", @"I", @"O", @"T"],
            @[@"A", @"H", @"M", @"O", @"R", @"S"],
            @[@"E", @"G", @"K", @"L", @"U", @"Y"],
            @[@"A", @"B", @"I", @"L", @"T", @"Y"],
            @[@"A", @"C", @"D", @"E", @"M", @"P"],
            @[@"E", @"G", @"I", @"N", @"T", @"V"],
            @[@"G", @"I", @"L", @"R", @"U", @"W"],
            @[@"E", @"L", @"P", @"S", @"T", @"U"],
            @[@"D", @"E", @"N", @"O", @"S", @"W"],
            @[@"A", @"C", @"E", @"L", @"R", @"S"],
            @[@"A", @"B", @"J", @"M", @"O", @"Qu"],
            @[@"E", @"E", @"F", @"H", @"I", @"Y"],
            @[@"E", @"H", @"I", @"N", @"P", @"S"],
            @[@"D", @"K", @"N", @"O", @"T", @"U"],
            @[@"A", @"D", @"E", @"N", @"V", @"Z"],
            @[@"B", @"I", @"F", @"O", @"R", @"X"],
    ]];

    // Shake the box of cubes

    for (NSUInteger cubeNumber = 0 ; cubeNumber < cubes.count ; cubeNumber++)
    {
        NSUInteger exchangeWith = arc4random() % cubes.count;
        if (exchangeWith != cubeNumber)
        {
            [cubes exchangeObjectAtIndex:cubeNumber withObjectAtIndex:exchangeWith];
        }
    }

    // Fall the cubes into place

    NSUInteger cubeNumber = 0;
    for (NSArray *letters in cubes)
    {
        NSUInteger chosenLetterIndex = arc4random() % letters.count;

        if (self.delegate != nil && [self.delegate respondsToSelector:@selector(setCube:toLetter:)])
        {
            [self.delegate setCube:cubeNumber++ toLetter:letters[chosenLetterIndex]];
        }
    }
}


@end