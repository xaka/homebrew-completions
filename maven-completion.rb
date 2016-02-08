class MavenCompletion < Formula
  desc "Bash completion for Maven"
  homepage "https://github.com/juven/maven-bash-completion"
  url "https://github.com/juven/maven-bash-completion.git",
    :revision => "e27e290a8aa3e09eff08792df27f0e1fe230fbd6"
  version "20160114"

  head "https://github.com/juven/maven-bash-completion.git"

  bottle :unneeded

  def install
    bash_completion.install "bash_completion.bash" => "maven"
  end

  test do
    assert_match "-F _mvn",
      shell_output("source #{bash_completion}/maven && complete -p mvn")
  end
end
