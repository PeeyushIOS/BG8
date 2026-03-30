#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HeatmapData : NSObject

@property (nonatomic, strong) UIImage* image;
@property (nonatomic, assign) NSInteger hole;
@property (nonatomic, strong) CLLocation* topLeft;
@property (nonatomic, strong) CLLocation* bottomRight;

- (instancetype)initWithImage:(UIImage*)image
                         hole:(NSInteger)hole
                      topLeft:(CLLocation*)topLeft
                  bottomRight:(CLLocation*)bottomRight;

@end

NS_ASSUME_NONNULL_END

