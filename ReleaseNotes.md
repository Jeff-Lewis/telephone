### 0.15.2 ###
  * Fixed launch issue on Leopard.

### 0.15.1 ###
  * Support for 32 accounts.
  * Icon for all sizes.
  * Added 'Answer' menu item.
  * Updated to pjproject-1.8.5.
  * Fixed 'Request timeout' issue.
  * Fixed sound issue after wake-up.

### 0.15 ###
  * Call transfer.
  * Full 64-bit support on Intel platforms.
  * All features that have been added between pjproject-1.0.3 and pjproject-1.6.
  * More stable sending of DTMF signals.
  * Services menu support.
  * Fixed an issue with resuming tracks in iTunes.
  * Fixed an issue when it wasn’t possible to close preferences window after changing network settings.
  * Fixed an issue when it wasn’t possible to paste a new text into the call destination field.
  * Other small fixes and improvements.

### 0.14.3 ###
  * Fixed an issue with resuming iTunes on Snow Leopard.
  * Fixed an issue where Address Book plug-ins did not work on Snow Leopard.

### 0.14.2 ###
  * Voice Activity Detection is now disabled by default.
  * Fixed an issue in which a call could be accidentally redialed instead of hanging up.
  * Fixed an issue in which user name and password could not be updated when changing them through the authentication failure sheet.
  * Removed a confusing error message.

### 0.14.1 ###
  * Preconfigure application for your users.
  * Smarter reconnect on network changes.
  * Bug fixes.

### 0.14 ###
  * Pause iTunes during calls.
  * Redial.
  * Hang-up button.
  * Dock icon badges.
  * Simplified account setup.
  * Custom account names.
  * Option to close call windows automatically.
  * "Mic muted" does not disappear.
  * DNS SRV is enabled by default.
  * Automatically connect when network becomes available.
  * More responsive interface.

### 0.13.3 ###
  * Improved user interface.
  * Added Command-Return key equivalent for the Answer button.
  * Fixed an issue in which it wasn't possible to dial a number with “#” character.
  * Fixed an issue in which application could crash on startup.
  * Fixed an issue in which inappropriate style could be selected for the call destination token.

### 0.13.2 ###
  * Fixed sound issues on PowerPC Macs.

### 0.13.1 ###
  * Fixed an issue in which incorrect call destination could be selected when multiple phones and SIP addresses are present for the contact in the Address Book.

### 0.13 ###
  * Added Address Book plug-in.
  * Added support for sip: and tel: URLs.
  * Added SIP address support in the Address Book. Set custom label "sip" for email.
  * Added account reordering with drag and drop.
  * It is now possible to change account re-registration time.
  * Local SIP port can be changed in Preferences.

### 0.12.1 ###
  * Fixed an issue in which application could crash after entering digits in the call destination field.
  * Fixed an issue when application could crash on quit or computer sleep.
  * Fixed an issue in which a call could be muted or held at the inappropriate time.
  * Fixed typographical errors.

### 0.12 ###
  * Fixed sound issues on PowerPC Macs.
  * Improved responsiveness.
  * Added ringtone output control.
  * Added Call main menu item with Mute and Hold actions.
  * Added DNS SRV support (disabled by default).
  * More graceful application shutdown.
  * Fixed an issue in which no window became active after clicking the dock icon.
  * Fixed an issue in which ringtone could stop playing when there were multiple simultaneous incoming calls.
  * Fixed automatic completion issues.
  * Fixed memory leaks.
  * Fixed spelling errors.

### 0.11 ###
  * Better NAT traversal with ICE support.
  * Added address book name lookup for the incoming calls.
  * Fixed an issue in which an attempt to mute a call in a calling state could crash the application.
  * Fixed an issue in which Telephone could crash after enabling or disabling an account.
  * Fixed an issue where name from the address book was omitted in outgoing call after switching phone in the token menu.

### 0.10 ###
  * Added PowerPC support.
  * Added German localization (thanks to Jan-Kaspar Münnich and Daria Belyaeva).
  * Added custom ringtones support.
  * Added computer sleep and user switching support.
  * Added "+" substitution for arbitrary characters in case SIP provider does not suport it.
  * Added proxy support for each account.
  * Remote party should now hear ringback when Telephone notifies the user about incoming call.
  * Finder and  Dock now display localized application name.
  * Fixed an issue in which phone number in Growl notification could be formatted explicitly.

### 0.9 ###
  * Added Growl support.
  * Added outbound proxy support.
  * Added call hold (press H in the call window).
  * Added microphone mute (press M in the call window).
  * Chaged the way Telephone notifies the user about incoming call.
  * An alert is shown when symmetric NAT is detected.
  * Show DTMF digits entered by a user during a call.
  * Fixed an issue in which account window could not save its position on screen.
  * Fixed an issue in which some alert sheets could not be disposed properly in Russian localization.

### 0.8.6 ###
  * Russian localization refinements.

### 0.8.5 ###
  * Added internationalization support.
  * Added Russian localization.
  * Slightly improved interface responsiveness while adding an account and saving STUN server settings.
  * Fixed an issue in which account window could change its position after re-
enabling the account.
  * Fixed an issue in which re-enabled or newly added account window did not re-
appear after it had been closed and then the user clicked on the Dock icon.
  * Moved to pjproject-1.0.1.

### 0.8.4 ###
  * Fixed an issue in which it wasn't possible to switch text fields in preferences with the TAB key.

  * Fixed an issue in which changed account settings did not take place immediately
after enabling the account.

  * Fixed an issue when last account window always became a key window after clicking the dock icon.

### 0.8.3 ###
  * Added _Unavailable_ mode in which SIP user agent is not registered at the registry server.

  * _Offline_ mode now means truly offline. It is not possible to reach the account in offline mode even accessing it directly by its actual network address.

  * Registry server connection error sheet doesn't appear if periodic re-registration fails. Status changes to _Unavailable_, re-registration attempts will occur every 300 seconds.

  * Improved call window responsiveness when call status changes.

### 0.8.2 ###
Initial release.