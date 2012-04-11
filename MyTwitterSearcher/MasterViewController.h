//
//  MasterViewController.h
//  MyTwitterSearcher
//
//  Created by Mark Wilkinson on 4/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CDTwitterSearcher.h"
@class DetailViewController;

@interface MasterViewController : UITableViewController
<UISearchBarDelegate, CDTwitterSearchDelegate> {
    CDTwitterSearcher *_twitterSearcher;
    NSArray *_tweets;
}

@property (strong, nonatomic) DetailViewController *detailViewController;

@property (nonatomic, retain) IBOutlet UISearchBar *searchbar;

@end
