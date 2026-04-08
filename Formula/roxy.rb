class Roxy < Formula
  desc "High-performance MCP proxy server bridging MCP clients to FastCGI/HTTP backends"
  homepage "https://github.com/petstack/roxy"
  version "0.1.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/petstack/roxy/releases/download/v#{version}/roxy-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "REPLACE_WITH_AARCH64_APPLE_DARWIN_SHA256"
    end
    on_intel do
      url "https://github.com/petstack/roxy/releases/download/v#{version}/roxy-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "REPLACE_WITH_X86_64_APPLE_DARWIN_SHA256"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/petstack/roxy/releases/download/v#{version}/roxy-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "REPLACE_WITH_X86_64_UNKNOWN_LINUX_MUSL_SHA256"
    end
    on_arm do
      url "https://github.com/petstack/roxy/releases/download/v#{version}/roxy-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "REPLACE_WITH_AARCH64_UNKNOWN_LINUX_MUSL_SHA256"
    end
  end

  def install
    bin.install "roxy"
    doc.install "README.md"
    (prefix/"LICENSE").write File.read("LICENSE") if File.exist?("LICENSE")
  end

  test do
    assert_match "roxy", shell_output("#{bin}/roxy --version")
  end
end
