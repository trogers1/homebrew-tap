class Sidecar < Formula
  desc "Code review comments alongside your source"
  homepage "https://github.com/trogers1/sidecar-comments"
  version "0.2.0"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/trogers1/sidecar-comments/releases/download/v0.2.0/sidecar_darwin_arm64.tar.gz"
    sha256 "3b30d59e0befe563069f160e5585900526e212a55555feadd1e4e0938437268f"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/trogers1/sidecar-comments/releases/download/v0.2.0/sidecar_linux_amd64.tar.gz"
    sha256 "231dd8d1e507d4687f044571ed7c3ec77fa05ac324d5f1cda592ee904741dec9"
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
