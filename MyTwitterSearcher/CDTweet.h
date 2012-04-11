//
//  CDTweet.h
//  MyTwitterSearcher
//
//  Created by Mark Wilkinson on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CDTweet : NSObject {
    
}

@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *text;
@property (nonatomic, copy) NSString *profileImgUrl;

+ (CDTweet *)tweetWithDictionary:(NSDictionary *)dictionary;

@end
