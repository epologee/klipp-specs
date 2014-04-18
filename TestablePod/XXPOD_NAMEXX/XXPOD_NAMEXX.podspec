Pod::Spec.new do |s|
  s.name             = "XXPOD_NAMEXX"
  s.version          = "0.1.0"
  s.summary          = "A short description of XXPOD_NAMEXX."
  s.description      = <<-DESC
                       An optional longer description of XXPOD_NAMEXX

                       * Markdown format.
                       * Don't worry about the indent, we strip it!
                       DESC
  s.homepage         = "https://github.com/XXGITHUB_ACCOUNTXX/XXPOD_NAMEXX"
  s.license          = 'Unlicense'
  s.author           = { "Eric-Paul Lecluse" => "e@epologee.com" }
  s.source           = { :git => "https://github.com/XXGITHUB_ACCOUNTXX/XXPOD_NAMEXX.git", :tag => s.version.to_s }s
  s.social_media_url = 'https://twitter.com/EXAMPLE'

  # s.platform     = :ios, '5.0'
  # s.ios.deployment_target = '5.0'
  # s.osx.deployment_target = '10.7'
  s.requires_arc = true

  s.source_files = 'Classes'
  s.resources = 'Assets/*.png'

  s.ios.exclude_files = 'Classes/osx'
  s.osx.exclude_files = 'Classes/ios'
  # s.public_header_files = 'Classes/**/*.h'
  # s.frameworks = 'SomeFramework', 'AnotherFramework'
  # s.dependency 'JSONKit', '~> 1.4'
end
