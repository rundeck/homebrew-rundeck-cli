require 'formula'

VERSION = "2.0.8"
SHA = "88474b6a265399c26bb9515a8c5a62863d50ef684c4a92f721f48d0a1de8482f"

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
