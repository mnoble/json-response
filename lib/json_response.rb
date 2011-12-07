require "ostruct"
require "json"

module JSONResponse
  VERSION = "0.0.2"
  extend self

  def counters
    @counters ||= Hash.new(0)
  end

  def next(name)
    counters[name] += 1
  end

  class JSONStruct
    def initialize(&block)
      @block = block
    end

    def next(name)
      JSONResponse.next(name)
    end

    def build
      OpenStruct.new.tap { |o| @block.call(o) }.marshal_dump
    end
  end

  def define(name, &block)
    registry[name] = JSONStruct.new(&block)
  end

  def build(name, options={})
    JSON.generate(registry[name].build.merge(options))
  end

  def attributes_for(name, options={})
    registry[name].build.merge(options)
  end

private

  def registry
    @registry ||= {}
  end
end
