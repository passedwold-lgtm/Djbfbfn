#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController
@property (nonatomic, strong) UIView *menuView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UISegmentedControl *tabBar;
@property (nonatomic, strong) UIScrollView *contentScrollView;
@property (nonatomic, strong) UIStackView *stackView;

- (void)setupUI;
- (void)addSwitchWithName:(NSString *)name;
- (void)addSliderWithLabel:(NSString *)label variableName:(NSString *)varName minValue:(float)minVal maxValue:(float)maxVal format:(NSString *)format;
@end
