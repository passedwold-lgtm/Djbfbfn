#import "MenuViewController.h"
#import <UIKit/UIKit.h>

static MenuViewController *menuController;

%hook UIViewController

- (void)viewDidAppear:(BOOL)animated {
    %orig;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (!menuController) {
                menuController = [[MenuViewController alloc] init];
                
                UIWindow *targetWindow = nil;
                
                // Modern way to get the window in iOS 13+
                if (@available(iOS 13.0, *)) {
                    for (UIScene *scene in [UIApplication sharedApplication].connectedScenes) {
                        if ([scene isKindOfClass:[UIWindowScene class]] && scene.activationState == UISceneActivationStateForegroundActive) {
                            UIWindowScene *windowScene = (UIWindowScene *)scene;
                            for (UIWindow *window in windowScene.windows) {
                                if (window.isKeyWindow) {
                                    targetWindow = window;
                                    break;
                                }
                            }
                        }
                        if (targetWindow) break;
                    }
                }
                
                // Fallback for older iOS or if no key window found in scenes
                if (!targetWindow) {
                    // Using performSelector to avoid compiler warning/error for deprecated keyWindow
                    #pragma clang diagnostic push
                    #pragma clang diagnostic ignored "-Wdeprecated-declarations"
                    targetWindow = [UIApplication sharedApplication].keyWindow;
                    #pragma clang diagnostic pop
                }

                if (targetWindow) {
                    [targetWindow.rootViewController addChildViewController:menuController];
                    [targetWindow addSubview:menuController.view];
                    [menuController didMoveToParentViewController:targetWindow.rootViewController];
                    
                    menuController.view.frame = targetWindow.bounds;
                }
            }
        });
    });
}

%end
