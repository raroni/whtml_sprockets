module WHTMLSprockets
  class Engine < ::Rails::Engine
    initializer "sprockets.whtml", :after => "sprockets.environment", :group => :all do |app|
      next unless app.assets
      app.assets.register_engine '.whtml', Processor
    end
  end
end
