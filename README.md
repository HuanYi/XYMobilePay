# XYMobilePay
简单支付封装

1、依赖的库:
CFNetwork.framework
SystemConfiguration.framework
Security.framework
QuartzCore.framework
CoreTelephony.framework
CoreMotion.framework
libc++.tbd
libz.tbd
libsqlite3.0.tbd
libstdc++.tbd

2、设置url Schemes
2.1添加URL Schemes：在 Xcode 中，选择你的工程设置项，选中 "TARGETS" 一栏，在 "Info" 标签栏的 "URL Types" 添加 "URL Schemes"，如果使用微信，务必填入所注册的微信应用程序id(例如：wx2345678)，如果不使用微信，则自定义，允许英文字母和数字，首字母必须是英文字母，建议起名稍复杂一些，尽量避免与其他程序冲突。
2.2添加 Other Linker Flags：在 Build Settings 搜索 Other Linker Flags ，添加 -ObjC



3、适配iOS 9及以上系统注意事项
iOS 9 以上系统版本如果需要使用支付宝和微信渠道，需要在 Info.plist 里添加如下代码：

<key>LSApplicationQueriesSchemes</key>
<array>
<string>weixin</string>
<string>wechat</string>
<string>alipay</string>
<string>alipays</string>
</array>

针对 iOS 9 及以上系统的限制 http 协议的访问，如果 App 需要访问 http:
//， 则需要在 Info.plist 添加如下代码:
<key>NSAppTransportSecurity</key>
<dict>
<key>NSAllowsArbitraryLoads</key>
<true/>
</dict>
