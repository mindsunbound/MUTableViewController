Pod::Spec.new do |s|
  s.name         = 'MUTableViewController'
  s.version      = '0.9.0'
  s.summary      =  'MUTableViewController is a set of classes that helps separate model logic from view logic.'
  s.authors      = {'Jonah Neugass' => 'admin@mindsunbound.com'}
  s.homepage     = 'https://github.com/mindsunbound/MUTableViewController'
  s.license      = { :type => 'Apache License, Version 2.0', :file => 'LICENSE' }
  s.author       = { 'mindsunbound' => 'admin@mindsunbound.com'}
  s.source       = { :git => 'https://github.com/mindsunbound/MUTableViewController.git', :tag => '0.9.0' }
  s.platform     = :ios, '6.0'
  s.source_files = 'MUTableViewController', 'MUTableViewController/**/*.{h,m}'
  s.requires_arc = true
  s.dependency 'AFNetworking', '~> 1.0'
end
