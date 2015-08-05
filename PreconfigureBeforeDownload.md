# Introduction #

Telephone can be preconfigured before user launches it. You can include an XML [property list](http://en.wikipedia.org/wiki/Property_list) file with settings which will be imported on first launch.


# Details #

Applications in Mac OS X are really directories called bundles. All you need to preconfigure Telephone is to generate an XML file named _Settings.plist_ and copy it into _Telephone.app/Contents/Resources_ directory. Then you archive the whole Telephone.app directory and deliver it to a user. When a user unarchives and launches it, settings from _Settings.plist_ are imported to the standard user defaults database, password is securely stored in Keychain, and _Settings.plist_ file is removed.

```
Telephone.app/
    ...
    Contents/
        Resources/
            ...
            Settings.plist
            ...
    ...
```

Here's the minimum you need to setup an account.

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Accounts</key>
	<array>
		<dict>
			<key>AccountEnabled</key>
			<true/>
			<key>Domain</key>
			<string>example.com</string>
			<key>FullName</key>
			<string>John Smith</string>
			<key>Realm</key>
			<string>*</string>
			<key>Username</key>
			<string>1234567</string>
			<key>Password</key>
			<string>secret</string>
		</dict>
	</array>
</dict>
</plist>
```

The easiest way to make your own template for Settings.plist is with Apple's Property List Editor application. It is part of Developer Tools package which comes with every Mac OS X installation disc. However, you can use any text editor you like.

The following table shows two accounts and some other settings configured.

```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Accounts</key>
	<array>
		<dict>
			<key>AccountEnabled</key>
			<true/>
			<key>Description</key>
			<string>The First Provider</string>
			<key>Domain</key>
			<string>example.com</string>
			<key>FullName</key>
			<string>John Smith</string>
			<key>PlusCharacterSubstitutionString</key>
			<string>00</string>
			<key>ProxyHost</key>
			<string></string>
			<key>ProxyPort</key>
			<integer>0</integer>
			<key>Realm</key>
			<string>*</string>
			<key>Registrar</key>
			<string></string>
			<key>ReregistrationTime</key>
			<integer>0</integer>
			<key>SIPAddress</key>
			<string></string>
			<key>SubstitutePlusCharacter</key>
			<false/>
			<key>UseProxy</key>
			<false/>
			<key>Username</key>
			<string>1234567</string>
			<key>Password</key>
			<string>secret1</string>
		</dict>
		<dict>
			<key>AccountEnabled</key>
			<true/>
			<key>Description</key>
			<string>The Second Provider</string>
			<key>Domain</key>
			<string>company.com</string>
			<key>FullName</key>
			<string>John Smith</string>
			<key>PlusCharacterSubstitutionString</key>
			<string></string>
			<key>ProxyHost</key>
			<string>sip.company.com</string>
			<key>ProxyPort</key>
			<integer>0</integer>
			<key>Realm</key>
			<string>*</string>
			<key>Registrar</key>
			<string></string>
			<key>ReregistrationTime</key>
			<integer>1800</integer>
			<key>SIPAddress</key>
			<string>john@company.com</string>
			<key>SubstitutePlusCharacter</key>
			<true/>
			<key>UseProxy</key>
			<true/>
			<key>Username</key>
			<string>john</string>
			<key>Password</key>
			<string>secret2</string>
		</dict>
	</array>
	<key>ConsoleLogLevel</key>
	<integer>3</integer>
	<key>LogLevel</key>
	<integer>4</integer>
	<key>STUNServerHost</key>
	<string>stun.example.com</string>
	<key>STUNServerPort</key>
	<integer>0</integer>
	<key>TransportPort</key>
	<integer>5060</integer>
	<key>UseDNSSRV</key>
	<true/>
	<key>UseICE</key>
	<true/>
	<key>VoiceActivityDetection</key>
	<false/>
</dict>
</plist>

```