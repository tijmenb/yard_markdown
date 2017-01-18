module YardMarkdown
  # A description for the ExampleClass
  #
  # @note Something really important for the class
  # @deprecated Don't use this class anymore.
  # @see https://www.example.org/class-see
  # rubocop:disable Style/DisabledCopOnClass
  class ExampleClass
    # Some description for the `initialize` method
    #
    # @param something [Hash] this is my param, it should be a hash
    # @return [Hash] your response
    # rubocop:disable Style/DisabledCopOnMethod
    def initialize(something)
    end

    # @note Something really important for this method
    def some_instance_method(with_arg = {})
    end

    # @raise [ArgumentError] if something is wrong
    def something_that_raises
    end

    # @param [Hash] opts the options to create a message with.
    # @option opts [String] :subject The subject
    # @option opts [String] :from ('nobody') From address
    # @option opts [String] :to Recipient email
    # @option opts [String] :body ('') The email's body
    def send_email(opts = {}) end

    # @deprecated Don't use this method anymore.
    def some_deprecated_method
    end

    # @yield [a, b, c] Gives 3 random numbers to the block
    def method_that_yields
    end
  end

  module ExampleModule
    def self.method_on_module
    end
  end
end
