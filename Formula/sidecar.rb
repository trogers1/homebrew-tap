class Sidecar < Formula
  desc "Code review comments alongside your source"
  homepage "https://github.com/trogers1/sidecar-comments"
  version "0.1.1"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/trogers1/sidecar-comments/releases/download/v0.1.1/sidecar_darwin_arm64.tar.gz"
    sha256 "e3a0b94397c21072e78f1dbda661b6be35ec83d519445a2975da73cd3dd4e182"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/trogers1/sidecar-comments/releases/download/v0.1.1/sidecar_linux_amd64.tar.gz"
    sha256 "bf882d3b4e6e9b667eb789efeabc991bc75fed686524abad73bb29dde4935b77"
  end

  def install
    bin.install "sidecar"
    doc.install "README.md", "THIRD_PARTY_NOTICES", "build-info.txt"
  end

  test do
    require "json"
    result = JSON.parse(shell_output("#{bin}/sidecar --output json version"))
    assert_equal version.to_s, result.fetch("result").fetch("cli_version")
  end
end
