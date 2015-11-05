# Contributing to Homebrew-completions
This tap inherits the [Homebrew contributions guidelines][homebrew-contrib] so
please read them first.

[homebrew-contrib]: https://github.com/Homebrew/homebrew/blob/master/CONTRIBUTING.md#contributing

## Adding a formula
See the [Formula Cookbook][cookbook]. Reading existing formulae might help; see
e.g. [`grunt-completion.rb`][grunt], [`rake-completion.rb`][rake] or
[`docker-machine-completion.rb`][docker-machine].

[cookbook]: https://github.com/Homebrew/homebrew/blob/master/share/doc/homebrew/Formula-Cookbook.md
[grunt]: https://github.com/Homebrew/homebrew-completions/blob/d7ef214fa291be04e4560886e3d05d7246ef9263/grunt-completion.rb
[rake]: https://github.com/Homebrew/homebrew-completions/blob/d7ef214fa291be04e4560886e3d05d7246ef9263/rake-completion.rb
[docker-machine]: https://github.com/Homebrew/homebrew-completions/blob/9fb2be4a5c2711a005a114ae3aaea66504193201/docker-machine-completion.rb

### Avoid Duplicates
If the target software is provided by an Homebrew formula and upstream provides
completion scripts it’s usually better to install them along with the software
instead of creating a separate formula here. See [`git.rb`][git] for example.

[git]: https://github.com/Homebrew/homebrew/blob/ad955fe0f2eeeb724bb482cfc0c79847989f21ff/Library/Formula/git.rb#L119-L123

### Naming a formula
Formulae should be named after the name of the software they target, e.g.
`maven-completion`, `rake-completion`, `open-completion`.

### Writing a test
Tests can be tricky here; for now we check that completing the software
triggers the completion function defined by the Bash script. If the software
defines a command `foo` and the Bash script defines a function `_foo` then the
following test should work:

```rb
test do
  assert_match "-F _foo",
    shell_output("source #{bash_completion}/foo && complete -p foo")
end
```

Some Bash completion scripts use Bash-only syntax. These need to be wrapped to
work:

```rb
test do
  assert_match "-F _foo",
    shell_output("bash -c 'source #{bash_completion}/foo && complete -p foo'")
end
```
