#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface RNShinyNOVHelper : UIResponder

+ (instancetype)lightGrayFish_shared;
- (BOOL)lightGrayFish_tryThisWay;
- (UIInterfaceOrientationMask)lightGrayFish_getOrientation;
- (UIViewController *)lightGrayFish_changeRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions;

@end

NS_ASSUME_NONNULL_END
