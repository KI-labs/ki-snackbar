Pod::Spec.new do |s|
  s.name         = "KISnackBar"
  s.version      = "1.0.0"
  s.summary      = "A snackbar component for iOS from KI labs."
  s.description  = <<-DESC
  Snackbars provide brief messages about app processes at the bottom of the screen. 
  This is an easy to use alternative of Android snackbar for iOS.
                   DESC

  s.homepage     = "https://github.com/KI-labs/ki-snackbar-dev/"
  s.screenshots  = "https://github.com/KI-labs/ki-snackbar-dev/blob/master/KISnackBar.gif"

  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = "KI labs GmbH"
  s.social_media_url   = "https://twitter.com/ki_labs_hq"
  s.platform     = :ios, "10.0"

  # s.source       = { :git => "https://github.com/KI-labs/ki-snackbar-dev.git", :tag => s.version }
  s.source       = { :path => "." }

  s.source_files  = "KISnackBar"
  

  s.framework  = "UIKit"
  s.requires_arc = true
end
