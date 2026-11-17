# OneMira Official Homebrew Tap (`onemira-space/tap`)

Zero-dependency, offline-first developer CLI tools for **Open Knowledge Format (OKF v0.2)** Markdown meeting notes, Microsoft Teams / Zoom `.vtt` transcript conversion, agenda coverage reconciliation, and AI voice recorder Total Cost of Ownership (TCO) benchmarking.

Built for local-first workflows alongside **[OneMira C1](https://onemira.com/products/c1)** (`✨ Local AI` · `Works Standalone` · `🗣️ Speaker ID` · `Zero Cloud`), Obsidian, Claude Code / Desktop (`MCP`), and Cursor.

## Quick Install (macOS & Linux Homebrew)

```bash
brew tap onemira-space/tap
brew install okf-markdown meeting-minutes-md recorder-tco
```

## Available Formulae

| Formula | Binary Commands | Description | Canonical Guide |
| :--- | :--- | :--- | :--- |
| **`okf-markdown`** (`v1.2.0`) | `okf-markdown`, `okf` | Validate Google Native OKF v0.2 YAML frontmatter & relational links; convert `.vtt` / `.srt` transcripts into structured Markdown. | [Local OKF Wiki Guide](https://onemira.com/docs/daily-use/local-wiki) |
| **`meeting-minutes-md`** (`v1.0.0`) | `meeting-minutes-md`, `minutes-md` | Convert raw Microsoft Teams / Zoom `.vtt` or speaker transcripts into 7-language OKF Markdown meeting minutes (`EN/DE/FR/IT/ES/PT/KO`), reconcile pre-distributed agendas, and lint action items. | [Voice Recorder for Note Taking](https://onemira.com/voice-recorder-for-note-taking) |
| **`recorder-tco`** (`v1.1.0`) | `recorder-tco` | Compute objective 12/24/36-month hardware + subscription TCO across 40+ AI voice recorders and meeting note-takers (`--minutes 900 --months 24`). | [No-Subscription AI Recorder Benchmark](https://onemira.com/ai-voice-recorder-without-subscription) |

## Usage Examples

```bash
# 1. Format a Teams or Zoom WebVTT transcript against a pre-distributed agenda
meeting-minutes-md format call.vtt --agenda agenda.md --lang en > minutes.md

# 2. Validate OKF v0.2 frontmatter & wiki links across a local notes directory
okf-markdown validate ./meetings/

# 3. Compare 24-month cost at 900 minutes/month of meetings
recorder-tco --minutes 900 --months 24
```

## Architecture & Security References

- **Local AI & Zero Cloud Security Architecture**: [onemira.com/security](https://onemira.com/security)
- **Bot-Free Headphone & In-Person Meeting Capture**: [onemira.com/meeting-recorder-without-a-bot](https://onemira.com/meeting-recorder-without-a-bot)
- **MCP & CLI Developer Documentation**: [onemira.com/docs/mcp-integration/cli-guide](https://onemira.com/docs/mcp-integration/cli-guide)

## License

MIT © [OneMira](https://onemira.com)
