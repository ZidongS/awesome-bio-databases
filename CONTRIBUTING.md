# Contributing to Awesome Bio Databases

Thanks for helping build the most comprehensive biological database directory!

## How to Add a Database

### 1. Check it's not already listed
Search the [README](README.md) to confirm the database isn't already included.

### 2. Verify the entry format

Each database entry is one row in a 5-column markdown table:

```
| 🧬 [Database Name](https://db-homepage.url) | 2-3 sentence English description of what the database contains and what it's used for | 🤖 | [REST API](https://api.url), [Downloads](https://download.url) |
```

### 3. Determine the Agent-Friendliness rating

| Rating | Icon | Rule |
|--------|------|------|
| Agent-Ready | 🤖 | Has BOTH a public API (REST/GraphQL) AND bulk data download |
| Partial | ⚠️ | Has API OR download, but not both |
| Manual | ❌ | Web UI only |

**Annotations:**
- 🔑 = requires free API key or registration
- 💲 = commercial/paid access required

### 4. Test the URLs

Before submitting, verify that:
- The homepage URL loads (HTTP 200)
- The API endpoint (if listed) is reachable
- The download link (if listed) is accessible

### 5. Submit a Pull Request

- Add your entry in the correct category section
- Keep entries alphabetically sorted within each category
- Use the PR template below

## PR Template

```markdown
## Database Added
- **Name:**
- **URL:**
- **Category:**
- **Agent Rating:**

## URL Verification
- [ ] Homepage loads (HTTP 200)
- [ ] API endpoint reachable (if Agent-Ready)
- [ ] Download link accessible (if Agent-Ready)

## Notes
<!-- Any additional context about this database -->
```

## Quality Guidelines

- **Descriptions:** 2-3 sentences max. Describe what it contains + what it's for. No marketing language.
- **No duplicates:** Check that a different URL for the same database isn't already listed.
- **Active databases only:** The database should be actively maintained (updated within the last 2 years).
- **Public access:** Databases behind hard paywalls without any free tier should not be included.

## Adding a Translation

We welcome translations! See [README.zh.md](README.zh.md), [README.ja.md](README.ja.md), [README.ko.md](README.ko.md) for existing translations. To add a new language:

1. Copy `README.md` to `README.XX.md` (use ISO 639-1 language code)
2. Translate all content EXCEPT database names, URLs, and agent ratings
3. Add a language badge link in your translated file and in README.md
4. Submit a PR

## License

By contributing, you agree that your contributions will be dedicated to the public domain under [CC0 1.0 Universal](https://creativecommons.org/publicdomain/zero/1.0/).
