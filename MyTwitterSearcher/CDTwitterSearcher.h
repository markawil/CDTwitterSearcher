//
//  CDTwitterSearcher.h
//  MyTwitterSearcher
//
//  Created by Mark Wilkinson on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequestDelegate.h"

// define our protocol
@protocol CDTwitterSearchDelegate <NSObject>

@required

- (void)searchDidCompleteWithResults:(NSArray *)results;

@end

@interface CDTwitterSearcher : NSObject<ASIHTTPRequestDelegate> {
    
}

@property (nonatomic, assign) id<CDTwitterSearchDelegate> delegate;

- (void)searchTwitter:(NSString *)searchTerm;

@end
