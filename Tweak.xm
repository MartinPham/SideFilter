static void createBlurView(UIView *view, CGRect bound, int effect)  {
    UIVisualEffectView *visualEffectView = [[UIVisualEffectView alloc] initWithEffect:[UIBlurEffect effectWithStyle:effect]];
    visualEffectView.frame = bound;
    visualEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [view addSubview:visualEffectView];
    [view sendSubviewToBack:visualEffectView];
	[visualEffectView release];
}

@interface SBSideSwitcherScrollingItemViewController : UIViewController <UITextFieldDelegate> {
	UIScrollView* _scrollView;
}
@property (assign) NSMutableArray *allItems;
// @property (assign) UITextField *filterTextField;
@property (assign) UISearchBar *filterSearchBar;
@property (nonatomic,copy) NSArray * displayItems;  
-(void)_updateScrollViewFrameAndContentSize;
-(void)_updateVisiblePageViews;
-(void)setDisplayItems:(NSArray *)arg1 ;
@end


%hook SBSideSwitcherScrollingItemViewController
%property (assign) NSMutableArray *allItems;
// %property (assign) UITextField *filterTextField;
%property (assign) UISearchBar *filterSearchBar;

-(void)viewDidLoad {
	%orig;

	self.allItems = [[NSMutableArray alloc] init];

	// if([self.view viewWithTag:181188] == nil) {
		UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width,44)];
		view.tag = 181188;
		createBlurView(view, view.bounds, UIBlurEffectStyleDark);

		// self.filterTextField = [[UITextField alloc] init];
		// self.filterTextField.borderStyle = UITextBorderStyleRoundedRect;
		// self.filterTextField.frame = CGRectMake(15,7,view.frame.size.width - 30,30);
		// self.filterTextField.delegate = self;
		// self.filterTextField.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.3];
		// self.filterTextField.textColor = [UIColor whiteColor];
		// self.filterTextField.placeholder = @"Search..";
		

		// [self.filterTextField addTarget:self 
		// 		action:@selector(filterTextFieldDidChange:) 
		// forControlEvents:UIControlEventEditingChanged];

		// UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
		// UIVibrancyEffect *vibrance = [UIVibrancyEffect effectForBlurEffect:blurEffect];

		// UIVisualEffectView *visualEffectView;
		// visualEffectView = [[UIVisualEffectView alloc] initWithEffect:vibrance];

		// visualEffectView.frame = self.filterTextField.bounds;
		// [self.filterTextField addSubview:visualEffectView];
		

		// [view addSubview:self.filterTextField];

		// UISearchBar *filterSearchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(15,7,view.frame.size.width - 30,30)];
		self.filterSearchBar = [[UISearchBar alloc] initWithFrame:view.frame];
		self.filterSearchBar.searchBarStyle = UISearchBarStyleMinimal;
		self.filterSearchBar.placeholder = @"Search";

		UITextField *searchField = [self.filterSearchBar valueForKey:@"searchField"];
		searchField.textColor = [UIColor colorWithRed:1.0f green:1.0f blue:1.0f alpha:0.8];
		[searchField addTarget:self 
				action:@selector(filterTextFieldDidChange:) 
		forControlEvents:UIControlEventEditingChanged];

		// UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
		// UIVibrancyEffect *vibrance = [UIVibrancyEffect effectForBlurEffect:blurEffect];

		// UIVisualEffectView *visualEffectView;
		// visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];

		// visualEffectView.frame = self.filterTextField.bounds;
		// [filterSearchBar addSubview:visualEffectView];

		[view addSubview:self.filterSearchBar];
		[self.view addSubview:view];
		// [self.view addSubview:filterSearchBar];


		// [self.view addSubview:view];



		// [filterTextField release];
		[view release];
	// }


	UIScrollView* _scrollView = (UIScrollView *)MSHookIvar<UIScrollView *>(self, "_scrollView");
	// _scrollView.backgroundColor = [UIColor colorWithPatternImage: i];
	_scrollView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;

	// if([self.view viewWithTag:151288] == nil) {
		// Adding blur wallpaper
		UIImage *i = [[[%c(SBWallpaperController) performSelector:@selector(sharedInstance)] performSelector:@selector(_activeWallpaperView)] performSelector:@selector(_displayedImage)];
		// UIImage *i = [[[%c(SBWallpaperController) performSelector:@selector(sharedInstance)] performSelector:@selector(_activeWallpaperView)] performSelector:@selector(_blurredImage)];



		UIImageView *iv = [[UIImageView alloc] initWithImage:i];
		iv.tag = 151288;
		// iv.alpha = 0.3;
		iv.frame = [UIScreen mainScreen].bounds;
		createBlurView(iv, iv.bounds, UIBlurEffectStyleDark);
		[self.view addSubview:iv];
		[self.view sendSubviewToBack:iv];
		[iv release];

		// self.view.backgroundColor = [UIColor clearColor];
		// self.view.backgroundColor = [UIColor colorWithPatternImage: i];
	// }

}


-(void)viewDidAppear:(BOOL)arg1 {
	%orig;

	[self.allItems removeAllObjects];
	for(id item in self.displayItems) {
		[self.allItems addObject:item];
	}

	// UITextField *searchField = [self.filterSearchBar valueForKey:@"_searchField"];
	// searchField.textColor = [UIColor whiteColor];

	// self.filterTextField.text = @"";

	self.filterSearchBar.frame = CGRectMake(0,0,self.view.frame.size.width,44);
	UITextField *searchField = [self.filterSearchBar valueForKey:@"searchField"];
	searchField.text = @"";

	// if([self.view viewWithTag:181188] == nil) {
	// 	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.view.frame.size.width,44)];
	// 	view.tag = 181188;
	// 	createBlurView(view, view.bounds, UIBlurEffectStyleDark);

	// 	UITextField *filterTextField = [[UITextField alloc] init];
	// 	filterTextField.borderStyle = UITextBorderStyleRoundedRect;
	// 	filterTextField.frame = CGRectMake(15,7,view.frame.size.width - 30,30);
	// 	filterTextField.delegate = self;
	// 	filterTextField.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.3];
	// 	filterTextField.textColor = [UIColor whiteColor];

		

	// 	[filterTextField addTarget:self 
	// 			action:@selector(filterTextFieldDidChange:) 
	// 	forControlEvents:UIControlEventEditingChanged];

		

	// 	[view addSubview:filterTextField];
	// 	[self.view addSubview:view];

	// 	[filterTextField release];
	// 	[view release];
	// }


	// UIScrollView* _scrollView = (UIScrollView *)MSHookIvar<UIScrollView *>(self, "_scrollView");
	// // _scrollView.backgroundColor = [UIColor colorWithPatternImage: i];
	// _scrollView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;

	// if([self.view viewWithTag:151288] == nil) {
	// 	// Adding blur wallpaper
	// 	UIImage *i = [[[%c(SBWallpaperController) performSelector:@selector(sharedInstance)] performSelector:@selector(_activeWallpaperView)] performSelector:@selector(_displayedImage)];
	// 	// UIImage *i = [[[%c(SBWallpaperController) performSelector:@selector(sharedInstance)] performSelector:@selector(_activeWallpaperView)] performSelector:@selector(_blurredImage)];



	// 	UIImageView *iv = [[UIImageView alloc] initWithImage:i];
	// 	iv.tag = 151288;
	// 	// iv.alpha = 0.3;
	// 	iv.frame = [UIScreen mainScreen].bounds;
	// 	createBlurView(iv, iv.bounds, UIBlurEffectStyleDark);
	// 	[self.view addSubview:iv];
	// 	[self.view sendSubviewToBack:iv];
	// 	[iv release];

	// 	// self.view.backgroundColor = [UIColor clearColor];
	// 	// self.view.backgroundColor = [UIColor colorWithPatternImage: i];
	// }
	
}

%new
-(void)filterTextFieldDidChange:(UITextField *)filterTextField {
	// NSLog(@">>> filterTextFieldDidChange >> %@", filterTextField);
	NSString *keyword = [filterTextField.text lowercaseString];

	if (keyword.length == 0) {
		[self setDisplayItems:self.allItems];
	} else {
		NSMutableArray *filteredItems = [[NSMutableArray alloc] init];
		for(id item in self.allItems) {
			NSString *idString = [item performSelector:@selector(displayIdentifier)];
			id app = [[%c(-SBApplicationController) performSelector:@selector(sharedInstance)] performSelector:@selector(applicationWithBundleIdentifier:) withObject:idString];
			NSString *name = [[app performSelector:@selector(displayName)] lowercaseString];
			if (
				[name rangeOfString:keyword].location != NSNotFound
				|| [[idString lowercaseString] rangeOfString:keyword].location != NSNotFound
				) {
				[filteredItems addObject:item];
			}
		}
		[self setDisplayItems:filteredItems];

		[filteredItems release];
	}

	[self _updateVisiblePageViews];
	[self _updateScrollViewFrameAndContentSize];

	
	UIScrollView* _scrollView = (UIScrollView *)MSHookIvar<UIScrollView *>(self, "_scrollView");
	[_scrollView scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];

}

%new
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
	return NO;
}

%end