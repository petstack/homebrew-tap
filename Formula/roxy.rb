class Roxy < Formula
  desc "High-performance MCP proxy server bridging MCP clients to FastCGI/HTTP backends"
  homepage "https://github.com/petstack/roxy"
  version "0.1.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/petstack/roxy/releases/download/v#{version}/roxy-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "cf6c1fd9da2ac041f63d129dc61024ba3fef92c55e198b078ea8afdda6d86cf7"
    end
    on_intel do
      url "https://github.com/petstack/roxy/releases/download/v#{version}/roxy-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "fb0df8301fcb303cea96a7d9220532edf0b2e3616f05be9fa09aaf521d2e322a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/petstack/roxy/releases/download/v#{version}/roxy-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0043d12f28a39e9f1bcb35aeb16e8b0df6882476bca5d3411e4a4db5799d48f5"
    end
    on_arm do
      url "https://github.com/petstack/roxy/releases/download/v#{version}/roxy-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "bcce6e9fbfbe9454c3bc80fbe81c8f2d5edf101e8654f27dcc50a7574876ce46"
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
