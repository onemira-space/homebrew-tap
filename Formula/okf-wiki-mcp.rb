class OkfWikiMcp < Formula
  desc "Zero-dependency offline MCP server & CLI for OKF v0.2 and Obsidian Markdown vaults"
  homepage "https://onemira.com/docs/mcp-integration"
  url "https://github.com/onemira-space/okf-wiki-mcp/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "b35c056039dfcb2bfe93b82931ace213170284de8ddc34673c40636eca4283a6"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/okf-wiki-mcp.mjs" => "okf-wiki-mcp"
  end

  test do
    assert_match "1.0.0", shell_output("#{bin}/okf-wiki-mcp --version")
  end
end
