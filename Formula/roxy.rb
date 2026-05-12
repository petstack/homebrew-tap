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
  version "0.2.0"
  license "AGPL-3.0-only"

  on_macos do
    on_arm do
      url "https://github.com/petstack/roxy/releases/download/v#{version}/roxy-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "c66a576fbb0ba21064de242a4e850a65753c31f1bac43af569e752af994bd8f3"
    end
    on_intel do
      url "https://github.com/petstack/roxy/releases/download/v#{version}/roxy-v#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "31b52396ece85fa46b9ea62ad9af8f4fa9f06eefcb5e477964bbe24e217f1a87"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/petstack/roxy/releases/download/v#{version}/roxy-v#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8990e9b76d68e9dea4187bd1cdcd50169fefae1d813ef31a99f7704407feab8c"
    end
    on_arm do
      url "https://github.com/petstack/roxy/releases/download/v#{version}/roxy-v#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "fed30eafc04481182c5e91967c0dec1ccd2a259fecb3fe0740dec988b05c85cc"
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
