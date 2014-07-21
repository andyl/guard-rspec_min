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
      UI.info "stopping Guard::RspecMin"
    end

    def reload
      UI.info "reloading Guard::RspecMin"
    end

    def run_all
      UI.info "run_all Guard::RspecMin"
      run_all_paths
    end

    def run_on_changes(paths)
      UI.info "changed paths Guard::RspecMin"
      run_paths(paths)
    end

    def run_on_additions(paths)
      UI.info "additions Guard::RspecMin"
    end

    def run_on_modifications(paths)
      UI.info "modifications Guard::RspecMin"
      run_paths(paths)
    end

    def run_on_removals(paths)
      UI.info "removals Guard::RspecMin"
    end

    private

    def run_all_paths
      run_paths([])
    end

    def run_paths(paths)
      cmd = "#{full_cmd} #{target_specs(paths)}"
      puts cmd.yellow
      system "#{cmd}"
    end

    def full_cmd
      tags  = @options[:tags].map {|o| "-t #{o}"}.join(' ')
      specs = @options[:specs].join(' ')
      [@options[:cmd], tags, specs].join(' ')
    end

    def target_specs(paths)
      paths.map {|p| File.basename(p).split('.').first}.uniq.sort.join(' ')
    end
  end
end
