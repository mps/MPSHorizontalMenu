MPSHorizontalMenu
=================

A simple yet customizable Horizontal Menu for when you do not want to muck with UICollectionViews.

## Installation

If you're using CocoaPods, simply add the following line to your Podfile:

``` ruby
pod 'MPSHorizontalMenu'
```

If not then you will need to clone this project and add the files in the MPSHorizontalMenu folder to your project.  I suggest dropping this in a Vendor folder.  If you are git savvy then of course you can use a git submodule, but if you are that savvy then I doubt you read this sentence. ;)

## Example

![Screenshot](https://github.com/mps/MPSHorizontalMenu/blob/master/images/example.gif?raw=true)

## Usage

### Code

Using MPSHorizontalMenu is quite simple.  All you need to do is create one, add it to your view and then implement its Data Source and Delegate methods.  From there, everything behaves very similar to what you might be use to with a UITableView or UICollectionView.

For more an example, check out the example project included in this repository and file an issue if you run into any problems.

```objc
// Declare this somewhere in your interface
#import "MPSHorizontalMenu.h"

@property (nonatomic, strong) MPSHorizontalMenu *horizontalMenu;
@property (nonatomic, strong) NSMutableArray *menuItems;

// Implement this somewhere in your View Controller or custom View
self.menuItems = [@[ @"Menu Item 1", @"Menu Item 2", @"Menu Item 3", @"Menu Item 4", @"Menu Item 5"] mutableCopy];

self.horizontalMenu = [[MPSHorizontalMenu alloc] initWithFrame:CGRectMake(0, 44, self.view.frame.size.width, 41)];
self.horizontalMenu.itemSelectedBackgroundColor = [UIColor blueColor];
self.horizontalMenu.dataSource = self;
self.horizontalMenu.itemSelectedDelegate = self;
self.horizontalMenu.scrollsToTop = NO;
[self.horizontalMenu reloadData];
[self.horizontalMenu setSelectedIndex:0 animated:NO];
	
// Then implement the data source and delegate methods.

#pragma mark - MPSHorizontalMenuDataSource

- (int)numberOfItemsForMenu:(MPSHorizontalMenu *)horizontalMenu {
    return [self.menuItems count];
}

- (NSString*)horizontalMenu:(MPSHorizontalMenu *)horizontalMenu titleForItemAtIndex:(NSUInteger)index {
	return [self.menuItems objectAtIndex:index];
}

#pragma mark - MPSHorizontalMenuDelegate

-(void)horizontalMenu:(MPSHorizontalMenu *)horizontalMenu itemSelectedAtIndex:(NSUInteger)index {
	if ([self.menuItems count] == 0) return;
	// Do something when the index is changed.
}

```

## Customization

MPSHorizontalMenu can be customized in several ways.  You can customize the Button's Foreground and Background colors for both Normal and Selected states:

```objc
self.horizontalMenu.itemNormalBackgroundColor = [UIColor clearColor];
self.horizontalMenu.itemNormalForegroundColor = [UIColor whiteColor];
self.horizontalMenu.itemSelectedBackgroundColor = [UIColor blackColor];
self.horizontalMenu.itemSelectedForegroundColor = [UIColor greenColor];
```

The same is true for the menu's background color:

```objc
self.horizontalMenu.backgroundColor = [UIColor redColor];
```

## Credits

MPSHorizontalMenu is a port of [Mugunth Kumar's](http://twitter.com/mugunthkumar) [MKHorizMenu](https://github.com/MugunthKumar/MKHorizMenuDemo).  Special thanks to Mugunth for his blessing on upgrading his existing project.

## Contact

* [@strickland](https://twitter.com/strickland) on Twitter
* [@mps](https://github.com/mps) on Github
* <a href="mailTo:matthew@idlefusion.com">matthew@idlefusion.com</a>
* [http://mstrick.com](http://mstrick.com) My Blog

## License

See [LICENSE](https://github.com/mps/MPSHorizontalMenu/blob/master/LICENSE).
