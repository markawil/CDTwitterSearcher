//
//  CDTweet.m
//  MyTwitterSearcher
//
//  Created by Mark Wilkinson on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CDTweet.h"

@implementation CDTweet {
    
}

@synthesize author, text, profileImgUrl;

+ (CDTweet *)tweetWithDictionary:(NSDictionary *)dictionary {
    CDTweet *tweet = [[CDTweet alloc] init];
    tweet.author = [dictionary objectForKey:@"from_user"];
    tweet.text = [dictionary objectForKey:@"text"];
    tweet.profileImgUrl = [dictionary objectForKey:@"profile_image_url"];
    return [tweet autorelease];
}

- (void)dealloc {
    [author release];
    [text release];
    [profileImgUrl release];
    [super dealloc];
}
@end
