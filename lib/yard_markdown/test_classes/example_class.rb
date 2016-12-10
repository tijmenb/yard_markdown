module YardMarkdown
  # @note Something really important for the class
  # @deprecated Don't use this class anymore.
  class ExampleClass
    # @param something [Hash] this is my param, it should be a hash
    # @return [Hash] your response
    def initialize(something)
    end

    # @note Something really important for this method
    def some_instance_method(with_arg = {})
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
  end

  module ExampleModule
    def self.method_on_module
    end
  end
end
