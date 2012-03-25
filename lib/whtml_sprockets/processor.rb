module WHTMLSprockets
  class Processor < Tilt::Template
    JS_ESCAPE_MAP = {
      '\\'    => '\\\\',
      '</'    => '<\/',
      "\r\n"  => '\n',
      "\n"    => '\n',
      "\r"    => '\n',
      '"'     => '\\"',
      "'"     => "\\'"
    }
    
    def self.default_mime_type
      'application/javascript'
    end

    def self.default_namespace
      'this.Wingman.View.templateSources'
    end

    def prepare
      @namespace = self.class.default_namespace
    end

    attr_reader :namespace

    def evaluate(scope, locals, &block)
      escaped = data.gsub(/(\\|<\/|\r\n|\342\200\250|[\n\r"'])/u) {|match| JS_ESCAPE_MAP[match] }
      
      <<-JS
        (function() {
          #{namespace} || (#{namespace} = {});
          #{namespace}[#{scope.logical_path.inspect}] = '#{escaped}';
        }).call(this);
      JS
    end
  end
end
