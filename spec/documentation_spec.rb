require 'yard_markdown'

RSpec.describe YardMarkdown do
  before(:all) do
    YardMarkdown::Generator.generate(
      github_repo: "tijmenb/yard_markdown",
    )

    @generated_file = File.read("docs/readme.md")
  end

  describe "classes and modules" do
    it "uses the class name as a header" do
      expect(@generated_file).to include('## `class YardMarkdown::ExampleClass`')
    end

    it "uses the module name as a header" do
      expect(@generated_file).to include('## `module YardMarkdown::ExampleModule`')
    end

    it "doesn't document empty classes so that the docs aren't cluttered" do
      expect(@generated_file).not_to match('class YardMarkdown::ExampleClassWithoutMethods')
    end
  end

  describe "methods" do
    it "documents class methods" do
      expect(@generated_file).to include('`.method_on_module`')
    end

    it "documents instance methods" do
      expect(@generated_file).to include('`#some_instance_method(with_arg = {})`')
    end
  end

  describe "parameters" do
    it "shows documents parameters" do
      expect(@generated_file).to include('`something` (`Hash`) — this is my param, it should be a hash')
    end

    it "shows documents parameter options" do
      expect(@generated_file).to include('`:subject` (`String`) — The subject')
    end
  end

  describe "return values" do
    it "documents return values" do
      expect(@generated_file).to include('(`Hash`) — your response')
    end
  end

  describe "external links" do
    it "links to GitHub to allow the user to view the source code" do
      expect(@generated_file).to match('https://github.com/tijmenb/yard_markdown/blob/master/lib/yard_markdown/test_classes/example_class.rb')
    end

    it "includes the @see tags" do
      expect(@generated_file).to include('https://github.com/tijmenb/yard_markdown')
    end
  end

  describe "@deprecated" do
    it "shows the deprecation message" do
      expect(@generated_file).to match("Don't use this anymore.")
    end
  end
end
