Pod::Spec.new do |s|

  s.name         = "XYMobilePay"
  s.version      = "0.0.2"
  s.summary      = "微信、支付宝支付封装"
  s.description  = <<-DESC
                      私有Pods
                      微信、支付宝支付封装
                   DESC

  s.homepage     = "https://github.com/HuanYi/XYMobilePay"

  s.license      = "MIT"
  s.author             = { "HuanYi" => "1035175117@qq.com" }
  s.source       = { :git => "https://github.com/HuanYi/XYMobilePay.git", :tag => "#{s.version}" }

  s.platform     = :ios, "8.0"
  s.requires_arc = true
  s.source_files  = "XYPay/*"
  s.frameworks = "Foundation", "CoreGraphics", "UIKit"

  end



