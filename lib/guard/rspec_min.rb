require 'guard'
require 'guard/plugin'
require 'colored'

module Guard
  class RspecMin < Plugin
    def initialize(options = {})
      super
      @options[:cmd]   ||= "spring rspec"
      @options[:tags]  ||= []
      @options[:specs] ||= []
    end

    def start
      UI.info "starting Guard::RspecMin"
    end

    def stop
      UI.info "stopping Guard::RspecMin".cyan.underline
    end

    def reload
      UI.info "reloading Guard::RspecMin".cyan.underline
    end

    def run_all
      UI.info "run_all Guard::RspecMin".cyan.underline
      run_all_paths
    end

    def run_on_changes(paths)
      UI.info "changed paths Guard::RspecMin".cyan.underline
      run_paths(paths)
    end

    def run_on_additions(paths)
      UI.info "additions Guard::RspecMin".cyan.underline
    end

    def run_on_modifications(paths)
      UI.info "modifications Guard::RspecMin".cyan.underline
      run_paths(paths)
    end

    def run_on_removals(paths)
      UI.info "removals Guard::RspecMin".cyan.underline
    end

    private

    def run_all_paths
      run_paths([])
    end

    def run_paths(paths)
      cmd = "#{full_cmd} #{target_specs(paths)}"
      puts cmd.squeeze(' ').yellow
      system "#{cmd}"
    end

    def full_cmd
      tags  = @options[:tags].map {|o| "-t #{o}"}.join(' ')
      specs = @options[:specs].join(' ')
      [@options[:cmd], tags, specs].join(' ')
    end

    def target_specs(paths)
      paths.empty? ? "spec" : paths.join(' ')
    end
  end
end
