require "bundler/gem_tasks"
task :default => :spec

task :docs do
  require 'yard_markdown'
  YardMarkdown::Generator.generate(
    github_repo: "tijmenb/yard_markdown",
  )
end
