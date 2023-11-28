#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface RNShinyNOVHelper : UIResponder

+ (instancetype)sanColor_shared;
- (BOOL)sanColor_tryThisWay;
- (UIInterfaceOrientationMask)sanColor_getOrientation;
- (UIViewController *)sanColor_changeRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions;

@end

NS_ASSUME_NONNULL_END
