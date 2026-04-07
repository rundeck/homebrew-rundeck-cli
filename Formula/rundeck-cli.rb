require 'formula'

VERSION = "2.0.10"
SHA = "14a1afa9360aa949b01e82b4546c09104c212cbc958042ae5393805bebfee153"

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
