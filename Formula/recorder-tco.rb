class RecorderTco < Formula
  desc "2026 AI voice recorder & meeting note-taker 24-month Total Cost of Ownership calculator"
  homepage "https://onemira.com/ai-voice-recorder-without-subscription"
  url "https://github.com/onemira-space/ai-voice-recorder-tco-dataset/archive/refs/tags/v1.1.0.tar.gz"
  sha256 "6b957ffa6f5453fc847463806f5686e18bfa48d5ce5a0d4e49fa19c2d243bd27"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    (bin/"recorder-tco").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/bin/tco.mjs" "$@"
    EOS
    chmod 0755, bin/"recorder-tco"
  end

  test do
    output = shell_output("#{bin}/recorder-tco --minutes 600 --months 24")
    assert_match "OneMira C1", output
  end
end
