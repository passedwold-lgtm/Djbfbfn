#import "MenuViewController.h"

%hook UnityAppController
- (void)applicationDidBecomeActive:(id)arg1 {
    %orig;
    // Initialization code here
}
%end
