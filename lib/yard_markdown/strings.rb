module YardMarkdown
  # @private
  class Strings
    PUNCTUATION_REGEXP = RUBY_VERSION > "1.9" ? /[^\p{Word}\- ]/u : /[^\w\- ]/

    # Taken from https://github.com/jch/html-pipeline/blob/master/lib/html/pipeline/toc_filter.rb
    # Which is what GitHub uses, according to https://gist.github.com/asabaylus/3071099
    def self.github_anchor(str)
      str
        .downcase
        .gsub(PUNCTUATION_REGEXP, '')
        .gsub(' ', '-')
    end
  end
end
