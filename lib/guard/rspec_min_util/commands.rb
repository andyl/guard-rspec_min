module Guard
  module RspecMinUtil
    class Commands

      RS_GRP = "RSpec"

      def self.command_set
        Pry::CommandSet.new do

          helpers do
            def rs_opts
              @rs_opts ||= ::Guard.guards(:rspecmin).first.options
            end

            def regx(args)
              input = Array(args)
              if input.blank?
                /X/
              else
                search = input.map do |string|
                  int_reg = string.split(//).map do |c|
                    c == '/' ? '\\/.*' : "#{c}.*"
                  end.join
                  ".*#{int_reg}"
                end.join('|')
                /#{search}/
              end
            end

            def dir_paths
              Dir.glob("spec/**/*").select {|x| File.directory?(x) || File.file?(x)}
            end

            def match_paths(args)
              dir_paths.select {|path| path.match regx(args)}
            end
          end

          create_command 'rp' do
            group       RS_GRP
            description "Rspec: update the spec Path"
            def process(*args)
              if args == []
                rs_opts[:specs] = ["spec"]
              else
                rs_opts[:specs] = match_paths(args)
              end
              paths = "[#{rs_opts[:specs].join(', ')}]".yellow
              output.puts " > RspecPaths has been set to #{paths}"
            end
          end

          create_command 'rt' do
            group RS_GRP
            description "Rspec: set spec Tags"
            def process(*args)
              rs_opts[:tags] = args
              tags = "[#{rs_opts[:tags].join(', ')}]".yellow
              output.puts " > RspecTags has been set to #{tags}"
            end
          end

          create_command 'rp' do
            group RS_GRP
            description "Rspec: show status prompt"
            def process
              ::Guard::RspecMinUtil::Commands.prompt
            end
          end

          create_command 'rd' do
            group RS_GRP
            description "Rspec: show list of all spec Directories"
            def process
              dirs  = Dir.glob('spec/**/*').select {|x| File.directory? x}
              paths = "[#{dirs.join(' ')}]".yellow
              output.puts " > RspecDirectories are #{paths}"
            end
          end

          create_command 'rp+' do
            group RS_GRP
            description "Rspec: profiling on"
            def process
              rs_opts[:cmd] = rs_opts[:cmd].gsub(' -p 3','') + " -p 3"
              output.puts " > Rspec profiling has been turned #{"On".yellow}"
            end
          end

          create_command 'rp-' do
            group RS_GRP
            description "Rspec: profiling off"
            def process
              rs_opts[:cmd] = rs_opts[:cmd].gsub(' -p 3','')
              output.puts " > Rspec profiling has been turned #{"Off".yellow}"
            end
          end
        end
      end

      def self.prompt
        opts  = ::Guard.guards(:rspecmin).first.options
        specs = "[#{opts[:specs].join(', ')}]".yellow
        tags  = "[#{opts[:tags].join(', ')}]".yellow
        msg   = "h rspec".magenta
        puts " | RspecPaths: #{specs}"
        puts " |  RspecTags: #{tags}"
        puts " |    Options: #{msg}"
        puts " --"
      end
    end
  end
end
