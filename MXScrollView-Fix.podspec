Pod::Spec.new do |s|  
  s.name         = 'MXScrollView-Fix'
  s.version      = '1.3.0'
  s.summary      = 'The use of a simple with the effects of the rolling cycle view'
  s.homepage     = 'https://github.com/ToBeDefined/MXScrollView'
  s.license      = 'MIT'
  s.authors      = {'TBD' => 'weinanshao@163.com'}
  s.platform     = :ios, '6.0'
  s.source       = {:git => 'https://github.com/ToBeDefined/MXScrollView.git', :tag => s.version }
  s.source_files = 'MXScrollView/**/*.{h,m}'
  s.resource     = 'MXScrollView/MXScrollView.bundle'
  s.requires_arc = true
end  
