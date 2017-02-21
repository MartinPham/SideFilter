Nero10
=====
Another iOS little tweak, allows Filtering apps in Sidebar. Support iOS 9, 10

1) Install

Add Cydia repo http://martinpham.gitlab.io/cydia then search TouchHome

or

Use [DEB file](/packages/) to install.

2) Build

``make package``

3) Build & Run

Change IP & Port of your device's SSH in ``Makefile`` file
``THEOS_DEVICE_IP = 127.0.0.1``
``THEOS_DEVICE_PORT = 2222``

``make package install``