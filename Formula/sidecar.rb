class Sidecar < Formula
  desc "Code review comments alongside your source"
  homepage "https://github.com/trogers1/sidecar-comments"
  version "0.1.2"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/trogers1/sidecar-comments/releases/download/v0.1.2/sidecar_darwin_arm64.tar.gz"
    sha256 "d49f2cdab679867851d0d4f887c15e670530d71ec9b20b510d1932873f8ae297"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/trogers1/sidecar-comments/releases/download/v0.1.2/sidecar_linux_amd64.tar.gz"
    sha256 "655d63186e3c5aa36950a3eb216d7274f941f7e314577d58e8a7e157e5e8cf90"
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
