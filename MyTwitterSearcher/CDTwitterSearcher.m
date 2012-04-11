//
//  CDTwitterSearcher.m
//  MyTwitterSearcher
//
//  Created by Mark Wilkinson on 4/9/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CDTwitterSearcher.h"
#import "ASIHTTPRequest.h"
#import "CDTweet.h"
#import "SBJson.h"

@implementation CDTwitterSearcher

@synthesize delegate;

- (NSString *)encodeQuery:(NSString *)inputString {
    return [inputString 
            stringByAddingPercentEscapesUsingEncoding:
            NSUTF8StringEncoding];
}

- (void)searchTwitter:(NSString *)searchTerm {
    // do the search
    
    NSString *formattedQuery = [self encodeQuery:searchTerm];
    NSString *urlString = [NSString stringWithFormat:@"http://search.twitter.com/search.json?q=%@",
                           formattedQuery];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
    request.delegate = self;
    [request startAsynchronous];
}

- (void)requestStarted:(ASIHTTPRequest *)request {
    NSLog(@"Started %@ request for %@", 
          request.requestMethod, 
          request.url);
}

- (void)requestFinished:(ASIHTTPRequest *)request {
    NSLog(@"Received HTTP %d from %@", 
          request.responseStatusCode,
          request.url);
    NSLog(@"Response body: %@", request.responseString);

    if (request.responseStatusCode == 200) {
        //parse the JSON string
        NSString *jsonResponse = [request responseString];
        NSDictionary *jsonDictionary = [jsonResponse JSONValue];
        
        // create an array to hold the tweets
        NSArray *results = [jsonDictionary objectForKey:@"results"];
        NSMutableArray *tweets = [NSMutableArray array];
        
        // build a tweet object and add it to the array
        for (id result in results) {
            [tweets addObject:[CDTweet tweetWithDictionary:result]];
        }
        
        // Notify the delegate
        [self.delegate searchDidCompleteWithResults:tweets];
    }
    else {
        // FUTURE TO-DO Notify of invalid response
    }
}

- (void)requestFailed:(ASIHTTPRequest *)request {
    NSLog(@"Request failed for %@.  The error was: %@", 
          request.url,
          request.error);
    //FUTURE:  notify delegate of connection issue
}
@end
