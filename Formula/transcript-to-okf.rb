class TranscriptToOkf < Formula
  desc "Offline CLI to migrate Otter, Plaud, HiNotes, Notta & VTT/SRT transcripts to OKF Markdown"
  homepage "https://onemira.com/blogs/ai-voice-recorder-for-obsidian-and-local-markdown"
  url "https://github.com/onemira-space/transcript-to-okf/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "0e60dda9e9cd568aa1a9900fff1fe737b3bc03a3297a4b723e5417349eda13b8"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/transcript-to-okf.mjs" => "transcript-to-okf"
  end

  test do
    (testpath/"sample.vtt").write("WEBVTT\n\n00:00:01.000 --> 00:00:03.000\n<v Alex>Hello OKF</v>\n")
    output = shell_output("#{bin}/transcript-to-okf --in #{testpath}/sample.vtt")
    assert_match 'okf_version: "0.2"', output
  end
end
