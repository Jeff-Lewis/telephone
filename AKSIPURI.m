//
//  AKSIPURI.m
//  Telephone
//
//  Copyright (c) 2008-2009 Alexei Kuznetsov. All rights reserved.
//
//  Redistribution and use in source and binary forms, with or without
//  modification, are permitted provided that the following conditions are met:
//  1. Redistributions of source code must retain the above copyright notice,
//     this list of conditions and the following disclaimer.
//  2. Redistributions in binary form must reproduce the above copyright notice,
//     this list of conditions and the following disclaimer in the documentation
//     and/or other materials provided with the distribution.
//  3. The name of the author may not be used to endorse or promote products
//     derived from this software without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY ALEXEI KUZNETSOV "AS IS" AND ANY EXPRESS
//  OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
//  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
//  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
//  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
//  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
//  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
//  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
//  OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
//  EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//

#import <pjsua-lib/pjsua.h>

#import "AKSIPURI.h"
#import "AKTelephone.h"
#import "NSStringAdditions.h"


@implementation AKSIPURI

@dynamic SIPAddress;
@synthesize displayName;
@synthesize user;
@synthesize password;
@synthesize host;
@synthesize port;
@synthesize userParameter;
@synthesize methodParameter;
@synthesize transportParameter;
@synthesize TTLParameter;
@synthesize looseRoutingParameter;
@synthesize maddrParameter;

- (NSString *)SIPAddress
{
	if ([[self user] length] > 0)
		return [NSString stringWithFormat:@"%@@%@", [self user], [self host]];
	else
		return [self host];
}

#pragma mark -

+ (id)SIPURIWithUser:(NSString *)aUser host:(NSString *)aHost displayName:(NSString *)aDisplayName
{
	return [[[self alloc] initWithUser:aUser host:aHost displayName:aDisplayName] autorelease];
}

+ (id)SIPURIWithString:(NSString *)SIPURIString
{
	return [[[self alloc] initWithString:SIPURIString] autorelease];
}

// Designated initializer.
- (id)initWithUser:(NSString *)aUser host:(NSString *)aHost displayName:(NSString *)aDisplayName
{
	self = [super init];
	if (self == nil)
		return nil;
	
	[self setDisplayName:aDisplayName];
	[self setUser:aUser];
	[self setPassword:nil];
	[self setHost:aHost];
	[self setPort:0];
	[self setUserParameter:nil];
	[self setMethodParameter:nil];
	[self setTransportParameter:nil];
	[self setTTLParameter:0];
	[self setLooseRoutingParameter:0];
	[self setMaddrParameter:nil];
	
	return self;
}

- (id)init
{
	return [self initWithUser:nil host:nil displayName:nil];
}

- (id)initWithString:(NSString *)SIPURIString
{
	[self init];
	if (self == nil)
		return nil;

	NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES '.+\\\\s<sip:(.+@)?.+>'"];
	if ([predicate evaluateWithObject:SIPURIString]) {
		NSRange delimiterRange = [SIPURIString rangeOfString:@" <"];
		
		NSMutableCharacterSet *trimmingCharacterSet = [[NSCharacterSet whitespaceCharacterSet] mutableCopy];
		[trimmingCharacterSet addCharactersInString:@"\""];
		[self setDisplayName:[[SIPURIString substringToIndex:delimiterRange.location]
							  stringByTrimmingCharactersInSet:trimmingCharacterSet]];
		[trimmingCharacterSet release];
		
		NSRange userAndHostRange = [SIPURIString rangeOfString:@"<sip:" options:NSCaseInsensitiveSearch];
		userAndHostRange.location += 5;
		userAndHostRange.length = [SIPURIString length] - userAndHostRange.location - 1;
		NSString *userAndHost = [SIPURIString substringWithRange:userAndHostRange];
		
		NSRange atSignRange = [userAndHost rangeOfString:@"@" options:NSBackwardsSearch];
		if (atSignRange.location != NSNotFound) {
			[self setUser:[userAndHost substringToIndex:atSignRange.location]];
			[self setHost:[userAndHost substringFromIndex:(atSignRange.location + 1)]];
		} else
			[self setHost:userAndHost];
		
		return self;
	}

	if (![[AKTelephone sharedTelephone] started]) {
		[self release];
		return nil;
	}
	
	pjsip_name_addr *nameAddr;
	nameAddr = (pjsip_name_addr *)pjsip_parse_uri([[AKTelephone sharedTelephone] pjPool],
												  (char *)[SIPURIString cStringUsingEncoding:NSUTF8StringEncoding],
												  [SIPURIString length], PJSIP_PARSE_URI_AS_NAMEADDR);
	if (nameAddr == NULL) {
		[self release];
		return nil;
	}
	
	[self setDisplayName:[NSString stringWithPJString:nameAddr->display]];
	
	pjsip_sip_uri *uri = (pjsip_sip_uri *)pjsip_uri_get_uri(nameAddr);
	[self setUser:[NSString stringWithPJString:uri->user]];
	[self setPassword:[NSString stringWithPJString:uri->passwd]];
	[self setHost:[NSString stringWithPJString:uri->host]];
	[self setPort:uri->port];
	[self setUserParameter:[NSString stringWithPJString:uri->user_param]];
	[self setMethodParameter:[NSString stringWithPJString:uri->method_param]];
	[self setTransportParameter:[NSString stringWithPJString:uri->transport_param]];
	[self setTTLParameter:uri->ttl_param];
	[self setLooseRoutingParameter:uri->lr_param];
	[self setMaddrParameter:[NSString stringWithPJString:uri->maddr_param]];
	
	return self;
}

- (void)dealloc
{
	[displayName release];
	[user release];
	[password release];
	[host release];
	[userParameter release];
	[methodParameter release];
	[transportParameter release];
	[maddrParameter release];
	
	[super dealloc];
}

- (NSString *)description
{
	if ([[self displayName] length] > 0)
		return [NSString stringWithFormat:@"\"%@\" <sip:%@>", [self displayName], [self SIPAddress]];
	else
		return [NSString stringWithFormat:@"<sip:%@>", [self SIPAddress]];
}


#pragma mark -
#pragma mark NSCopying protocol

- (id)copyWithZone:(NSZone *)zone
{
	AKSIPURI *newURI = [[AKSIPURI allocWithZone:zone] initWithUser:[self user]
															  host:[self host]
													   displayName:[self displayName]];
	[newURI setPassword:[self password]];
	[newURI setPort:[self port]];
	[newURI setUserParameter:[self userParameter]];
	[newURI setMethodParameter:[self methodParameter]];
	[newURI setTransportParameter:[self transportParameter]];
	[newURI setTTLParameter:[self TTLParameter]];
	[newURI setLooseRoutingParameter:[self looseRoutingParameter]];
	[newURI setMaddrParameter:[self maddrParameter]];
	
	return newURI;
}

@end
