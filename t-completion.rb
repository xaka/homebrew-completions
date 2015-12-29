class TCompletion < Formula
  desc "Completion for CLI power tool for Twitter"
  homepage "http://sferik.github.com/t"
  url "https://github.com/sferik/t/archive/v2.9.0.tar.gz"
  sha256 "310da36e655b9bb41032a206dc7301eb2c38cc5e0f57f7a2b2dea03d4c2fb30c"
  head "https://github.com/sferik/t.git"

  bottle :unneeded

  def install
    bash_completion.install "etc/t-completion.sh" => "t"
    zsh_completion.install "etc/t-completion.zsh" => "_t"
  end

  test do
    assert_match "-F _t",
      shell_output("source #{bash_completion}/t && complete -p t")
  end
end
