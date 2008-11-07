//
//  AKPreferenceController.h
//  Telephone
//
//  Copyright (c) 2008 Alexei Kuznetsov. All Rights Reserved.
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

#import <Cocoa/Cocoa.h>


// Keys for defaults

extern NSString *AKAccounts;
extern NSString *AKAccountSortOrder;
extern NSString *AKSTUNServerHost;
extern NSString *AKSTUNServerPort;
extern NSString *AKSTUNDomain;
extern NSString *AKLogFileName;
extern NSString *AKLogLevel;
extern NSString *AKConsoleLogLevel;
extern NSString *AKVoiceActivityDetection;
extern NSString *AKTransportPort;
extern NSString *AKSoundInput;
extern NSString *AKSoundOutput;

// Account keys
extern NSString *AKFullName;
extern NSString *AKSIPAddress;
extern NSString *AKRegistrar;
extern NSString *AKRealm;
extern NSString *AKUsername;
extern NSString *AKPassword;
extern NSString *AKAccountIndex;
extern NSString *AKAccountKey;
extern NSString *AKAccountEnabled;

@interface AKPreferenceController : NSWindowController {
@private
	id delegate;
	
	IBOutlet NSToolbar *toolbar;
	IBOutlet NSToolbarItem *generalToolbarItem;
	IBOutlet NSToolbarItem *accountsToolbarItem;
	IBOutlet NSView *generalView;
	IBOutlet NSView *accountsView;

	// General
	IBOutlet NSPopUpButton *soundInputPopUp;
	IBOutlet NSPopUpButton *soundOutputPopUp;
	
	// Account
	IBOutlet NSTableView *accountsTable;
	IBOutlet NSButton *accountEnabledCheckBox;
	IBOutlet NSTextField *fullName;
	IBOutlet NSTextField *SIPAddress;
	IBOutlet NSTextField *registrar;
	IBOutlet NSTextField *username;
	IBOutlet NSTextField *password;
	
	// Account Setup
	IBOutlet NSWindow *addAccountWindow;
	IBOutlet NSTextField *setupFullName;
	IBOutlet NSTextField *setupSIPAddress;
	IBOutlet NSTextField *setupRegistrar;
	IBOutlet NSTextField *setupUsername;
	IBOutlet NSTextField *setupPassword;
	IBOutlet NSButton *addAccountWindowDefaultButton;
	IBOutlet NSButton *addAccountWindowOtherButton;
}

@property(nonatomic, readwrite, assign) id delegate;
@property(nonatomic, readonly, retain) NSWindow *addAccountWindow;
@property(nonatomic, readonly, retain) NSButton *addAccountWindowDefaultButton;
@property(nonatomic, readonly, retain) NSButton *addAccountWindowOtherButton;

// Display view in Preferences window
- (void)displayView:(NSView *)aView withTitle:(NSString *)aTitle;

// Change view in Preferences window
- (IBAction)changeView:(id)sender;

// Raise a sheet which adds an account
- (IBAction)showAddAccountSheet:(id)sender;

// Close a sheet
- (IBAction)closeSheet:(id)sender;

// Add new account, save to defaults, send a notification
- (IBAction)addAccount:(id)sender;

- (IBAction)showRemoveAccountSheet:(id)sender;

// Remove account, save notification
- (void)removeAccountAtIndex:(NSInteger)index;

- (void)populateFieldsForAccountAtIndex:(NSUInteger)index;

- (IBAction)changeAccountEnabled:(id)sender;

// Change sound input and output devices
- (IBAction)changeSoundIO:(id)sender;

// Refresh list of available sound devices
- (void)updateSoundDevices;

@end

@interface NSObject(AKPreferenceControllerNotifications)
- (void)preferenceControllerDidAddAccount:(NSNotification *)notification;
- (void)preferenceControllerDidRemoveAccount:(NSNotification *)notification;
- (void)preferenceControllerDidChangeAccountEnabled:(NSNotification *)notification;
@end

// Notifications
extern NSString *AKPreferenceControllerDidAddAccountNotification;
extern NSString *AKPreferenceControllerDidRemoveAccountNotification; // AKAccountIndex
extern NSString *AKPreferenceControllerDidChangeAccountEnabledNotification; // AKAccountIndex, AKAccountEnabled
