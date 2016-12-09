require 'yard'
require 'erb'

module YardMarkdown
  class Generator
    # Create docs/readme.md for the current project
    #
    # @param github_repo [String] the GitHub repo for this project, eg. "tijmenb/yard_markdown".
    #  Needed to create the "Source on GitHub" link.
    # @example
    #
    #   YardMarkdown::Generator.generate(
    #     github_repo: "tijmenb/yard_markdown",
    #   )
    # @see https://github.com/tijmenb/yard_markdown
    def self.generate(github_repo:)
      new.generate(github_repo: github_repo)
    end

    # @private
    def generate(github_repo:)
      load_yard_database

      model = ViewModel.new(github_repo)
      content = renderer.result(model.get_binding)

      content.gsub!(/^$\n\n/, "\n")
      content.gsub!(/^$\n\n/, "\n")
      content.gsub!(/^$\n\n/, "\n")

      save_result(content)
    end

  private

    def load_yard_database
      yardoc = YARD::CLI::Yardoc.new
      yardoc.run('--no-output', '--no-stats')

      YARD::Registry.load!

      unless YARD::Registry.all.any?
        raise "Error! Can't find anything to document. Perhaps you haven't generated a YARD database."
      end
    end

    def renderer
      template = File.read("#{__dir__}/template.erb")
      ERB.new(template)
    end

    def save_result(content)
      Dir.mkdir("docs") rescue nil
      File.write("docs/readme.md", content)
    end
  end
end
