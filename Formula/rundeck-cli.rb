require 'formula'

VERSION = "2.1.4"
SHA = "a4c44b445df5a4b6f9e51475e68baa5247e2a1995f0270d1d1fc0386740f10b8"

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
