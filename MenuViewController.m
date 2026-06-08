#import "MenuViewController.h"

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupUI];
}

- (void)setupUI {
    self.view.backgroundColor = [UIColor clearColor];
    self.view.userInteractionEnabled = YES;
    
    // Main Menu Container
    self.menuView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 350, 450)];
    self.menuView.center = CGPointMake(CGRectGetMidX(self.view.bounds), CGRectGetMidY(self.view.bounds));
    self.menuView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    self.menuView.backgroundColor = [UIColor colorWithRed:0.10f green:0.10f blue:0.10f alpha:0.90f];
    self.menuView.layer.cornerRadius = 15;
    self.menuView.clipsToBounds = YES;
    [self.view addSubview:self.menuView];
    
    // Title
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 350, 50)];
    self.titleLabel.text = @"Cloned UI";
    self.titleLabel.textColor = [UIColor whiteColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [self.menuView addSubview:self.titleLabel];
    
    // Tab Bar (Segmented Control)
    NSArray *tabs = @[@"Main"];
    self.tabBar = [[UISegmentedControl alloc] initWithItems:tabs];
    self.tabBar.frame = CGRectMake(10, 55, 330, 35);
    self.tabBar.selectedSegmentIndex = 0;
    self.tabBar.tintColor = [UIColor colorWithRed:1.00f green:0.00f blue:0.00f alpha:1.00f];
    [self.menuView addSubview:self.tabBar];
    
    // Scroll View for Content
    self.contentScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 100, 350, 350)];
    [self.menuView addSubview:self.contentScrollView];
    
    // Stack View for Switches
    self.stackView = [[UIStackView alloc] initWithFrame:CGRectMake(15, 0, 320, 0)];
    self.stackView.axis = UILayoutConstraintAxisVertical;
    self.stackView.spacing = 15;
    self.stackView.alignment = UIStackViewAlignmentFill;
    self.stackView.distribution = UIStackViewDistributionEqualSpacing;
    [self.contentScrollView addSubview:self.stackView];
    
    
    
}

- (void)addSwitchWithName:(NSString *)name {
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, 200, 30)];
    label.text = name;
    label.textColor = [UIColor whiteColor];
    [container addSubview:label];
    
    UISwitch *sw = [[UISwitch alloc] initWithFrame:CGRectMake(260, 5, 50, 30)];
    sw.onTintColor = [UIColor colorWithRed:1.00f green:0.00f blue:0.00f alpha:1.00f];
    [container addSubview:sw];
    
    [self.stackView addArrangedSubview:container];
    
    // Update Content Size
    self.contentScrollView.contentSize = CGSizeMake(350, self.stackView.frame.size.height + 20);
}

- (void)addSliderWithLabel:(NSString *)label variableName:(NSString *)varName minValue:(float)minVal maxValue:(float)maxVal format:(NSString *)format {
    UIView *container = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
    
    UILabel *labelView = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 20)];
    labelView.text = label;
    labelView.textColor = [UIColor whiteColor];
    [container addSubview:labelView];
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(0, 25, 320, 30)];
    slider.minimumValue = minVal;
    slider.maximumValue = maxVal;
    slider.value = (minVal + maxVal) / 2; // Default value
    slider.tintColor = [UIColor blueColor]; // Placeholder
    [container addSubview:slider];
    
    [self.stackView addArrangedSubview:container];
    
    // Update Content Size
    self.contentScrollView.contentSize = CGSizeMake(350, self.stackView.frame.size.height + 20);
}

@end
