require 'formula'

VERSION = "2.1.3"
SHA = "1dc090d042ed30a9f7866db770cd03171e1904169cb441b4363f452d663f90de"

class RundeckCli < Formula
  desc "CLI tool for Rundeck"
  homepage "https://rundeck.github.io/rundeck-cli/"
  url "https://github.com/rundeck/rundeck-cli/releases/download/v#{VERSION}/rd-cli-tool-shadow-#{VERSION}.zip"
  sha256 SHA
  version VERSION
  license "Apache-2.0"

  def install
    rm_rf Dir["bin/*.bat"]
    libexec.install Dir["bin", "lib"]
    bin.install_symlink "#{libexec}/bin/rd" => "rd"
  end

  test do
    assert_match "#{VERSION}", shell_output("#{bin}/rd --version")
  end
end
