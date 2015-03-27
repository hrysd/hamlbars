require 'thor'
require 'hamlbars'

module Hamlbars
  class CLI < Thor
    desc 'compile [INPUT] [OUTPUT]', 'Compile hamlbars template'
    def compile(input, output=nil)
      require 'tilt'

      Tilt.register Hamlbars::Template, 'hamlbars'

      if output.nil?
        say engine.new(input).render(self)
      end
    end

    desc 'version', 'Print Hamlbars version'
    def version
      say "version #{Hamlbars::VERSION}"
    end

    private

    def engine
      Tilt['hamlbars']
    end
  end
end
