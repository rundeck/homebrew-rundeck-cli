require 'formula'

VERSION = "2.2.0"
SHA = "426be49058a71d006172b88ad061c92d67ce29ab6cf1ce8a6d7cfdb05a5bb4f2"

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
