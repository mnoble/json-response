require "ostruct"
require "json"

module JSONResponse
  VERSION = "0.0.1"
  extend self

  def define(name)
    yield (registry[name] = OpenStruct.new)
  end

  def build(name, options={})
    JSON.generate(registry[name].marshal_dump.merge(options))
  end

  def attributes_for(name, options={})
    registry[name].marshal_dump.merge(options)
  end

private

  def registry
    @registry ||= {}
  end
end
