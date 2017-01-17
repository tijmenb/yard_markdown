module YardMarkdown
  # @private
  class ViewModel
    attr_reader :github_repo

    def initialize(github_repo)
      @github_repo = github_repo
    end

    def website_base
      "https://github.com/#{github_repo}/blob/master/"
    end

    def public_classes_and_modules
      YARD::Registry.all(:class, :module).map do |klass|
        next if klass.has_tag?(:private)
        klass = ClassOrModule.new(klass)
        next if klass.public_methods.empty?
        klass
      end.compact
    end

    def get_binding
      binding
    end
  end

  # @private
  class ClassOrModule
    attr_reader :klass

    def initialize(klass)
      @klass = klass
    end

    def name
      "#{klass.type} #{klass}"
    end

    def short_name
      klass.name
    end

    def anchor
      Strings.github_anchor(name)
    end

    def description
      klass.base_docstring.lines.reject { |line| line.start_with?('rubocop:') }.join
    end

    def public_methods
      @public_methods ||= begin
        klass.meths(inherited: false, included: false).map do |method|
          next unless method.visibility == :public
          next if method.has_tag?(:private)
          Method.new(method)
        end.compact
      end
    end

    def deprecation_message
      messages = klass.tags(:deprecated).map(&:text)
      messages.any? ? messages.join : nil
    end

    def note_message
      messages = klass.tags(:note).map(&:text)
      messages.any? ? messages.join : nil
    end
  end

  # @private
  class Method
    attr_reader :meth

    def initialize(meth)
      @meth = meth
    end

    def name
      if meth.scope == :instance
        '#' + meth.signature.gsub('def ', '')
      else
        '.' + meth.signature.gsub('self.', '').gsub('def ', '')
      end
    end

    def short_name
      meth.name
    end

    def anchor
      Strings.github_anchor(name)
    end

    def description
      meth.base_docstring.lines.reject { |line| line.start_with?('rubocop:') }.join
    end

    def params
      meth.tags(:param).map do |param|
        Param.new(param)
      end
    end

    def raises
      meth.tags(:raise)
    end

    def yields
      meth.tags(:yield)
    end

    def deprecation_message
      messages = meth.tags(:deprecated).map(&:text)
      messages.any? ? messages.join : nil
    end

    def note_message
      messages = meth.tags(:note).map(&:text)
      messages.any? ? messages.join : nil
    end

    # @private
    class Param < Struct.new(:param)
      def name
        param.name
      end

      def types
        param.types
      end

      def text
        param.text
      end

      def options
        param.object.tags(:option)
      end
    end

    def returns
      meth.tags(:return)
    end

    def examples
      meth.tags(:example)
    end

    def sees
      meth.tags(:see)
    end

    def github_url(website_base)
      website_base + meth.files.first[0] + '#L' + meth.files.first[1].to_s
    end
  end
end
