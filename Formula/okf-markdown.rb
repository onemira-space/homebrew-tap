class OkfMarkdown < Formula
  desc "Open Knowledge Format (OKF v0.2) Markdown validator and VTT/SRT meeting converter"
  homepage "https://onemira.com/docs/daily-use/local-wiki"
  url "https://github.com/onemira-space/okf-markdown/archive/refs/tags/v1.2.0.tar.gz"
  sha256 "dec6cd53b79af1ac5e24995409f65bb5c3edcb36ebcf2873ad42656d5e4aa8bb"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    (bin/"okf-markdown").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/bin/okf.mjs" "$@"
    EOS
    (bin/"okf").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/bin/okf.mjs" "$@"
    EOS
    chmod 0755, bin/"okf-markdown"
    chmod 0755, bin/"okf"
  end

  test do
    (testpath/"sample.vtt").write <<~EOS
      WEBVTT

      00:00:01.000 --> 00:00:04.000
      <v Alice>Decision: Ship Local AI OKF notes without cloud lock-in.</v>
    EOS
    output = shell_output("#{bin}/okf-markdown from-vtt #{testpath}/sample.vtt --title 'Q4 Sync'")
    assert_match "okf_version:", output
  end
end
