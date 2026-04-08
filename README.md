# petstack/homebrew-tap

Homebrew formulas for [petstack](https://github.com/petstack) projects.

## Usage

```bash
brew tap petstack/tap
brew install roxy
```

Or as a one-liner without an explicit `tap` step:

```bash
brew install petstack/tap/roxy
```

## Available formulas

- [**roxy**](Formula/roxy.rb) — high-performance MCP (Model Context Protocol) proxy
  server bridging MCP clients to FastCGI or HTTP backends.
  See [petstack/roxy](https://github.com/petstack/roxy) for documentation.

## Supported platforms

All formulas in this tap ship prebuilt binaries for:

| Platform | Architectures |
|---|---|
| macOS | Apple Silicon (arm64), Intel (x86_64) |
| Linux | x86_64 (musl-static), aarch64 (musl-static) |

The Linux binaries are statically linked against musl libc and run on any
distribution (Alpine, Debian, Ubuntu, RHEL, Arch, etc.).

## Updating formulas

Formulas are updated automatically by each project's release workflow.
When a new version of `roxy` is tagged in [petstack/roxy](https://github.com/petstack/roxy),
the release CI fetches the new SHA256 checksums for every prebuilt archive
and pushes an updated `Formula/roxy.rb` to this repository.

## License

This tap is licensed under [BSD-2-Clause](LICENSE). The formulas in this
repository describe how to install software packaged by petstack — the
underlying software keeps its own license (`roxy`, for example, is AGPL-3.0).
