//
//  RockParams.h
//  IGolfViewer3D
//
//  Created by Kirill on 19.12.2025.
//

#import <Foundation/Foundation.h>
#import "RockSize.h"

@interface RockParams : NSObject

@property (nonatomic, strong) RockSize* smallRock;
@property (nonatomic, strong) RockSize* mediumRock;
@property (nonatomic, strong) RockSize* bigRock;

// Predefined default sizes
+ (RockSize*)defaultSmallRockSize;
+ (RockSize*)defaultMediumRockSize;
+ (RockSize*)defaultBigRockSize;

- (instancetype)initWithSmallRock:(RockSize*)smallRock
                     mediumRock:(RockSize*)mediumRock
                       bigRock:(RockSize*)bigRock;

@end

