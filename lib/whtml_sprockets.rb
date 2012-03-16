module WHTMLSprockets
  autoload :Processor, 'whtml_sprockets/processor'
end

if defined? Rails
  require 'whtml_sprockets/engine'
else
  require 'sprockets'
  Sprockets.register_engine '.whtml', WHTMLSprockets::Processor
end
