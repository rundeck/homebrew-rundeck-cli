# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class RundeckCli < Formula
  desc "CLI tool for Rundeck"
  homepage "https://rundeck.github.io/rundeck-cli/"
  url "https://github.com/rundeck/rundeck-cli/releases/download/v1.4.2/rd-cli-tool-shadow-1.4.2.zip"
  sha256 "1d5f23d9a23bdb0213288a1a763065a7e251b100080c77929a1cdeede34c0e24"
  license "Apache-2.0"

  depends_on :java => "1.8"

  def install
    rm_rf Dir["bin/*.bat"]
    libexec.install Dir["bin", "lib"]
    bin.install_symlink "#{libexec}/bin/rd" => "rd"
  end

  test do
    system "#{bin}/rd --version"
  end
end
