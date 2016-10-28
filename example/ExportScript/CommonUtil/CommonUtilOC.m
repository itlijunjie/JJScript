//
//  CommonUtilOC.m
//  CommonUtil
//
//  Created by lijunjie on 24/10/2016.
//  Copyright © 2016 GagSquad. All rights reserved.
//

#import "CommonUtilOC.h"
#import <CommonUtil/CommonUtil-Swift.h>

@implementation CommonUtilOC
- (instancetype)init
{
    self = [super init];
    if (self) {
#ifdef DEBUG
        NSLog(@"CommonUtilOC Debug");
#else
        NSLog(@"CommonUtilOC not Debug");
#endif
    }
    return self;
}
@end
