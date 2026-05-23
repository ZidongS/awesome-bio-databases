# awesome-bio-databases Design Spec

**Date:** 2026-05-23
**Status:** Draft

## Overview

A curated awesome-list style GitHub repository listing biological databases with AI Agent-friendliness ratings — the first bio-database directory targeting the AI for Science era.

**Repo name:** `awesome-bio-databases`
**Positioning:** "Yellow pages" of biological databases, with agent-friendliness as core differentiator.

## Target Audience

Dual audience:
1. **AI Agent / AI for Science developers** — primary differentiator, need to know which databases have APIs their agents can call
2. **Bioinformatics researchers** — traditional user, need database descriptions, URLs, and data access info

## Repository Structure

```
awesome-bio-databases/
├── README.md              # Main awesome-list (English)
├── README.zh.md           # Chinese
├── README.ja.md           # Japanese
├── README.ko.md           # Korean
├── api-reference.md       # Agent-Ready DB API endpoints + curl examples
├── CONTRIBUTING.md        # Contribution guide + PR template
├── scripts/
│   └── check_apis.sh      # Batch API reachability test script
└── .github/
    └── workflows/
        └── api-check.yml  # Weekly API health check CI
```

## Language Strategy

- Default: English (`README.md`)
- Additional: Chinese (`README.zh.md`), Japanese (`README.ja.md`), Korean (`README.ko.md`)
- Language switcher: shields.io badges at the top of each README

```markdown
[![English](https://img.shields.io/badge/lang-en-blue.svg)](README.md)
[![中文](https://img.shields.io/badge/lang-zh-red.svg)](README.zh.md)
[![日本語](https://img.shields.io/badge/lang-ja-green.svg)](README.ja.md)
[![한국어](https://img.shields.io/badge/lang-ko-orange.svg)](README.ko.md)
```

## Category System (10 Categories)

| # | Category | Icon |
|---|----------|------|
| 1 | Sequence & Genome | 🧬 |
| 2 | Protein & Structure | 🧪 |
| 3 | Plants | 🌿 |
| 4 | Microbes & Viruses | 🦠 |
| 5 | Single Cell | 🔬 |
| 6 | Enzymes & Metabolism | ⚗️ |
| 7 | Compounds & Drugs | 💊 |
| 8 | Disease & Clinical | 🏥 |
| 9 | Interaction & Network | 🔗 |
| 10 | Expression & Regulation | 📊 |

## Entry Format

Five-column markdown table per category:

```markdown
| Name | Description | Agent | Links |
|------|-------------|-------|-------|
| 🧬 [Ensembl](https://www.ensembl.org) | Genome browser for vertebrate genomes with gene annotation, variation, and comparative genomics | 🤖 | [REST API](https://rest.ensembl.org), [FTP](https://ftp.ensembl.org) |
```

Columns: emoji-category + database name (linked to homepage) | 2-3 sentence English description | Agent-friendliness icon | API + download links

## Agent-Friendliness Rating

| Rating | Icon | Criteria |
|--------|------|----------|
| Agent-Ready | 🤖 | Public REST/GraphQL API + bulk data download (FTP/HTTP) |
| Partial | ⚠️ | Either API or bulk download, but not both. Includes: Bioconductor/R package access, API without download, download without API |
| Manual | ❌ | Web UI only, no API and no bulk download |

**Annotations:**
- 🔑 = requires free API key (still Agent-Ready if API is good)
- 💲 = commercial/paywalled API (downgraded to Partial)

## Data Collection Sources & Priority

| Priority | Source | Method |
|----------|--------|--------|
| P0 | awesome-bio-datasets (243⭐) | Extract listed DBs, verify, supplement |
| P0 | awesome-computational-biology (134⭐) | Extract DB section, deduplicate with P0 |
| P1 | NAR Database Issue (2024/2025/2026) | Manually read annual issues, extract new DBs |
| P1 | Domain-specific registries (PlantTFDB, CAZy, IMG/M, etc.) | Gap-fill per category |
| P2 | Bioinformatics journal DB papers (2023-2026) | Keyword search "database" + "web server" |
| P2 | Database Commons (CNCB, 7,346 entries) | Cross-validation for missing important DBs |
| P3 | bioregistry (134⭐) | Final gap-fill via PyPI API extraction |

**Deduplication key:** database official website domain name.

**MVP target:** ~200 manually curated entries (10 categories × 15-20 core DBs each).

## Agent-Friendliness Testing (MVP)

- **Scope:** HTTP reachability only (curl -I check for API endpoints and download URLs)
- **Tool:** `scripts/check_apis.sh` batch script
- **CI:** Weekly GitHub Actions workflow re-checks all Agent-Ready entries
- **Future:** Add minimal query examples per DB in `api-reference.md`

## README Outline

```
# Awesome Bio Databases 🤖

[language switcher badges]

> A curated list of biological databases with AI Agent-friendliness ratings.
> For AI for Science researchers and developers.

## 📋 Contents
(TOC linking to each category)

## 🏷️ Legend
(Agent rating icon table + annotation explanation)

## 🧬 Sequence & Genome
(Table of DBs in this category)
... (repeat for all 10 categories)

## 🤝 Contributing
See CONTRIBUTING.md

## 📡 API Reference
See api-reference.md

## 📜 License
CC0 1.0 Universal
```

## Non-Goals (for MVP)

- Database software tools / workflow engines (awesome-bioinformatics territory)
- Commercial/proprietary databases behind hard paywalls
- General-purpose data science tools (Python/pandas/etc.)
- Literature search databases (PubMed, Google Scholar — too broad)

## License

- Content: CC0 1.0 Universal (database facts are not copyrightable)
- Code (scripts): MIT
