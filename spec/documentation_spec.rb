require 'yard_markdown'

RSpec.describe YardMarkdown do
  before(:all) do
    YardMarkdown::Generator.generate(
      github_repo: "tijmenb/yard_markdown",
    )

    @generated_file = File.read("docs/readme.md")
  end

  describe "table of contents" do
    it "has entries for classes" do
      expect(@generated_file).to include('- [`Generator`](#class-yardmarkdowngenerator)')
    end

    it "has entries for methods" do
      expect(@generated_file).to include(' - [`generate`](#generategithub_repo)')
    end
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

  describe "description" do
    it "shows the class description" do
      expect(@generated_file).to include('A description for the ExampleClass')
    end

    it "shows the method description" do
      expect(@generated_file).to include('Some description for the `initialize` method')
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

    it "includes the @see tags for methods" do
      expect(@generated_file).to include('https://github.com/tijmenb/yard_markdown')
    end

    it "includes the @see tags for classes" do
      expect(@generated_file).to include('https://www.example.org/class-see')
    end
  end

  describe "@deprecated" do
    it "shows the deprecation message for methods" do
      expect(@generated_file).to match("Don't use this method anymore.")
    end

    it "shows the deprecation message for classes" do
      expect(@generated_file).to match("Don't use this class anymore.")
    end

    it "does not show the rubocop messages for methods" do
      expect(@generated_file).to_not match("rubocop:disable Style/DisabledCopOnMethod")
    end

    it "does not show the rubocop messages for classes" do
      expect(@generated_file).to_not match("rubocop:disable Style/DisabledCopOnClass")
    end
  end

  describe "@note" do
    it "shows the emphasised message for methods" do
      expect(@generated_file).to match("Something really important for this method")
    end

    it "shows the emphasised message for classes" do
      expect(@generated_file).to match("Something really important for the class")
    end
  end

  describe "@raise" do
    it "shows the raised exception" do
      expect(@generated_file).to match("`ArgumentError` if something is wrong")
    end
  end

  describe "@yield" do
    it "shows what it yields" do
      expect(@generated_file).to match("Gives 3 random numbers to the block")
    end
  end
end
