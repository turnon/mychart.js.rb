require 'tasks'
require 'erb'

module MyChart

  class << self

    def js &blk
      @chart = Chart.new
      @chart.instance_exec &blk
      @chart.generate
      @chart#.write
    end

  end

  ALL_DATA = Tasks::ROOT

  class Chart

    attr_reader :tasks, :charts

    def initialize
      @tasks = Tasks.new
      @chart_type_and_id_s = []
    end

    def generate
      tasks.exe
      @charts = @chart_type_and_id_s.map{|type_and_id| Proto.concrete *type_and_id }
    end

    def value name
      tasks[name.to_sym].result.value
    end

    private

    def html_template
      File.join File.dirname(__FILE__), 'tmpl.htm'
    end

  end

end

require 'dsl/material'
require 'dsl/select'
require 'dsl/group'
require 'dsl/draw'
