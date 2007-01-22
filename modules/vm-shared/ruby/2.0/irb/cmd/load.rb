#
#   load.rb - 
#   	$Release Version: 0.9.5$
#   	$Revision: 1.2 $
#   	$Date: 2005/04/13 15:27:08 $
#   	by Keiju ISHITSUKA(keiju@ruby-lang.org)
#
# --
#
#   
#

require "irb/cmd/nop.rb"
require "irb/ext/loader"

module IRB
  module ExtendCommand
    class Load<Nop
      include IrbLoader

      def execute(file_name, priv = nil)
#	return ruby_load(file_name) unless IRB.conf[:USE_LOADER]
	return irb_load(file_name, priv)
      end
    end

    class Require<Nop
      include IrbLoader
      
      def execute(file_name)
#	return ruby_require(file_name) unless IRB.conf[:USE_LOADER]

	rex = Regexp.new("#{Regexp.quote(file_name)}(\.o|\.rb)?")
	return false if $".find{|f| f =~ rex}

	case file_name
	when /\.rb$/
	  begin
	    if irb_load(file_name)
	      $".push file_name
	      return true
	    end
	  rescue LoadError
	  end
	when /\.(so|o|sl)$/
	  return ruby_require(file_name)
	end
	
	begin
	  irb_load(f = file_name + ".rb")
	  $".push f
	  return true
	rescue LoadError
	  return ruby_require(file_name)
	end
      end
    end

    class Source<Nop
      include IrbLoader
      def execute(file_name)
	source_file(file_name)
      end
    end
  end

end
