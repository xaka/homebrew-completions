class DockerComposeCompletion < Formula
  desc "docker-compose completion script"
  homepage "https://docs.docker.com/compose/completion/"
  url "https://github.com/docker/compose/archive/1.6.0.tar.gz"
  sha256 "7616e561cc986073c0ac163e6d64cdf63b0817052560beaa737e1c8fb3886528"
  head "https://github.com/docker/compose.git"

  conflicts_with "docker-compose",
    :because => "docker-compose already includes completion scripts"

  bottle :unneeded

  def install
    bash_completion.install "contrib/completion/bash/docker-compose"
    zsh_completion.install "contrib/completion/zsh/_docker-compose"
  end

  test do
    assert_match "-F _docker_compose",
      shell_output("bash -c 'source #{bash_completion}/docker-compose && complete -p docker-compose'")
  end
end
