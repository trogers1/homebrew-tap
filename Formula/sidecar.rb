class Sidecar < Formula
  desc "Code review comments alongside your source"
  homepage "https://github.com/trogers1/sidecar-comments"
  version "0.2.1"
  license "MIT"

  on_macos do
    depends_on arch: :arm64
    url "https://github.com/trogers1/sidecar-comments/releases/download/v0.2.1/sidecar_darwin_arm64.tar.gz"
    sha256 "469e89c770d65f2b15a811c1099f1f50fa6afe9087490890669e9ba69ef579d5"
  end

  on_linux do
    depends_on arch: :x86_64
    url "https://github.com/trogers1/sidecar-comments/releases/download/v0.2.1/sidecar_linux_amd64.tar.gz"
    sha256 "4725a2b844089176681d1bd11d81bd5e6d4ce8f2a50bfbd676e118ab216416a8"
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
