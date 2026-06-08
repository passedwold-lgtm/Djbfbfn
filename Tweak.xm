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
                
                // Get the top-most window to ensure UI is visible and doesn't crash
                UIWindow *keyWindow = nil;
                if (@available(iOS 13.0, *)) {
                    for (UIWindowScene *scene in [UIApplication sharedApplication].connectedScenes) {
                        if (scene.activationState == UISceneActivationStateForegroundActive) {
                            for (UIWindow *window in scene.windows) {
                                if (window.isKeyWindow) {
                                    keyWindow = window;
                                    break;
                                }
                            }
                        }
                    }
                } else {
                    keyWindow = [UIApplication sharedApplication].keyWindow;
                }

                if (keyWindow) {
                    [keyWindow.rootViewController addChildViewController:menuController];
                    [keyWindow addSubview:menuController.view];
                    [menuController didMoveToParentViewController:keyWindow.rootViewController];
                    
                    // Basic positioning to prevent immediate crash if frame is zero
                    menuController.view.frame = keyWindow.bounds;
                }
            }
        });
    });
}

%end
