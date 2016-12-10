
## `class YardMarkdown::Generator`

### `.generate(github_repo:)`

Create docs/readme.md for the current project

**Params**:

- `github_repo` (`String`) — the GitHub repo for this project, eg. "tijmenb/yard_markdown".
Needed to create the "Source on GitHub" link.
  

**Examples**:

```ruby

YardMarkdown::Generator.generate(
  github_repo: "tijmenb/yard_markdown",
)
```

**See**:
- https://github.com/tijmenb/yard_markdown
- [Source on GitHub](https://github.com/tijmenb/yard_markdown/blob/master/lib/yard_markdown/generator.rb#L16)

---

## `class YardMarkdown::ExampleClass`

A description for the ExampleClass

**Something really important for the class**

⚠️ **Don't use this class anymore.**

### `#initialize(something)`

Some description for the `initialize` method

**Params**:

- `something` (`Hash`) — this is my param, it should be a hash
  

**Returns**:

- (`Hash`) — your response

**See**:
- [Source on GitHub](https://github.com/tijmenb/yard_markdown/blob/master/lib/yard_markdown/test_classes/example_class.rb#L13)

### `#some_instance_method(with_arg = {})`

**Something really important for this method**


**See**:
- [Source on GitHub](https://github.com/tijmenb/yard_markdown/blob/master/lib/yard_markdown/test_classes/example_class.rb#L17)

### `#send_email(opts = {}) end`

**Params**:

- `opts` (`Hash`) — the options to create a message with.
  
  - `:subject` (`String`) — The subject
  - `:from` (`String`) — From address
  - `:to` (`String`) — Recipient email
  - `:body` (`String`) — '') The email's body

**See**:
- [Source on GitHub](https://github.com/tijmenb/yard_markdown/blob/master/lib/yard_markdown/test_classes/example_class.rb#L25)

### `#some_deprecated_method`

⚠️ **Don't use this method anymore.**

**See**:
- [Source on GitHub](https://github.com/tijmenb/yard_markdown/blob/master/lib/yard_markdown/test_classes/example_class.rb#L28)

---

## `module YardMarkdown::ExampleModule`

### `.method_on_module`


**See**:
- [Source on GitHub](https://github.com/tijmenb/yard_markdown/blob/master/lib/yard_markdown/test_classes/example_class.rb#L34)

---

