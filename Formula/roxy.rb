# Homebrew formula template for roxy.
#
# Place this in your homebrew-tap repository at Formula/roxy.rb, then:
#   brew tap petstack/tap
#   brew install roxy
#
# Version and sha256 values are auto-updated by the homebrew job in the
# release workflow of the main roxy repo (.github/workflows/release.yml),
# which fetches all four .sha256 files from the GitHub Release and substitutes
# them into the REPLACE_WITH_*_SHA256 placeholders below.
#
# To regenerate sha256 values manually, for each archive run:
#   curl -sL <archive_url> | shasum -a 256
class Roxy < Formula
  desc "High-performance MCP proxy server bridging MCP clients to FastCGI/HTTP backends"
  homepage "https://github.com/petstack/roxy"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/petstack/roxy/releases/download/v#{version}/roxy-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "844ff713df61e604df68db70eb764b09ef183e2ded6190aff24a5efdb4ca036d"
    end
    on_intel do
      url "https://github.com/petstack/roxy/releases/download/v#{version}/roxy-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "ed59cbe5f27f4340db19044e5f68c75d3837d5c1a9a3c1909c665e2787581844"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/petstack/roxy/releases/download/v#{version}/roxy-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "67b144456b173b90e71b2a136fbe707fedcc4e5572d7603badd7e9b9026866db"
    end
    on_arm do
      url "https://github.com/petstack/roxy/releases/download/v#{version}/roxy-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "998556454cdd9ca626e8a8664682a28be922e6ebd4b7651c801939f0a5a5ecfc"
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
