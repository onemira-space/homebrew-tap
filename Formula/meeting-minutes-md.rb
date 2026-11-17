class MeetingMinutesMd < Formula
  desc "Offline OKF v0.2 Markdown meeting minutes formatter, agenda reconciler & action linter"
  homepage "https://onemira.com/voice-recorder-for-note-taking"
  url "https://github.com/onemira-space/meeting-minutes-md/archive/refs/tags/v1.0.0.tar.gz"
  sha256 "74103238d1a7176c17a29ced48337881e35b43476c15f9e7add2bd2135f0170d"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    (bin/"meeting-minutes-md").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/bin/meeting-minutes.mjs" "$@"
    EOS
    (bin/"minutes-md").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/bin/meeting-minutes.mjs" "$@"
    EOS
    chmod 0755, bin/"meeting-minutes-md"
    chmod 0755, bin/"minutes-md"
  end

  test do
    (testpath/"call.vtt").write <<~EOS
      WEBVTT

      00:00:02.000 --> 00:00:06.000
      <v Dana>Action: @Dana finalize security review by 2026-11-25</v>
    EOS
    output = shell_output("#{bin}/meeting-minutes-md format #{testpath}/call.vtt --title 'Diligence Sync'")
    assert_match "Dana", output
  end
end
