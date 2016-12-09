module YardMarkdown
  class ExampleClass
    # @param something [Hash] this is my param, it should be a hash
    # @return [Hash] your response
    def initialize(something)
    end

    def some_instance_method(with_arg = {})
    end

    # @param [Hash] opts the options to create a message with.
    # @option opts [String] :subject The subject
    # @option opts [String] :from ('nobody') From address
    # @option opts [String] :to Recipient email
    # @option opts [String] :body ('') The email's body
    def send_email(opts = {}) end
  end

  module ExampleModule
    def self.method_on_module
    end
  end
end
