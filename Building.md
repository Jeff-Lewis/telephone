You need [Mercurial](http://mercurial.selenic.com/) to get Telephone sources. If you’re running Mac OS X 10.6.5 on an Intel Mac, you should be able to build Telephone without any modifications to the Xcode project.
```
$ hg clone https://telephone.googlecode.com/hg/ Telephone
```

Telephone depends on  [pjproject](http://www.pjsip.org/).
```
$ svn checkout http://svn.pjsip.org/repos/pjproject/tags/1.6 pjproject
$ cd pjproject
$ CFLAGS="-O2 -arch i386 -arch x86_64 -arch ppc" LDFLAGS="-arch i386 -arch x86_64 -arch ppc" ./configure --disable-ssl
$ make
```

Open Telephone.xcodeproj in Xcode.