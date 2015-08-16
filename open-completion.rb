class OpenCompletion < Formula
  desc "Bash completion for open"
  homepage "https://github.com/moshen/open-bash-completion"
  url "https://github.com/moshen/open-bash-completion/archive/v1.0.1.tar.gz"
  sha256 "3a12237e9036ef1b2eb13f0ac2409420432581ef3c2200716072082f8bc89f99"
  head "https://github.com/moshen/open-bash-completion.git"

  def install
    bash_completion.install "open"
  end

  test do
    assert_match "-F _open",
      shell_output("source #{bash_completion}/open && complete -p open")
  end
end
