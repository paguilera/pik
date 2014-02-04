
module Pik
  
  module Packages
    
    extend self

    def [](key)
      PACKAGES[key]
    end

    PACKAGES = {
      "sqlite"=>{:url=>"http://www.sqlite.org/sqlite-dll-win32-x86-3070400.zip"},
      "devkit"=>{:url=>"http://cdn.rubyinstaller.org/archives/devkits/DevKit-tdm-32-4.5.1-20101214-1400-sfx.exe"},
      "7zip"=>{:url=>"http://downloads.sourceforge.net/sevenzip/7za920.zip"},
      "ansicon"=>{:url=>"http://adoxa.110mb.com/ansicon/ansi132.zip"}
    }
    
  end

  module Rubies
    extend VersionPattern
    extend self

    RUBIES = [
      ["ironruby-1.0.0",
        {:implementation=>"IronRuby",
         :filename=>"ironruby-1.0.0.zip",
         :url=>
          "http://download.codeplex.com/Project/Download/FileDownload.aspx?ProjectName=ironruby&DownloadId=116525&FileTime=129155864456030000&Build=17501"}],
      ["ironruby-1.1.0",
        {:implementation=>"IronRuby",
         :filename=>"ironruby-1.1.0.zip",
         :url=>
          "http://download.codeplex.com/Project/Download/FileDownload.aspx?ProjectName=ironruby&DownloadId=133275&FileTime=129238225220270000&Build=17501"}],
      ["ironruby[-1.1.1]",
        {:implementation=>"IronRuby",
         :filename=>"ironruby-1.1.1.zip",
         :url=>
          "http://download.codeplex.com/Project/Download/FileDownload.aspx?ProjectName=ironruby&DownloadId=159562&FileTime=129321656827500000&Build=17501"}],
      ["jruby[-1.5.6]",
        {:implementation=>"JRuby",
         :url=>
          "http://jruby.org.s3.amazonaws.com/downloads/1.5.6/jruby-bin-1.5.6.zip"}],
      ["jruby-1.6.0.RC1",
        {:implementation=>"JRuby",
         :url=>
          "http://jruby.org.s3.amazonaws.com/downloads/1.6.0.RC1/jruby-bin-1.6.0.RC1.zip"}],
      ["jruby-1.6.0.RC2",
        {:implementation=>"JRuby",
         :url=>
          "http://jruby.org.s3.amazonaws.com/downloads/1.6.0.RC2/jruby-bin-1.6.0.RC2.zip"}],   
      ["[ruby-]1.8.7-p302",
        {:implementation=>"MRI Ruby",
         :url=>
          "http://rubyforge.org/frs/download.php/72087/ruby-1.8.7-p302-i386-mingw32.7z"}],
      ["[ruby-]1.8.7-p330",
        {:implementation=>"MRI Ruby",
         :url=>
          "http://rubyforge.org/frs/download.php/73720/ruby-1.8.7-p330-i386-mingw32.7z"}],
      ["[ruby-]1.8.7[-p334]",
        {:implementation=>"MRI Ruby",
         :url=>
          "http://rubyforge.org/frs/download.php/74296/ruby-1.8.7-p334-i386-mingw32.7z"}],
      ["[ruby-]1.9.1[-p430]",
        {:implementation=>"MRI Ruby",
         :url=>
          "http://rubyforge.org/frs/download.php/72076/ruby-1.9.1-p430-i386-mingw32.7z"}],
      ["[ruby-]1.9.2-p0",
        {:implementation=>"MRI Ruby",
         :url=>
          "http://rubyforge.org/frs/download.php/72160/ruby-1.9.2-p0-i386-mingw32.7z"}],
      ["[ruby-]1.9.2-p136",
        {:implementation=>"MRI Ruby",
         :url=>
          "http://rubyforge.org/frs/download.php/73723/ruby-1.9.2-p136-i386-mingw32.7z"}],
      ["[ruby-]1.9.2[-p180]",
        {:implementation=>"MRI Ruby",
         :url=>
          "http://rubyforge.org/frs/download.php/74299/ruby-1.9.2-p180-i386-mingw32.7z"}],
      ["[ruby-]1.9.3[-p484]",
        {:implementation=>"MRI Ruby",
         :url=>
          "http://dl.bintray.com/oneclick/rubyinstaller/ruby-1.9.3-p484-i386-mingw32.7z"}],
      ["[ruby-]2.0.0[-p353-i386]",
        {:implementation=>"MRI Ruby",
         :url=>
          "http://dl.bintray.com/oneclick/rubyinstaller/ruby-2.0.0-p353-i386-mingw32.7z"}],
      ["[ruby-]2.0.0-p353-x64",
        {:implementation=>"MRI Ruby",
         :url=>
          "http://dl.bintray.com/oneclick/rubyinstaller/ruby-2.0.0-p353-x64-mingw32.7z"}]
          
    ]

    def rubies 
      RUBIES
    end

    def list
      h = Hash.new{|h,k| h[k] = [] }
      rubies.each{|name,data| h[data[:implementation]] << name  }
      h
    end
    
    def [](key)
      found = all_rubies.find{|names, data| names.include? key }
      found.last if found
    end

    def all_rubies
      return @all_rubies if @all_rubies
      @all_rubies = {}
      rubies.each do |name, data| 
        names = parse(name)
        @all_rubies[names] = data.merge!(:name => full(name), :pattern => name)
      end
      @all_rubies  
    end

  end
  
end