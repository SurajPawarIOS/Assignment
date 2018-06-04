//
//  NSString+AlertMessages.m
//  Assignment
//
//  Created by Suraj Pawar on 02/06/18.
//  Copyright © 2018 Suraj Pawar. All rights reserved.
//

#import "NSString+AlertMessages.h"

@implementation NSString (AlertMessages)


#pragma mark - *** Alert Buttons ***

+(NSString*)okButton {
    return @"OK";
}

#pragma mark - *** Alert Titles ***

+(NSString*)networkError {
    return @"Network Error";
}

#pragma mark - *** Alert Messages ***

+(NSString*)networkErrorMessage {
    return @"Please check network connection.";
}

@end
