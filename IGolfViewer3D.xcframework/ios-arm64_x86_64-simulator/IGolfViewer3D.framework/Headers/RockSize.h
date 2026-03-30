//
//  RockSize.h
//  IGolfViewer3D
//
//  Created by Kirill on 19.12.2025.
//

#import <Foundation/Foundation.h>

@interface RockSize : NSObject

@property (nonatomic, assign) float size2D;
@property (nonatomic, assign) float size3D;

- (instancetype)initWithSize2D:(float)size2D andSize3D:(float)size3D;

@end

