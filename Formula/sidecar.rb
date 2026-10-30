class Sidecar < Formula
  desc "Code review comments alongside your source"
  homepage "https://github.com/trogers1/sidecar-comments"
  version "0.1.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/trogers1/sidecar-comments/releases/download/v0.1.0/sidecar_darwin_arm64.tar.gz"
    sha256 "85a5b81abd8da43180b5fb5f594b1da1d06ea9ced461174048c877053466b12c"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/trogers1/sidecar-comments/releases/download/v0.1.0/sidecar_linux_amd64.tar.gz"
    sha256 "ad233c27c1fc0106af2e10a9d7ab08779413a4c512392b03666516d7bc5d08ab"
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
