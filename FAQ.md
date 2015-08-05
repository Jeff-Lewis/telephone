If your question is not listed here, feel free to ask in [Telephone Discussions](http://groups.google.com/group/telephone-app). If you ask here in comments, you won’t receive a notification about the answer.



## How to enable debug information ##
Quit Telephone, open Terminal and run:
```
$ defaults write com.tlphn.Telephone LogLevel -integer 4
```
Launch Telephone, reproduce the problem, quit Telephone, and examine the log file ~/Library/Logs/Telephone.log.

To set the default log level:
```
$ defaults delete com.tlphn.Telephone LogLevel
```

## Where is the log file? ##
~/Library/Logs/Telephone.log. It can be easily reached via the Console app. The log file is being overwritten every time Telephone starts.

## Another party hears echo ##
The most common reason is that another person’s voice from your headphones reaches your microphone. The worst case scenario here is to use internal speakers with the internal microphone. If you don’t have a headset, try to use any headphones with the internal mic. Closed headphones would be even better. But you can help Telephone significantly increase the sound quality using a decent headset. I suggest a USB headset.

## What headset can you recommend? ##
I’m using [Plantronics .Audio 750 DSP Stereo Headset](http://www.plantronics.com/north_america/en_US/products/computer/multi-use-headsets/audio-750-dsp) and very happy with it. I believe any Plantronics USB headset should produce good sound quality with Telephone. Don’t forget to check the compatibility with Mac OS X.

## How to send tone signals ##
Just press digits on the keyboard when the call window is active. Asterisk (`*`) and number sign (#) are also allowed.

## Why sending tone signals isn’t working? ##
When calling regular phones, sending tone singnals must be supported by the VoIP gateway. If the gateway does not support well-known standards (RFC 2833 or SIP INFO DTMF), the signals will not be sent.

## How to place a call on hold ##
Press H in the active call window.

## How to mute the microphone during a call ##
Press M in the active call window.

## How to close missed call windows automatically ##
```
$ defaults write com.tlphn.Telephone AutoCloseMissedCallWindow -bool YES
```

## Where can I store SIP addresses? ##
You can save SIP addresses (user@example.com) in Address Book as an email with the custom label “sip”. Telephone autocompletes such addresses and Address Book plug-in shows “Dial with Telephone” for them.<br />
![http://telephone.googlecode.com/svn/site/address-book-card.png](http://telephone.googlecode.com/svn/site/address-book-card.png)

## What are supported codecs? ##
  * G.711 family codec (PCMA, PCMU);
  * Speex/8000 (narrowband), Speex/16000 (wideband), and Speex/32000 (ultra-wideband);
  * iLBC;
  * GSM;
  * L16 family of codecs.

## How to enable voice activity detection ##
```
$ defaults write com.tlphn.Telephone VoiceActivityDetection -bool YES
```

## Timeout connecting to Asterisk behind VPN ##
Try setting “nat = yes” in Asterisk to reply to the actual IP address the request came from. (With “nat = no” Asterisk sends the reply to the address from the Contact field.)

Another approach is to set your public address for SIP manually:
```
$ defaults write com.tlphn.Telephone TransportPublicHost <IP address or host name>
```
But if your VPN server doesn’t assign you the same IP address every time you get connected, this could be inconvenient.

## I’m getting ‘423 Interval Too Brief’ ##
You should increase the re-registration time interval in the advanced account settings according to your registry server configuration. If you’re not sure what the proper value is, try 600, 1200, or 1800.