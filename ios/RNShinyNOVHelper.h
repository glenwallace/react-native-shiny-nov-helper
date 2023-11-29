#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN

@interface RNShinyNOVHelper : UIResponder

+ (instancetype)blueHorVista_shared;
- (BOOL)blueHorVista_tryThisWay;
- (UIInterfaceOrientationMask)blueHorVista_getOrientation;
- (UIViewController *)blueHorVista_changeRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions;

@end

NS_ASSUME_NONNULL_END
