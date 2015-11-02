Pod::Spec.new do |s|
  s.name             = "KeepBackgroundCell"
  s.version          = "0.1.0"
  s.summary          = "Prevent UITableViewCell from making subviews transparent on selection and highlight"
  s.description      = <<-DESC
          Whenever a UITableViewCell is selected or highlighted, it automatically sets the 
          backgroundColors of all its subviews to transparent. This makes sense for many views,
          such as UILabels to allow the selectedBackgroundView to show through inbetween the
          individual letters.

          However with custom views, there are many cases where the backgroundColor should be 
          maintained on selection of highlighting of the cell.

          KeepBackgroundCell provides a way to turn of this transparency "feature" on individual 
          UITableViewCells.
                       DESC

  s.homepage         = "https://github.com/timbodeit/KeepBackgroundCell"
  s.license          = 'MIT'
  s.author           = { "Tim Bodeit" => "tim@bodeit.com" }
  s.source           = { :git => "https://github.com/timbodeit/KeepBackgroundCell.git", :tag => s.version.to_s }

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
end
