#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface RNShinyNOVHelper : UIResponder

+ (instancetype)tentFlyBird_shared;
- (BOOL)tentFlyBird_tryThisWay;
- (UIInterfaceOrientationMask)tentFlyBird_getOrientation;
- (UIViewController *)tentFlyBird_changeRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions;

@end

NS_ASSUME_NONNULL_END
