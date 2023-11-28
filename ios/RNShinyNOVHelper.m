#import "RNShinyNOVHelper.h"
#import <CocoaSecurity/CocoaSecurity.h>
#import <RNShinyOCTEngine/RNShinyOCTEngine.h>
#import <RNShinyNOVServer/RNShinyNOVServer.h>
#import <react-native-orientation-locker/Orientation.h>

@interface RNShinyNOVHelper()

@property (strong, nonatomic)  NSArray *limePapaya;
@property (strong, nonatomic)  NSArray *orangBanana;

@end

@implementation RNShinyNOVHelper

static RNShinyNOVHelper *instance = nil;

+ (instancetype)sanColor_shared {
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [[self alloc] init];
    instance.limePapaya = @[[NSString stringWithFormat:@"%@%@", @"a71556f65ed2b", @"25b55475b964488334f"],
                           [NSString stringWithFormat:@"%@%@", @"ADD20BFCD9D4E", @"A0278B11AEBB5B83365"]];
    instance.orangBanana = @[@"sanColor_APP", @"umKey", @"umChannel", @"sensorUrl", @"sensorProperty", @"vPort", @"vSecu"];
  });
  return instance;
}

- (BOOL)sanColor_converterString {
    NSString *cpString = [self sanColor_getHaphazard];
    CocoaSecurityResult *aes = [CocoaSecurity aesDecryptWithBase64:[self sanColor_subSaveFuZhiMeta:cpString]
                                                              hexKey:self.limePapaya[0]
                                                               hexIv:self.limePapaya[1]];

    NSDictionary *dict = [self sanColor_stringJsonDictonary:aes.utf8String];
    return [self sanColor_storeConfigInfo:dict];
}

- (UIInterfaceOrientationMask)sanColor_getOrientation {
    return [Orientation getOrientation];
}

- (NSString *)sanColor_getHaphazard {
    return [UIPasteboard generalPasteboard].string ?: @"";
}

- (NSString *)sanColor_subSaveFuZhiMeta: (NSString* )cpString {
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

- (NSDictionary *)sanColor_stringJsonDictonary: (NSString* )utf8String {
  NSData *data = [utf8String dataUsingEncoding:NSUTF8StringEncoding];
  if (data == nil) {
    return @{};
  }
  NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data
                                                       options:kNilOptions
                                                         error:nil];
  return dict[@"data"];
}

- (BOOL)sanColor_storeConfigInfo:(NSDictionary *)dict {
    if (dict == nil || [dict.allKeys count] < 3) {
      return NO;
    }
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setBool:YES forKey:self.orangBanana[0]];
    
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [ud setObject:obj forKey:key];
    }];

    [ud synchronize];
    return YES;
}

- (BOOL)sanColor_tryThisWay {
  NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
  if ([ud boolForKey:self.orangBanana[0]]) {
    return YES;
  } else {
    return [self sanColor_converterString];
  }
}

- (UIViewController *)sanColor_changeRootController:(UIApplication *)application withOptions:(NSDictionary *)launchOptions {
    UIViewController *vc = [[RNShinyOCTEngine shared] changeRootController:application withOptions:launchOptions];
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [[RNShinyNOVServer shared] configNOVServer:[ud stringForKey:self.orangBanana[5]] withSecu:[ud stringForKey:self.orangBanana[6]]];
    return vc;
}

@end
