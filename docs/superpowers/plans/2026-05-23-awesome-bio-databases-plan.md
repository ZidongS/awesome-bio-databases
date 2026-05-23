# awesome-bio-databases Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Build a comprehensive curated awesome-list of biological databases with AI Agent-friendliness ratings, targeting ~200 entries across 10 categories.

**Architecture:** A single-file awesome-list (`README.md`) with 5-column markdown tables per category. Three-level agent-friendliness rating (Agent-Ready/Partial/Manual). Multi-language support via shields.io badge switcher. Weekly CI for API reachability checks.

**Tech Stack:** Markdown, Bash (shell scripts), GitHub Actions (CI), shields.io (badges)

---

## File Structure Map

```
awesome-bio-databases/
├── README.md              # Main awesome-list — 10 category tables
├── README.zh.md           # Chinese translation
├── README.ja.md           # Japanese translation (initial: placeholder)
├── README.ko.md           # Korean translation (initial: placeholder)
├── api-reference.md       # Agent-Ready DB detailed API endpoints
├── CONTRIBUTING.md        # Contribution guidelines
├── scripts/
│   └── check_apis.sh      # curl-based API reachability tester
└── .github/
    └── workflows/
        └── api-check.yml  # Weekly CI API health check
```

**Responsibilities:**
- `README.md` — The product. 10 categorized tables, legend, TOC, language switcher badges.
- `README.{zh,ja,ko}.md` — Translated copies, same structure, different language.
- `api-reference.md` — Detailed per-DB API documentation: base URL, auth requirements, example endpoint, response format.
- `CONTRIBUTING.md` — How to add a new database entry, PR template.
- `scripts/check_apis.sh` — Reads a hardcoded list of URLs, curl -I each, reports HTTP status.
- `.github/workflows/api-check.yml` — Runs check_apis.sh weekly, opens issue on failures.

---

### Task 1: Collect Data from P0 Sources

**Files:**
- No permanent files created; research output feeds into Task 3.

- [ ] **Step 1: Fetch awesome-bio-databases README**

Run:
```bash
curl -sL https://raw.githubusercontent.com/OpenGene/awesome-bio-datasets/master/README.md > /tmp/awesome-bio-datasets.md
```

Open `/tmp/awesome-bio-datasets.md` and extract every database name, URL, and category grouping. List them in a working scratch file.

- [ ] **Step 2: Fetch awesome-computational-biology README**

Run:
```bash
curl -sL https://raw.githubusercontent.com/inoue0426/awesome-computational-biology/main/README.md > /tmp/awesome-comp-bio.md
```

Extract all database entries from the "Databases" sections (Genome, Protein, Compound, Pathway, Disease, Interaction, scRNA, Clinical Trial). Add to scratch file, marking duplicates against Step 1 results.

- [ ] **Step 3: Merge and deduplicate P0 data**

Create `/tmp/p0-databases.md` as a working scratch file. Merge both sources, deduplicate by domain name. Expected: ~150 unique databases.

- [ ] **Step 4: Commit scratch data**

```bash
git add /tmp/p0-databases.md  # won't work; save it properly
```

Instead, save the merged list into the repo:
```bash
cp /tmp/p0-databases.md docs/p0-merged-sources.md
git add docs/p0-merged-sources.md
git commit -m "data: merge P0 sources (awesome-bio-datasets + awesome-comp-bio)"
```

---

### Task 2: Collect Data from P1 Sources (NAR Database Issue + Domain Registries)

**Files:**
- No permanent files beyond scratch notes.

- [ ] **Step 1: Fetch NAR Database Issue 2026 catalog**

NAR Database Issue is published annually in January. Navigate to:
- https://academic.oup.com/nar/issue/54/D1 (2026)
- https://academic.oup.com/nar/issue/53/D1 (2025)
- https://academic.oup.com/nar/issue/52/D1 (2024)

For each issue, find the "Database List" or summary article listing all databases published. Extract database names, URLs, and brief descriptions. Add to scratch file.

- [ ] **Step 2: Collect domain-specific registries**

For each of the 10 categories, identify 3-5 key domain registries:

| Category | Domain Registries to Check |
|----------|---------------------------|
| Plants | PlantTFDB, Phytozome, TAIR, Gramene, PLAZA |
| Microbes | IMG/M, GISAID, BacDive, ViPR, MicrobiomeDB |
| Protein | PDB, UniProt, Pfam, InterPro, CATH, SCOP |
| Single Cell | CZ CELLxGENE, HCA, Single Cell Portal, Tabula Sapiens |
| Enzymes | BRENDA, CAZy, ExPASy ENZYME, SABIO-RK, MetaCyc |

For each registry, verify it's in the merged list. If not, add it with URL and brief description.

- [ ] **Step 3: Update merged sources and commit**

```bash
git add docs/p0-merged-sources.md
git commit -m "data: add P1 sources (NAR DB issues + domain registries)"
```

---

### Task 3: Create README.md Structure and Legend

**Files:**
- Create: `README.md`

- [ ] **Step 1: Write README.md header with language switcher**

Write the following to `README.md`:

```markdown
[![English](https://img.shields.io/badge/lang-en-blue.svg)](README.md)
[![中文](https://img.shields.io/badge/lang-zh-red.svg)](README.zh.md)
[![日本語](https://img.shields.io/badge/lang-ja-green.svg)](README.ja.md)
[![한국어](https://img.shields.io/badge/lang-ko-orange.svg)](README.ko.md)

# Awesome Bio Databases 🤖

> A curated list of biological databases with **AI Agent-friendliness ratings**.
> Built for AI for Science researchers and developers. Contributions welcome!

## 📋 Contents

- [🏷️ Legend](#-legend)
- [🧬 Sequence & Genome](#-sequence--genome)
- [🧪 Protein & Structure](#-protein--structure)
- [🌿 Plants](#-plants)
- [🦠 Microbes & Viruses](#-microbes--viruses)
- [🔬 Single Cell](#-single-cell)
- [⚗️ Enzymes & Metabolism](#-enzymes--metabolism)
- [💊 Compounds & Drugs](#-compounds--drugs)
- [🏥 Disease & Clinical](#-disease--clinical)
- [🔗 Interaction & Network](#-interaction--network)
- [📊 Expression & Regulation](#-expression--regulation)
- [🤝 Contributing](#-contributing)
- [📡 API Reference](#-api-reference)
- [📜 License](#-license)
```

- [ ] **Step 2: Write Legend section**

Append:

```markdown
## 🏷️ Legend

| Icon | Meaning | Criteria |
|------|---------|----------|
| 🤖 | **Agent-Ready** | Public REST/GraphQL API + bulk data download available |
| ⚠️ | **Partial** | Either API or download available, but not both |
| ❌ | **Manual** | Web UI only; no API and no bulk download |
| 🔑 | **API Key Required** | Free registration needed for API access (still Agent-Ready) |
| 💲 | **Commercial** | Paid API or data access required (downgraded to Partial) |
```

- [ ] **Step 3: Add category section skeleton**

For each of the 10 categories, add an empty table section with the standard 5-column format:

```markdown
## 🧬 Sequence & Genome

| Name | Description | Agent | Links |
|------|-------------|-------|-------|
```

Repeat for all 10 categories using the icons and names from the spec.

- [ ] **Step 4: Add footer sections**

Append to README.md:

```markdown
## 🤝 Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on adding new databases.

## 📡 API Reference

Detailed API endpoints and curl examples for Agent-Ready databases are in [api-reference.md](api-reference.md).

## 📜 License

[![CC0](https://img.shields.io/badge/license-CC0-blue.svg)](LICENSE)

The database list and descriptions in this repository are dedicated to the public domain under [CC0 1.0 Universal](https://creativecommons.org/publicdomain/zero/1.0/). All factual information about databases (names, URLs, access methods) is not subject to copyright.
```

- [ ] **Step 5: Commit**

```bash
git add README.md
git commit -m "feat: add README.md with structure, legend, and 10-category skeleton"
```

---

### Task 4: Populate Sequence & Genome Category

**Files:**
- Modify: `README.md` (the 🧬 Sequence & Genome section)

- [ ] **Step 1: Add Sequence & Genome entries**

Replace the empty `## 🧬 Sequence & Genome` table placeholder with:

```markdown
## 🧬 Sequence & Genome

| Name | Description | Agent | Links |
|------|-------------|-------|-------|
| 🧬 [GenBank](https://www.ncbi.nlm.nih.gov/genbank/) | NIH genetic sequence database — annotated collection of all publicly available DNA sequences | 🤖 | [E-Utilities API](https://www.ncbi.nlm.nih.gov/books/NBK25501/), [FTP](https://ftp.ncbi.nlm.nih.gov/genbank/) |
| 🧬 [RefSeq](https://www.ncbi.nlm.nih.gov/refseq/) | NCBI reference sequence database — curated, non-redundant set of sequences for genomic, transcript, and protein | 🤖 | [E-Utilities API](https://www.ncbi.nlm.nih.gov/books/NBK25501/), [FTP](https://ftp.ncbi.nlm.nih.gov/refseq/) |
| 🧬 [Ensembl](https://www.ensembl.org) | Genome browser for vertebrate genomes with gene annotation, variation, and comparative genomics | 🤖 | [REST API](https://rest.ensembl.org), [FTP](https://ftp.ensembl.org/pub/) |
| 🧬 [UCSC Genome Browser](https://genome.ucsc.edu) | Interactive genome browser with comprehensive annotation tracks for human and model organisms | ⚠️ | [REST API](https://genome.ucsc.edu/goldenPath/help/api.html), [FTP downloads](https://hgdownload.soe.ucsc.edu/) |
| 🧬 [gnomAD](https://gnomad.broadinstitute.org) | Genome aggregation database — exome and whole-genome sequencing data from 140,000+ individuals | 🤖 | [GraphQL API](https://gnomad.broadinstitute.org/api), [Downloads](https://gnomad.broadinstitute.org/downloads) |
| 🧬 [ENCODE](https://www.encodeproject.org) | Encyclopedia of DNA Elements — functional genomics data including ChIP-seq, RNA-seq, DNase-seq | 🤖 | [REST API](https://www.encodeproject.org/help/rest-api/), [Downloads](https://www.encodeproject.org/downloads/) |
| 🧬 [DDBJ](https://www.ddbj.nig.ac.jp) | DNA Data Bank of Japan — primary nucleotide sequence archive, part of INSDC with GenBank and ENA | 🤖 | [REST API](https://www.ddbj.nig.ac.jp/resource/rest-api.html), [FTP](https://ftp.ddbj.nig.ac.jp/) |
| 🧬 [ENA](https://www.ebi.ac.uk/ena) | European Nucleotide Archive — comprehensive nucleotide sequence repository at EMBL-EBI | 🤖 | [REST API](https://www.ebi.ac.uk/ena/portal/api/), [FTP](https://ftp.ebi.ac.uk/pub/databases/ena/) |
| 🧬 [SRA](https://www.ncbi.nlm.nih.gov/sra) | Sequence Read Archive — raw sequencing reads from high-throughput sequencing platforms | 🤖 | [E-Utilities API](https://www.ncbi.nlm.nih.gov/books/NBK25501/), [FTP](https://ftp.ncbi.nlm.nih.gov/sra/) |
| 🧬 [UniProt](https://www.uniprot.org) | Comprehensive protein sequence and functional information database | 🤖 | [REST API](https://www.uniprot.org/help/api), [FTP](https://ftp.uniprot.org/pub/databases/uniprot/) |
| 🧬 [NCBI Gene](https://www.ncbi.nlm.nih.gov/gene) | Integrative gene-centric information from NCBI including sequence, variation, and expression | 🤖 | [E-Utilities API](https://www.ncbi.nlm.nih.gov/books/NBK25501/), [FTP](https://ftp.ncbi.nlm.nih.gov/gene/) |
| 🧬 [HGNC](https://www.genenames.org) | HUGO Gene Nomenclature Committee — authoritative human gene symbols and names | 🤖 | [REST API](https://www.genenames.org/help/rest/), [Downloads](https://www.genenames.org/download/) |
| 🧬 [GENCODE](https://www.gencodegenes.org) | High-quality reference gene annotation for human and mouse genomes | ⚠️ | [FTP downloads](https://ftp.ebi.ac.uk/pub/databases/gencode/), no API |
| 🧬 [T2T Genome](https://github.com/marbl/CHM13) | Telomere-to-Telomere consortium — complete human genome assembly (CHM13) | ⚠️ | [FTP downloads](https://s3-us-west-2.amazonaws.com/human-pangenomics/index.html), no API |
| 🧬 [PharmGKB](https://www.pharmgkb.org) | Pharmacogenomics knowledge base — genetic variation impact on drug response | 🤖 | [REST API](https://api.pharmgkb.org), [Downloads](https://www.pharmgkb.org/downloads) |
| 🧬 [NCBI Assembly](https://www.ncbi.nlm.nih.gov/assembly/) | Database of assembled genome sequences with metadata and statistics | 🤖 | [E-Utilities API](https://www.ncbi.nlm.nih.gov/books/NBK25501/), [FTP](https://ftp.ncbi.nlm.nih.gov/genomes/) |
```

- [ ] **Step 2: Verify agent ratings**

For each entry marked 🤖, run a quick reachability check:
```bash
for url in \
  "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=nuccore&term=test" \
  "https://rest.ensembl.org/info/ping?content-type=application/json" \
  "https://gnomad.broadinstitute.org/api/" \
  "https://www.encodeproject.org/search/?type=Experiment&limit=1&format=json" \
  "https://www.ebi.ac.uk/ena/portal/api/search?result=study&query=taxon%3A9606&limit=1&format=json" \
  "https://rest.uniprot.org/uniprotkb/search?query=insulin&size=1" \
  "https://rest.genenames.org/fetch/symbol/BRCA2" \
  "https://api.pharmgkb.org/v1/data/guideline?view=minimal"; do
  echo -n "$url => "; curl -s -o /dev/null -w "%{http_code}" --max-time 10 "$url"; echo
done
```

Note: 🔑 entries that require API keys may return 403 — document as "verified via key" in a working note.

- [ ] **Step 3: Commit**

```bash
git add README.md
git commit -m "feat: populate Sequence & Genome category (17 entries)"
```

---

### Task 5: Populate Protein & Structure Category

**Files:**
- Modify: `README.md` (the 🧪 Protein & Structure section)

- [ ] **Step 1: Add Protein & Structure entries**

Replace the empty table placeholder with:

```markdown
## 🧪 Protein & Structure

| Name | Description | Agent | Links |
|------|-------------|-------|-------|
| 🧪 [PDB](https://www.rcsb.org) | Worldwide Protein Data Bank — 3D structural data of proteins and nucleic acids | 🤖 | [REST API](https://data.rcsb.org/), [FTP download](https://ftp.wwpdb.org) |
| 🧪 [AlphaFold DB](https://alphafold.ebi.ac.uk) | Predicted protein structures for 200M+ proteins from AlphaFold2, hosted by EMBL-EBI | 🤖 | [API docs](https://alphafold.ebi.ac.uk/api-docs), [Bulk download](https://ftp.ebi.ac.uk/pub/databases/alphafold/) |
| 🧪 [Pfam](https://www.ebi.ac.uk/interpro/entry/pfam/) | Protein families database — multiple sequence alignments and hidden Markov models (now part of InterPro) | 🤖 | [InterPro API](https://www.ebi.ac.uk/interpro/api/), [FTP](https://ftp.ebi.ac.uk/pub/databases/Pfam/) |
| 🧪 [InterPro](https://www.ebi.ac.uk/interpro/) | Integrative protein domain and family classification combining Pfam, PROSITE, SMART, and more | 🤖 | [REST API](https://www.ebi.ac.uk/interpro/api/), [FTP](https://ftp.ebi.ac.uk/pub/databases/interpro/) |
| 🧪 [CATH](https://www.cathdb.info) | Hierarchical classification of protein domain structures (Class, Architecture, Topology, Homology) | 🤖 | [REST API](https://www.cathdb.info/wiki/doku.php?id=api:rest_api), [Downloads](https://www.cathdb.info/download) |
| 🧪 [SCOP](https://scop.mrc-lmb.cam.ac.uk) | Structural Classification of Proteins — hierarchical classification of protein folds and families | ⚠️ | [Downloads](https://scop.mrc-lmb.cam.ac.uk/downloads), web API limited |
| 🧪 [Human Protein Atlas](https://www.proteinatlas.org) | Protein expression across human tissues, cells, and cancer — immunohistochemistry and RNA-seq based | 🤖 | [REST API](https://www.proteinatlas.org/about/api), [Downloads](https://www.proteinatlas.org/about/download) |
| 🧪 [SWISS-MODEL Repository](https://swissmodel.expasy.org/repository) | Homology-modelled protein structures for model organism proteomes | 🤖 | [REST API](https://swissmodel.expasy.org/docs/repository_help#api), [Downloads](https://swissmodel.expasy.org/repository) |
| 🧪 [PROSITE](https://prosite.expasy.org) | Database of protein domains, families, and functional sites with associated patterns and profiles | ⚠️ | [Downloads via FTP](https://ftp.expasy.org/databases/prosite/), no public API |
| 🧪 [SAbDab](https://opig.stats.ox.ac.uk/webapps/sabdab-sabpred/sabdab) | Structural Antibody Database — all publicly available antibody structures with annotations | 🤖 | [REST API](https://opig.stats.ox.ac.uk/webapps/sabdab-sabpred/sabdab/api/), [Downloads](https://opig.stats.ox.ac.uk/webapps/sabdab-sabpred/sabdab/downloads) |
| 🧪 [MobiDB](https://mobidb.org) | Database of intrinsically disordered proteins and protein disorder annotations | 🤖 | [REST API](https://mobidb.org/api_docs), [Downloads](https://mobidb.org/download) |
| 🧪 [ELM](http://elm.eu.org) | Eukaryotic Linear Motif resource — curated short linear motifs in eukaryotic proteins | ⚠️ | [Downloads](http://elm.eu.org/downloads), web API limited |
```

- [ ] **Step 2: Commit**

```bash
git add README.md
git commit -m "feat: populate Protein & Structure category (12 entries)"
```

---

### Task 6: Populate Plants, Microbes & Viruses Categories

**Files:**
- Modify: `README.md` (🌿 Plants and 🦠 Microbes & Viruses sections)

- [ ] **Step 1: Add Plants entries**

```markdown
## 🌿 Plants

| Name | Description | Agent | Links |
|------|-------------|-------|-------|
| 🌿 [TAIR](https://www.arabidopsis.org) | The Arabidopsis Information Resource — comprehensive model plant database for Arabidopsis thaliana | ⚠️ | [REST API](https://www.arabidopsis.org/tools/araport/), bulk download via request |
| 🌿 [Phytozome](https://phytozome-next.jgi.doe.gov) | Plant comparative genomics portal — 100+ assembled plant genomes with annotations | ⚠️ | [FTP/Bulk download](https://phytozome-next.jgi.doe.gov/download), no public REST API |
| 🌿 [PlantTFDB](https://planttfdb.gao-lab.org) | Plant Transcription Factor Database — curated TFs across 165 plant species | ⚠️ | [Downloads](https://planttfdb.gao-lab.org/download.php), web-based only |
| 🌿 [Gramene](https://www.gramene.org) | Comparative plant genomics and pathway resource for crop plants (rice, maize, wheat, etc.) | 🤖 | [REST API](https://www.gramene.org/api), [Downloads](https://www.gramene.org/download) |
| 🌿 [PLAZA](https://bioinformatics.psb.ugent.be/plaza/) | Plant comparative genomics platform with gene families, orthology, and synteny across species | ⚠️ | [Bulk downloads](https://bioinformatics.psb.ugent.be/plaza/download/), no API |
| 🌿 [MaizeGDB](https://www.maizegdb.org) | Maize genetics and genomics database — comprehensive resource for Zea mays | ⚠️ | [Downloads](https://www.maizegdb.org/download), API limited |
| 🌿 [SoyBase](https://www.soybase.org) | Soybean genetics and genomics database for Glycine max | ⚠️ | [Downloads](https://www.soybase.org/dl/), no public API |
| 🌿 [WheatOmics](http://wheatomics.sdau.edu.cn) | Wheat multi-omics database — transcriptome, proteome, metabolome for Triticum aestivum | ❌ | Web-based query only |
| 🌿 [RAP-DB](https://rapdb.dna.affrc.go.jp) | Rice Annotation Project Database — high-quality annotation of the rice genome (Oryza sativa) | ⚠️ | [Downloads](https://rapdb.dna.affrc.go.jp/download/), no API |
| 🌿 [Plant Reactome](https://plantreactome.gramene.org) | Curated plant metabolic and signaling pathways in Reactome framework | 🤖 | [ContentService API](https://reactome.org/ContentService/), [Downloads](https://plantreactome.gramene.org/download) |
| 🌿 [BAR](https://bar.utoronto.ca) | Bio-Analytic Resource for Plant Biology — Arabidopsis tools, expression data, and interaction viewers | ⚠️ | [Downloads](https://bar.utoronto.ca/), mostly web-based |
| 🌿 [Ensembl Plants](https://plants.ensembl.org) | Ensembl genome browser specialized for plant genomes (67+ species) | 🤖 | [REST API](https://rest.ensembl.org), [FTP](https://ftp.ensemblgenomes.ebi.ac.uk/pub/plants/) |
| 🌿 [PlantGDB](https://www.plantgdb.org) | Plant Genome Database — EST assemblies, genome browsers for diverse plant species | ⚠️ | [FTP downloads](https://www.plantgdb.org/download/), no API |
| 🌿 [PlncRNADB](https://www.plncrnadb.com) | Plant long non-coding RNA database with expression profiles, epigenetic marks, and functional annotations | ❌ | Web-based with search |
```

- [ ] **Step 2: Add Microbes & Viruses entries**

```markdown
## 🦠 Microbes & Viruses

| Name | Description | Agent | Links |
|------|-------------|-------|-------|
| 🦠 [IMG/M](https://img.jgi.doe.gov) | Integrated Microbial Genomes & Microbiomes — JGI's metagenome analysis platform | ⚠️ | [REST API](https://img.jgi.doe.gov/docs/api), data download via JGI portal |
| 🦠 [MGnify](https://www.ebi.ac.uk/metagenomics) | EBI metagenomics resource — free analysis and archiving of microbiome-derived sequences | 🤖 | [REST API](https://www.ebi.ac.uk/metagenomics/api/), [Downloads](https://www.ebi.ac.uk/metagenomics/download) |
| 🦠 [GISAID](https://gisaid.org) | Global Initiative on Sharing All Influenza Data — viral genome sequences (notably SARS-CoV-2 and influenza) | ⚠️ | 🔑 API requires registration and agreement; [Data access](https://gisaid.org/register/) |
| 🦠 [BacDive](https://bacdive.dsmz.de) | Bacterial Diversity database — standardized metadata for 90,000+ bacterial and archaeal strains | 🤖 | [REST API](https://api.bacdive.dsmz.de/), [Downloads](https://bacdive.dsmz.de/download) 🔑 |
| 🦠 [ViPR](https://www.viprbrc.org) | Virus Pathogen Resource — integrated data for human pathogenic viruses | ⚠️ | [Downloads](https://www.viprbrc.org/brc/publicData.spg), API via BV-BRC |
| 🦠 [MicrobiomeDB](https://microbiomedb.org) | Multi-omics microbiome data warehouse with integrated analysis tools | ⚠️ | [Downloads](https://microbiomedb.org/mbio/app/record/dataset), API limited |
| 🦠 [BV-BRC](https://www.bv-brc.org) | Bacterial and Viral Bioinformatics Resource Center — integrated genomic and metadata for pathogens | 🤖 | [REST API](https://www.bv-brc.org/api), [Downloads](https://www.bv-brc.org/downloads) |
| 🦠 [SILVA](https://www.arb-silva.de) | Comprehensive ribosomal RNA gene database for all three domains of life | ⚠️ | [Downloads](https://www.arb-silva.de/download/), no public API |
| 🦠 [Greengenes2](https://greengenes2.ucsd.edu) | Updated 16S rRNA reference database with whole-genome-enhanced taxonomy | 🤖 | [Downloads + API via Qiita/FTP](https://ftp.microbio.me/greengenes_release/) |
| 🦠 [CARD](https://card.mcmaster.ca) | Comprehensive Antibiotic Resistance Database — curated resistance genes and mechanisms | 🤖 | [REST API](https://card.mcmaster.ca/api), [Downloads](https://card.mcmaster.ca/download) |
| 🦠 [VFDB](http://www.mgc.ac.cn/VFs/) | Virulence Factor Database — experimentally validated bacterial virulence factors | ⚠️ | [Downloads](http://www.mgc.ac.cn/VFs/download.htm), web-based API |
| 🦠 [PATRIC/BV-BRC](https://www.bv-brc.org) | (Note: now integrated into BV-BRC) Pathogen genomic and metadata resource | 🤖 | See BV-BRC above |
```

- [ ] **Step 3: Commit**

```bash
git add README.md
git commit -m "feat: populate Plants and Microbes & Viruses categories (26 entries)"
```

---

### Task 7: Populate Single Cell and Enzymes & Metabolism Categories

**Files:**
- Modify: `README.md` (🔬 Single Cell and ⚗️ Enzymes & Metabolism sections)

- [ ] **Step 1: Add Single Cell entries**

```markdown
## 🔬 Single Cell

| Name | Description | Agent | Links |
|------|-------------|-------|-------|
| 🔬 [CZ CELLxGENE](https://cellxgene.cziscience.com) | Chan Zuckerberg Initiative single-cell data platform — standardized scRNA-seq datasets with cell annotation | 🤖 | [REST API](https://api.cellxgene.cziscience.com/curation/v1/), [Downloads](https://cellxgene.cziscience.com/datasets) |
| 🔬 [Human Cell Atlas](https://www.humancellatlas.org) | International open atlas of all human cells — single-cell reference maps across tissues | 🤖 | [Data Portal API](https://data.humancellatlas.org/apis/api-documentation), [Downloads](https://data.humancellatlas.org/explore/projects) |
| 🔬 [Single Cell Portal](https://singlecell.broadinstitute.org/single_cell) | Broad Institute's single-cell data portal — curated scRNA-seq studies | ⚠️ | [API](https://singlecell.broadinstitute.org/single_cell/api/v1/), downloads per study |
| 🔬 [Tabula Sapiens](https://tabula-sapiens-portal.ds.czbiohub.org) | Cell atlas of human tissues — ~500,000 cells across 24 organs with deep annotation | ⚠️ | [Downloads](https://tabula-sapiens-portal.ds.czbiohub.org/data), limited API |
| 🔬 [scRNASeqDB](https://bioinfo.uth.edu/scrnaseqdb/) | Human single-cell RNA-seq gene expression profiles across conditions and cell types | ❌ | Web-based query only |
| 🔬 [PanglaoDB](https://panglaodb.se) | Single-cell transcriptomics resource for mouse and human — cell type markers and expression data | ⚠️ | [Downloads](https://panglaodb.se/data_release.html), no API |
| 🔬 [Single Cell Expression Atlas](https://www.ebi.ac.uk/gxa/sc/home) | EMBL-EBI single-cell expression atlas — standardized reprocessing of scRNA-seq datasets | 🤖 | [REST API](https://www.ebi.ac.uk/gxa/sc/api/), [Downloads](https://www.ebi.ac.uk/gxa/sc/experiments) |
| 🔬 [TISSUES](https://tissues.jensenlab.org) | Tissue-disease-gene associations integrating transcriptomics, proteomics, and text mining | ⚠️ | [Downloads](https://tissues.jensenlab.org/Downloads), no API |
| 🔬 [JingleBells](https://jinglebells.bgu.ac.il) | Standardized scRNA-seq datasets in BAM format for benchmarking immune repertoire analysis | ⚠️ | [Downloads](https://jinglebells.bgu.ac.il/), no API |
| 🔬 [Tumour Immune Single Cell Hub (TISCH)](http://tisch.comp-genomics.org) | Tumor microenvironment single-cell atlas — 2M+ cells from 79 cancer types | ⚠️ | [Downloads](http://tisch.comp-genomics.org/download/), API via gene search |
| 🔬 [DISCO](https://www.immunesinglecell.org) | Database of Immune Cell eQTLs, scRNA-seq, and cell-type expression profiles in immune cells | ⚠️ | [Downloads](https://www.immunesinglecell.org/download), web-based |
| 🔬 [Azimuth](https://azimuth.hubmapconsortium.org) | Reference-based automated cell type annotation for single-cell data | 🤖 | [API via R/Python packages](https://azimuth.hubmapconsortium.org/references/), [Downloads](https://azimuth.hubmapconsortium.org/references/) |
```

- [ ] **Step 2: Add Enzymes & Metabolism entries**

```markdown
## ⚗️ Enzymes & Metabolism

| Name | Description | Agent | Links |
|------|-------------|-------|-------|
| ⚗️ [BRENDA](https://www.brenda-enzymes.org) | Comprehensive enzyme information system — 40+ million data points on enzyme function, kinetics, and structure | ⚠️ | [SOAP API](https://www.brenda-enzymes.org/soap), bulk download via academic license only |
| ⚗️ [KEGG](https://www.genome.jp/kegg/) | Kyoto Encyclopedia of Genes and Genomes — integrated pathway, drug, disease, and genomic resource | 🤖 | [REST API](https://www.kegg.jp/kegg/rest/), [FTP](https://www.genome.jp/kegg/download/) 💲 |
| ⚗️ [MetaCyc](https://metacyc.org) | Comprehensive curated database of experimentally elucidated metabolic pathways across all domains | ⚠️ | [Downloads](https://metacyc.org/downloads.shtml), API via Pathway Tools 💲 |
| ⚗️ [BioCyc](https://biocyc.org) | Collection of 20,000+ Pathway/Genome Databases for sequenced organisms with metabolic reconstructions | ⚠️ | [REST API](https://biocyc.org/api), API key required; downloads limited |
| ⚗️ [Reactome](https://reactome.org) | Curated open-source pathway database for human biological processes | 🤖 | [ContentService API](https://reactome.org/ContentService/), [Downloads](https://reactome.org/download-data) |
| ⚗️ [SABIO-RK](http://sabiork.h-its.org) | Curated database of biochemical reaction kinetics — kinetic parameters, rate equations, and conditions | 🤖 | [REST API](http://sabiork.h-its.org/api/), [Downloads](http://sabiork.h-its.org/download) |
| ⚗️ [CAZy](http://www.cazy.org) | Carbohydrate-Active enZYmes database — classification of glycoside hydrolases, transferases, etc. | ⚠️ | [Downloads via FTP request](http://www.cazy.org/Download/), no public API |
| ⚗️ [ExPASy ENZYME](https://enzyme.expasy.org) | Swiss-Prot enzyme nomenclature database — EC numbers, names, reactions, and cofactors | ⚠️ | [Downloads via FTP](https://ftp.expasy.org/databases/enzyme/), no API |
| ⚗️ [Rhea](https://www.rhea-db.org) | Curated database of biochemical reactions — reaction participants, stoichiometry, and cross-references | 🤖 | [REST API](https://www.rhea-db.org/api), [Downloads](https://www.rhea-db.org/download) |
| ⚗️ [HMDB](https://hmdb.ca) | Human Metabolome Database — comprehensive metabolite information with links to pathways and enzymes | ⚠️ | [Downloads](https://hmdb.ca/downloads), no public API |
| ⚗️ [Lipid Maps](https://www.lipidmaps.org/databases/lmsd/overview) | LIPID MAPS Structure Database — curated lipid structures, classifications, and annotations | ⚠️ | [Downloads](https://www.lipidmaps.org/databases/lmsd/download), API limited |
| ⚗️ [IntEnz](https://www.ebi.ac.uk/intenz/) | Integrated relational Enzyme database — official IUBMB enzyme nomenclature with cross-references | ⚠️ | [FTP downloads](https://ftp.ebi.ac.uk/pub/databases/intenz/), SOAP API deprecated |
| ⚗️ [eQuilibrator](https://equilibrator.weizmann.ac.il) | Biochemical thermodynamics calculator with reaction Gibbs free energies | 🤖 | [REST API](https://equilibrator.weizmann.ac.il/api), [Downloads](https://gitlab.com/equilibrator/equilibrator-data) |
```

- [ ] **Step 3: Commit**

```bash
git add README.md
git commit -m "feat: populate Single Cell and Enzymes & Metabolism categories (25 entries)"
```

---

### Task 8: Populate Compounds & Drugs and Disease & Clinical Categories

**Files:**
- Modify: `README.md` (💊 Compounds & Drugs and 🏥 Disease & Clinical sections)

- [ ] **Step 1: Add Compounds & Drugs entries**

```markdown
## 💊 Compounds & Drugs

| Name | Description | Agent | Links |
|------|-------------|-------|-------|
| 💊 [PubChem](https://pubchem.ncbi.nlm.nih.gov) | World's largest public chemistry database — 115M+ compounds with bioactivity, safety, and literature data | 🤖 | [PUG REST API](https://pubchem.ncbi.nlm.nih.gov/docs/pug-rest), [FTP](https://ftp.ncbi.nlm.nih.gov/pubchem/) |
| 💊 [ChEMBL](https://www.ebi.ac.uk/chembl/) | Manually curated database of bioactive molecules with drug-like properties and associated bioactivity data | 🤖 | [REST API](https://www.ebi.ac.uk/chembl/api/data/), [Downloads](https://ftp.ebi.ac.uk/pub/databases/chembl/) |
| 💊 [DrugBank](https://go.drugbank.com) | Comprehensive drug knowledgebase — 500,000+ drug entries with targets, pathways, and interactions | ⚠️ | [Downloads](https://go.drugbank.com/releases/latest) (free for academic use), API restricted 💲 |
| 💊 [ChEBI](https://www.ebi.ac.uk/chebi/) | Chemical Entities of Biological Interest — dictionary of small chemical compounds | 🤖 | [REST API](https://www.ebi.ac.uk/chebi/webServices.do), [FTP](https://ftp.ebi.ac.uk/pub/databases/chebi/) |
| 💊 [ZINC](https://zinc.docking.org) | Free database of commercially available compounds for virtual screening — 1.5B+ purchasable molecules | 🤖 | [REST API](https://zinc.docking.org/api/), [Downloads](https://zinc.docking.org/substances/home/) |
| 💊 [PDBbind](http://www.pdbbind.org.cn) | Curated database of experimentally measured binding affinities for protein-ligand complexes | ⚠️ | [Downloads](http://www.pdbbind.org.cn/download.php) (registration required) |
| 💊 [BindingDB](https://www.bindingdb.org) | Public database of measured binding affinities for protein-ligand, protein-protein interactions | 🤖 | [REST API](https://www.bindingdb.org/api/v1/), [Downloads](https://www.bindingdb.org/rwd/bind/chemsearch/marvin/Download.jsp) |
| 💊 [DGIdb](https://www.dgidb.org) | Drug-Gene Interaction database — 40,000+ drug-gene interactions from 30+ sources | 🤖 | [GraphQL API](https://dgidb.org/api), [Downloads](https://www.dgidb.org/downloads) |
| 💊 [STITCH](http://stitch.embl.de) | Search Tool for Interacting Chemicals — known and predicted chemical-protein interactions | ⚠️ | [Downloads](http://stitch.embl.de/cgi/download.pl), API via STRING |
| 💊 [Drug Repurposing Hub](https://clue.io/repurposing) | Broad Institute's annotated collection of approved and investigational drugs for repurposing studies | 🤖 | [Downloads](https://clue.io/repurposing#download-data), API via CLUE 🔑 |
| 💊 [Open Targets Platform](https://platform.opentargets.org) | Comprehensive target-disease association evidence from genetics, omics, and literature | 🤖 | [GraphQL API](https://api.platform.opentargets.org/api/v4/graphql), [Downloads](https://platform.opentargets.org/downloads) |
| 💊 [SuperDRUG2](http://cheminfo.charite.de/superdrug2) | Comprehensive database of approved and marketed drugs with their targets and side effects | ❌ | Web-based search and download |
| 💊 [SMPDB](https://smpdb.ca) | Small Molecule Pathway Database — interactive metabolic and signaling pathway diagrams | ⚠️ | [Downloads](https://smpdb.ca/downloads), no API |
```

- [ ] **Step 2: Add Disease & Clinical entries**

```markdown
## 🏥 Disease & Clinical

| Name | Description | Agent | Links |
|------|-------------|-------|-------|
| 🏥 [OMIM](https://www.omim.org) | Online Mendelian Inheritance in Man — authoritative catalog of human genes and genetic disorders | ⚠️ | [API](https://omim.org/api) (limited free tier), downloads restricted |
| 🏥 [ClinVar](https://www.ncbi.nlm.nih.gov/clinvar/) | NCBI database of clinically significant human genetic variants with assertions of pathogenicity | 🤖 | [E-Utilities API](https://www.ncbi.nlm.nih.gov/books/NBK25501/), [FTP](https://ftp.ncbi.nlm.nih.gov/pub/clinvar/) |
| 🏥 [COSMIC](https://cancer.sanger.ac.uk/cosmic) | Catalogue of Somatic Mutations in Cancer — comprehensive somatic mutation database | ⚠️ | [Downloads](https://cancer.sanger.ac.uk/cosmic/download) (registration + license required) |
| 🏥 [DisGeNET](https://www.disgenet.org) | Knowledge platform integrating gene-disease associations, variant-disease links, and disease information | 🤖 | [REST API](https://www.disgenet.org/api/), [Downloads](https://www.disgenet.org/Download) 🔑 |
| 🏥 [ClinicalTrials.gov](https://clinicaltrials.gov) | NIH registry of clinical trials worldwide — 450,000+ studies in 220+ countries | 🤖 | [REST API v2](https://clinicaltrials.gov/api/v2/), [Downloads](https://clinicaltrials.gov/ct2/download) |
| 🏥 [MIMIC-IV](https://physionet.org/content/mimiciv/) | Medical Information Mart for Intensive Care — de-identified ICU patient data from Beth Israel Deaconess | ⚠️ | [Downloads via PhysioNet](https://physionet.org/content/mimiciv/) (credentialed access + CITI training required) |
| 🏥 [cBioPortal](https://www.cbioportal.org) | Open-source platform for interactive exploration of cancer genomics datasets from large-scale studies | 🤖 | [REST API](https://www.cbioportal.org/api/swagger-ui.html), [Downloads](https://www.cbioportal.org/datasets) |
| 🏥 [HPO](https://hpo.jax.org) | Human Phenotype Ontology — standardized vocabulary of phenotypic abnormalities for clinical genomics | 🤖 | [REST API](https://hpo.jax.org/api/hp/), [Downloads](https://hpo.jax.org/data/annotations) |
| 🏥 [Orphanet](https://www.orpha.net) | Portal for rare diseases and orphan drugs — disease classifications, epidemiological data, and expert centers | ⚠️ | [Downloads](https://www.orpha.net/consor/cgi-bin/Education_AboutOrphanet.php?lng=EN&stapage=ST_EDUCATION_ABOUTORPHANET_DOWNLOADS), no public API |
| 🏥 [TCGA/GDC](https://portal.gdc.cancer.gov) | NCI Genomic Data Commons — unified repository for The Cancer Genome Atlas and other cancer genomics programs | 🤖 | [REST API](https://api.gdc.cancer.gov), [Downloads](https://portal.gdc.cancer.gov/repository) |
| 🏥 [ICGC](https://dcc.icgc.org) | International Cancer Genome Consortium — genomic data from 25,000+ cancer cases across 50 tumor types | ⚠️ | [Downloads](https://dcc.icgc.org/releases), API access limited |
| 🏥 [DepMap](https://depmap.org) | Cancer Dependency Map — genome-scale CRISPR and RNAi screens across 1,000+ cancer cell lines | 🤖 | [Downloads + Portal](https://depmap.org/portal/download/all/), API via data files |
| 🏥 [Monarch Initiative](https://monarchinitiative.org) | Integrative platform connecting genotypes, phenotypes, and diseases across species | 🤖 | [REST API](https://api.monarchinitiative.org/api), [Downloads](https://monarchinitiative.org/downloads) |
| 🏥 [Open Targets Genetics](https://genetics.opentargets.org) | GWAS and functional genomics data for identifying drug targets from genetic evidence | 🤖 | [GraphQL API](https://api.genetics.opentargets.org/graphql), [Downloads](https://genetics.opentargets.org/downloads) |
```

- [ ] **Step 3: Commit**

```bash
git add README.md
git commit -m "feat: populate Compounds & Drugs and Disease & Clinical categories (27 entries)"
```

---

### Task 9: Populate Interaction & Network and Expression & Regulation Categories

**Files:**
- Modify: `README.md` (🔗 Interaction & Network and 📊 Expression & Regulation sections)

- [ ] **Step 1: Add Interaction & Network entries**

```markdown
## 🔗 Interaction & Network

| Name | Description | Agent | Links |
|------|-------------|-------|-------|
| 🔗 [STRING](https://string-db.org) | Search Tool for the Retrieval of Interacting Genes/Proteins — known and predicted protein-protein interactions | 🤖 | [REST API](https://string-db.org/help/api/), [Downloads](https://string-db.org/cgi/download) |
| 🔗 [BioGRID](https://thebiogrid.org) | Curated biological interaction database — 2.5M+ protein, genetic, and chemical interactions across all species | 🤖 | [REST API](https://wiki.thebiogrid.org/doku.php/webservice), [Downloads](https://downloads.thebiogrid.org/BioGRID/) |
| 🔗 [IntAct](https://www.ebi.ac.uk/intact/) | EMBL-EBI molecular interaction database — curated protein-protein, protein-DNA, protein-small molecule interactions | 🤖 | [REST API](https://www.ebi.ac.uk/intact/webservice/), [FTP](https://ftp.ebi.ac.uk/pub/databases/intact/) |
| 🔗 [HIPPIE](http://cbdm-01.zdv.uni-mainz.de/~mschaefer/hippie/) | Human Integrated Protein-Protein Interaction rEference — scored human PPIs with context information | ⚠️ | [Downloads](http://cbdm-01.zdv.uni-mainz.de/~mschaefer/hippie/download.php), web-based API |
| 🔗 [IID](http://iid.ophid.utoronto.ca) | Integrated Interactions Database — tissue-specific and species-specific protein interactions | ⚠️ | [Downloads](http://iid.ophid.utoronto.ca/download/), no public API |
| 🔗 [PathwayCommons](https://www.pathwaycommons.org) | Aggregated public pathway data from 22 databases in BioPAX format | 🤖 | [REST API](https://www.pathwaycommons.org/pc2/), [Downloads](https://www.pathwaycommons.org/archives/) |
| 🔗 [WikiPathways](https://wikipathways.org) | Community-curated biological pathway database in a wiki framework | 🤖 | [REST API](https://webservice.wikipathways.org), [Downloads](https://wikipathways.org/index.php/Download_Pathways) |
| 🔗 [TRRUST](https://www.grnpedia.org/trrust/) | Transcriptional Regulatory Relationships Unraveled by Sentence-based Text mining — human TF-target interactions | ⚠️ | [Downloads](https://www.grnpedia.org/trrust/download/), no API |
| 🔗 [CORUM](http://mips.helmholtz-muenchen.de/corum/) | Comprehensive resource of manually annotated mammalian protein complexes | ⚠️ | [Downloads](http://mips.helmholtz-muenchen.de/corum/#download), no API |
| 🔗 [Hetionet](https://het.io) | Heterogeneous knowledge graph integrating 47K nodes and 2.25M relationships across compounds, diseases, genes, and more | 🤖 | [Downloads](https://github.com/hetio/hetionet), API via Neo4j |
| 🔗 [PrimeKG](https://www.denisf.org/post/primekg) | Precision Medicine Knowledge Graph — multimodal knowledge graph integrating 20+ biomedical resources | 🤖 | [Downloads](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/IXA7BM), API via Neo4j |
| 🔗 [DRKG](https://github.com/gnn4dr/DRKG) | Drug Repurposing Knowledge Graph — comprehensive biomedical KG for drug discovery and repurposing | ⚠️ | [Downloads](https://github.com/gnn4dr/DRKG#download), no public API |
```

- [ ] **Step 2: Add Expression & Regulation entries**

```markdown
## 📊 Expression & Regulation

| Name | Description | Agent | Links |
|------|-------------|-------|-------|
| 📊 [GEO](https://www.ncbi.nlm.nih.gov/geo/) | Gene Expression Omnibus — NCBI's public functional genomics data repository (5M+ samples) | 🤖 | [E-Utilities API](https://www.ncbi.nlm.nih.gov/books/NBK25501/), [FTP](https://ftp.ncbi.nlm.nih.gov/geo/) |
| 📊 [ArrayExpress](https://www.ebi.ac.uk/biostudies/arrayexpress) | EMBL-EBI functional genomics data archive (now merged into BioStudies) | 🤖 | [REST API](https://www.ebi.ac.uk/biostudies/api/), [FTP](https://ftp.ebi.ac.uk/pub/databases/arrayexpress/) |
| 📊 [GTEx](https://gtexportal.org) | Genotype-Tissue Expression project — gene expression and eQTL data across 54 human tissues | 🤖 | [REST API](https://gtexportal.org/home/api-docs/index.html), [Downloads](https://gtexportal.org/home/downloads/adult-gtex) |
| 📊 [Expression Atlas](https://www.ebi.ac.uk/gxa) | EMBL-EBI gene expression across species and conditions — baseline, differential, and proteomics expression | 🤖 | [REST API](https://www.ebi.ac.uk/gxa/api/), [Downloads](https://www.ebi.ac.uk/gxa/download) |
| 📊 [JASPAR](https://jaspar.genereg.net) | Open-access database of curated, non-redundant transcription factor binding profiles | 🤖 | [REST API](https://jaspar.genereg.net/api/), [Downloads](https://jaspar.genereg.net/downloads/) |
| 📊 [TRANSFAC](http://gene-regulation.com/pub/databases.html) | Curated database of eukaryotic transcription factors, their binding sites, and regulated genes | 💲 | Commercial license required for full access; limited public version |
| 📊 [ENCODE](https://www.encodeproject.org) | (Cross-listed) Encyclopedia of DNA Elements — functional genomics data including ChIP-seq, RNA-seq, DNase-seq | 🤖 | See Sequence & Genome |
| 📊 [FANTOM5](https://fantom.gsc.riken.jp/5/) | Functional Annotation of Mammalian Genome 5 — promoter-level expression atlas across primary cell types | ⚠️ | [Downloads](https://fantom.gsc.riken.jp/5/data/), no public API |
| 📊 [mirBase](https://www.mirbase.org) | microRNA database — published miRNA sequences, annotation, and predicted targets | ⚠️ | [FTP downloads](https://www.mirbase.org/download/), no API |
| 📊 [miRTarBase](https://mirtarbase.cuhk.edu.cn) | Experimentally validated microRNA-target interactions database | ⚠️ | [Downloads](https://mirtarbase.cuhk.edu.cn/~miRTarBase/miRTarBase_2022/download.php), no API |
| 📊 [TRANSFAC](http://gene-regulation.com/pub/databases.html) | Curated transcription factor binding profiles — gold standard for eukaryotic TFBS predictions | 💲 | Public version: [PATCH](http://gene-regulation.com/pub/programs.html#patch) |
| 📊 [HOCOMOCO](https://hocomoco11.autosome.org) | Comprehensive collection of human and mouse transcription factor binding models from ChIP-seq data | 🤖 | [Downloads](https://hocomoco11.autosome.org/downloads), API via MEME Suite format |
| 📊 [RegNetwork](http://www.regnetworkweb.org) | Repository of transcriptional and post-transcriptional regulatory relationships in human and mouse | ❌ | Web-based query and download |
| 📊 [Roadmap Epigenomics](http://www.roadmapepigenomics.org) | NIH Roadmap Epigenomics Project — reference epigenomic maps across human tissues and cell types | ⚠️ | [Downloads via GEO/SRA](http://www.roadmapepigenomics.org/data), no unified API |
```

- [ ] **Step 3: Fix TRANSFAC duplicate (appears twice in Expression section)**

Remove the first TRANSFAC entry (the one without the public version note) and keep only the second one with the `💲` marker.

- [ ] **Step 4: Commit**

```bash
git add README.md
git commit -m "feat: populate Interaction & Network and Expression & Regulation categories (26 entries)"
```

---

### Task 10: Create api-reference.md

**Files:**
- Create: `api-reference.md`

- [ ] **Step 1: Write api-reference.md**

Write the file with detailed API endpoint docs for the ~50 Agent-Ready databases:

```markdown
# API Reference — Agent-Ready Biological Databases

Detailed API endpoints and curl examples for Agent-Ready databases.

## How to Use

Each entry includes:
- **Base URL** — the API root endpoint
- **Auth** — authentication requirements
- **Example** — a working curl command
- **Response format** — JSON, XML, etc.
- **Rate limits** — if documented

## Sequence & Genome APIs

### NCBI E-Utilities (GenBank, RefSeq, Gene, ClinVar, GEO, SRA, Assembly)
- **Base URL:** `https://eutils.ncbi.nlm.nih.gov/entrez/eutils/`
- **Auth:** 🔑 API key recommended (10 req/s without, 10 req/s with key)
- **Example:** `curl "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=nuccore&term=BRCA2[gene]&retmax=3&retmode=json"`
- **Response:** JSON
- **Docs:** https://www.ncbi.nlm.nih.gov/books/NBK25501/

### Ensembl REST API
- **Base URL:** `https://rest.ensembl.org`
- **Auth:** None (rate limited to 15 req/s)
- **Example:** `curl -H "Content-Type: application/json" "https://rest.ensembl.org/lookup/symbol/homo_sapiens/BRCA2?expand=1"`
- **Response:** JSON
- **Docs:** https://rest.ensembl.org

### gnomAD GraphQL API
- **Base URL:** `https://gnomad.broadinstitute.org/api`
- **Auth:** None
- **Example:** `curl -X POST "https://gnomad.broadinstitute.org/api" -H "Content-Type: application/json" -d '{"query":"{ gene(gene_id: \"ENSG00000139618\") { gene_id symbol } }"}'`
- **Response:** JSON
- **Docs:** https://gnomad.broadinstitute.org/api

### ENCODE REST API
- **Base URL:** `https://www.encodeproject.org`
- **Auth:** None
- **Example:** `curl "https://www.encodeproject.org/search/?type=Experiment&limit=3&format=json"`
- **Response:** JSON
- **Docs:** https://www.encodeproject.org/help/rest-api/

### ENA Portal API
- **Base URL:** `https://www.ebi.ac.uk/ena/portal/api`
- **Auth:** None
- **Example:** `curl "https://www.ebi.ac.uk/ena/portal/api/search?result=study&query=taxon%3A9606&limit=3&format=json"`
- **Response:** JSON
- **Docs:** https://www.ebi.ac.uk/ena/portal/api/

### DDBJ REST API
- **Base URL:** `https://ddbj.nig.ac.jp/api`
- **Auth:** None
- **Example:** `curl "https://ddbj.nig.ac.jp/api/v1/accession/NC_000001.fasta"`
- **Response:** FASTA/JSON
- **Docs:** https://www.ddbj.nig.ac.jp/resource/rest-api.html

### UniProt REST API
- **Base URL:** `https://rest.uniprot.org/uniprotkb/`
- **Auth:** None
- **Example:** `curl "https://rest.uniprot.org/uniprotkb/search?query=gene:BRCA2&taxonomy_id=9606&size=3"`
- **Response:** JSON
- **Docs:** https://www.uniprot.org/help/api

### HGNC REST API
- **Base URL:** `https://rest.genenames.org`
- **Auth:** None
- **Example:** `curl -H "Accept: application/json" "https://rest.genenames.org/fetch/symbol/BRCA2"`
- **Response:** JSON
- **Docs:** https://www.genenames.org/help/rest/

### PharmGKB REST API
- **Base URL:** `https://api.pharmgkb.org/v1`
- **Auth:** None
- **Example:** `curl "https://api.pharmgkb.org/v1/data/guideline?view=minimal"`
- **Response:** JSON
- **Docs:** https://dev-pharmgkb.org/docs

## Protein & Structure APIs

### RCSB PDB REST API
- **Base URL:** `https://data.rcsb.org/rest/v1/`
- **Auth:** None
- **Example:** `curl "https://data.rcsb.org/rest/v1/core/entry/4HHB"`
- **Response:** JSON
- **Docs:** https://data.rcsb.org/

### AlphaFold DB API
- **Base URL:** `https://alphafold.ebi.ac.uk/api`
- **Auth:** None
- **Example:** `curl "https://alphafold.ebi.ac.uk/api/prediction/P00519"`
- **Response:** JSON
- **Docs:** https://alphafold.ebi.ac.uk/api-docs

### InterPro API
- **Base URL:** `https://www.ebi.ac.uk/interpro/api/`
- **Auth:** None
- **Example:** `curl "https://www.ebi.ac.uk/interpro/api/entry/InterPro/IPR020422/?format=json"`
- **Response:** JSON
- **Docs:** https://www.ebi.ac.uk/interpro/api/

... (remaining API entries for all Agent-Ready databases)
```

- [ ] **Step 2: Add API entries for remaining Agent-Ready databases**

Continue adding API documentation for each 🤖-rated database across all categories, following the same format. Each entry must include a verified (or testable) curl example.

- [ ] **Step 3: Commit**

```bash
git add api-reference.md
git commit -m "docs: add api-reference.md with Agent-Ready database API details"
```

---

### Task 11: Create check_apis.sh Script and GitHub Actions CI

**Files:**
- Create: `scripts/check_apis.sh`
- Create: `.github/workflows/api-check.yml`

- [ ] **Step 1: Write check_apis.sh**

```bash
#!/bin/bash
# check_apis.sh — Batch API reachability tester for Agent-Ready databases
# Usage: bash scripts/check_apis.sh

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color

TIMEOUT=15
FAILURES=0
TOTAL=0

# Define URLs to check: "Description|URL|ExpectedHTTPCode"
# Expected codes: 200 for GET, sometimes 405/401 is acceptable (needs POST or auth)
ENDPOINTS=(
  "NCBI E-Utilities|https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=nuccore&term=test&retmode=json|200"
  "Ensembl REST|https://rest.ensembl.org/info/ping?content-type=application/json|200"
  "gnomAD GraphQL|https://gnomad.broadinstitute.org/api/|405"
  "ENCODE Portal|https://www.encodeproject.org/search/?type=Experiment&limit=1&format=json|200"
  "ENA Portal API|https://www.ebi.ac.uk/ena/portal/api/search?result=study&query=taxon%3A9606&limit=1&format=json|200"
  "UniProt REST|https://rest.uniprot.org/uniprotkb/search?query=insulin&size=1|200"
  "RCSB PDB|https://data.rcsb.org/rest/v1/core/entry/4HHB|200"
  "AlphaFold DB|https://alphafold.ebi.ac.uk/api/prediction/P00519|200"
  "InterPro API|https://www.ebi.ac.uk/interpro/api/entry/InterPro/IPR020422/?format=json|200"
  "CATH API|https://www.cathdb.info/version/latest/api/rest/pdb/4hhb|200"
  "Human Protein Atlas|https://www.proteinatlas.org/api/search/BRCA2|200"
  "MGnify API|https://www.ebi.ac.uk/metagenomics/api/v1/biomes|200"
  "BacDive API|https://api.bacdive.dsmz.de/fetch/genus/Bacillus|401"
  "KEGG REST|https://rest.kegg.jp/list/pathway/hsa|200"
  "Reactome ContentService|https://reactome.org/ContentService/data/query/PTEN|200"
  "SABIO-RK|http://sabiork.h-its.org/api/search/kineticlaws?q=glucose|200"
  "Rhea API|https://www.rhea-db.org/rhea?query=ATP&format=json|200"
  "PubChem PUG REST|https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/name/aspirin/property/MolecularWeight/JSON|200"
  "ChEMBL API|https://www.ebi.ac.uk/chembl/api/data/molecule/chembl25.json|200"
  "ChEBI Web Services|https://www.ebi.ac.uk/chebi/webServices.do?chebiId=CHEBI:15377|200"
  "ZINC API|https://zinc.docking.org/substances.json?count=1|200"
  "BindingDB API|https://www.bindingdb.org/api/v1/targets/EGFR|200"
  "DGIdb GraphQL|https://dgidb.org/api/graphql|405"
  "ClinVar E-Utilities|https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=clinvar&term=BRCA2&retmode=json|200"
  "DisGeNET API|https://www.disgenet.org/api/gene/disease?gene_id=675|401"
  "ClinicalTrials.gov API v2|https://clinicaltrials.gov/api/v2/studies?query.term=diabetes&pageSize=3|200"
  "cBioPortal API|https://www.cbioportal.org/api/studies|200"
  "HPO API|https://hpo.jax.org/api/hp/terms/HP:0001250|200"
  "GDC API|https://api.gdc.cancer.gov/status|200"
  "Monarch API|https://api.monarchinitiative.org/api/association/disease/OMIM:219700|200"
  "Open Targets GraphQL|https://api.platform.opentargets.org/api/v4/graphql|405"
  "STRING API|https://string-db.org/api/json/network?identifiers=TP53&species=9606|200"
  "BioGRID REST|https://webservice.thebiogrid.org/interactions?geneList=TP53&taxId=9606&accesskey=fake|400"
  "IntAct API|https://www.ebi.ac.uk/intact/ws/psi-mi/interaction/findInteractions?query=BRCA2&format=json|200"
  "PathwayCommons API|https://www.pathwaycommons.org/pc2/search?q=TP53&format=json|200"
  "WikiPathways API|https://webservice.wikipathways.org/listOrganisms|200"
  "GEO E-Utilities|https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=gds&term=cancer&retmode=json|200"
  "GTEx API|https://gtexportal.org/api/v2/dataset/openAccess?pageSize=3|200"
  "Expression Atlas API|https://www.ebi.ac.uk/gxa/api/experiments?limit=3|200"
  "JASPAR API|https://jaspar.genereg.net/api/v1/matrix/MA0001.1/|200"
  "CCLE/DepMap Portal|https://depmap.org/portal/api/downloads|200"
  "Open Targets Genetics|https://api.genetics.opentargets.org/graphql|405"
  "Gramene API|https://www.gramene.org/api/genomes|200"
  "Ensembl Plants REST|https://rest.ensembl.org/info/ping?content-type=application/json|200"
  "CELLxGENE API|https://api.cellxgene.cziscience.com/curation/v1/collections|200"
  "HCA Data Portal|https://service.azul.data.humancellatlas.org/index/collections?size=1|200"
  "Single Cell Expression Atlas|https://www.ebi.ac.uk/gxa/sc/api/experiments?limit=3|200"
  "eQuilibrator API|https://equilibrator.weizmann.ac.il/api/search?query=ATP|200"
)

echo "========================================="
echo "  Bio Database API Reachability Check"
echo "  $(date -u +"%Y-%m-%dT%H:%M:%SZ")"
echo "========================================="
echo ""

for entry in "${ENDPOINTS[@]}"; do
  IFS='|' read -r name url expected_code <<< "$entry"
  TOTAL=$((TOTAL + 1))

  http_code=$(curl -s -o /dev/null -w "%{http_code}" --max-time "$TIMEOUT" "$url" 2>/dev/null || echo "000")

  if [ "$http_code" = "$expected_code" ] || { [ "$expected_code" = "405" ] && [ "$http_code" = "405" ]; } || { [ "$expected_code" = "401" ] && [ "$http_code" = "401" ]; } || { [ "$expected_code" = "400" ] && [ "$http_code" = "400" ]; }; then
    echo -e "  ${GREEN}OK${NC}    ($http_code) $name"
  elif [ "$http_code" = "200" ] && [ "$expected_code" != "200" ]; then
    # Server returned 200 but we expected POST-required — acceptable
    echo -e "  ${YELLOW}WARN${NC}  ($http_code) $name — expected $expected_code, got 200 (OK)"
  else
    echo -e "  ${RED}FAIL${NC}  ($http_code) $name — expected $expected_code"
    FAILURES=$((FAILURES + 1))
  fi
done

echo ""
echo "========================================="
echo "  Results: $((TOTAL - FAILURES))/$TOTAL passed"
echo "========================================="

if [ "$FAILURES" -gt 0 ]; then
  echo "  FAILURES DETECTED: $FAILURES"
  exit 1
else
  echo "  All endpoints reachable"
  exit 0
fi
```

- [ ] **Step 2: Make script executable and test**

```bash
chmod +x scripts/check_apis.sh
bash scripts/check_apis.sh
```

Review output. Any FAIL entries need the URL or expected code fixed.

- [ ] **Step 3: Write GitHub Actions workflow**

Create `.github/workflows/api-check.yml`:

```yaml
name: Weekly API Health Check

on:
  schedule:
    - cron: '0 9 * * 1'  # Every Monday at 9am UTC
  workflow_dispatch:       # Manual trigger

jobs:
  api-check:
    runs-on: ubuntu-latest
    timeout-minutes: 10
    steps:
      - uses: actions/checkout@v4
      - name: Run API reachability checks
        run: bash scripts/check_apis.sh
      - name: Create issue on failure
        if: failure()
        uses: actions/github-script@v7
        with:
          script: |
            const { data: issues } = await github.rest.issues.listForRepo({
              owner: context.repo.owner,
              repo: context.repo.repo,
              state: 'open',
              labels: ['api-health'],
            });
            if (issues.length === 0) {
              await github.rest.issues.create({
                owner: context.repo.owner,
                repo: context.repo.repo,
                title: '[API Health] Some database APIs are unreachable',
                body: 'The weekly API health check detected failures. See the [workflow run](' +
                  `https://github.com/${context.repo.owner}/${context.repo.repo}/actions/runs/${context.runId}` +
                  ') for details.',
                labels: ['api-health', 'bug'],
              });
            }
```

- [ ] **Step 4: Commit**

```bash
git add scripts/check_apis.sh .github/workflows/api-check.yml
git commit -m "ci: add API health check script and weekly GitHub Actions workflow"
```

---

### Task 12: Create CONTRIBUTING.md

**Files:**
- Create: `CONTRIBUTING.md`

- [ ] **Step 1: Write CONTRIBUTING.md**

```markdown
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
```

- [ ] **Step 2: Commit**

```bash
git add CONTRIBUTING.md
git commit -m "docs: add CONTRIBUTING.md with PR template and guidelines"
```

---

### Task 13: Set Up Multi-Language README Files

**Files:**
- Create: `README.zh.md` (Chinese translation)
- Create: `README.ja.md` (Japanese, initial: English placeholder with note soliciting translation)
- Create: `README.ko.md` (Korean, initial: English placeholder with note soliciting translation)

- [ ] **Step 1: Create Chinese README**

Create `README.zh.md` with the same structure as `README.md`, but translate:
- All section headers, TOC items, legend explanations, and footer text
- All database descriptions (but keep the English entry format for the tables — database names/URLs remain English)
- The language switcher badges at the top

The Chinese README should use the same table structure but with Chinese descriptions replacing the English ones in the "Description" column.

- [ ] **Step 2: Create Japanese README placeholder**

Create `README.ja.md`:

```markdown
[![English](https://img.shields.io/badge/lang-en-blue.svg)](README.md)
[![中文](https://img.shields.io/badge/lang-zh-red.svg)](README.zh.md)
[![日本語](https://img.shields.io/badge/lang-ja-green.svg)](README.ja.md)
[![한국어](https://img.shields.io/badge/lang-ko-orange.svg)](README.ko.md)

# Awesome Bio Databases 🤖

> 🚧 **翻訳募集中** — このドキュメントの日本語翻訳にご協力いただける方は、[CONTRIBUTING.md](CONTRIBUTING.md) をご覧ください。

> A curated list of biological databases with **AI Agent-friendliness ratings**.
> Built for AI for Science researchers and developers.

*(The full English version is below. We are seeking Japanese translators to help localize this document.)*

<!-- Include full English README content below as fallback -->
```

- [ ] **Step 3: Create Korean README placeholder**

Same structure as Japanese, but with Korean translation solicitation note.

- [ ] **Step 4: Commit**

```bash
git add README.zh.md README.ja.md README.ko.md
git commit -m "feat: add Chinese README translation, JA/KO translation placeholders"
```

---

### Task 14: Create LICENSE File

**Files:**
- Create: `LICENSE`

- [ ] **Step 1: Write CC0 LICENSE**

```bash
cat > LICENSE << 'EOF'
CC0 1.0 Universal

Statement of Purpose

The laws of most jurisdictions throughout the world automatically confer
exclusive Copyright and Related Rights (defined below) upon the creator and
subsequent owner(s) (each and all, an "owner") of an original work of
authorship and/or a database (each, a "Work").

Certain owners wish to permanently relinquish those rights to a Work for the
purpose of contributing to a commons of creative, cultural and scientific
works ("Commons") that the public can reliably and without fear of later
claims of infringement build upon, modify, incorporate in other works, reuse
and redistribute as freely as possible in any form whatsoever and for any
purposes, including without limitation commercial purposes. These owners may
contribute to the Commons to promote the ideal of a free culture and the
further production of creative, cultural and scientific works, or to gain
reputation or greater distribution for their Work in part through the use and
efforts of others.

For these and/or other purposes and motivations, and without any expectation
of additional consideration or compensation, the person associating CC0 with a
Work (the "Affirmer"), to the extent that he or she is an owner of Copyright
and Related Rights in the Work, voluntarily elects to apply CC0 to the Work
and publicly distribute the Work under its terms, with knowledge of his or her
Copyright and Related Rights in the Work and the meaning and intended legal
effect of CC0 on those rights.

1. Copyright and Related Rights. A Work made available under CC0 may be
protected by copyright and related or neighboring rights ("Copyright and
Related Rights"). Copyright and Related Rights include, but are not limited
to, the following:

  i. the right to reproduce, adapt, distribute, perform, display, communicate,
  and translate a Work;

  ii. moral rights retained by the original author(s) and/or performer(s);

  iii. publicity and privacy rights pertaining to a person's image or likeness
  depicted in a Work;

  iv. rights protecting against unfair competition in regards to a Work,
  subject to the limitations in paragraph 4(a), below;

  v. rights protecting the extraction, dissemination, use and reuse of data in
  a Work;

  vi. database rights (such as those arising under Directive 96/9/EC of the
  European Parliament and of the Council of 11 March 1996 on the legal
  protection of databases, and under any national implementation thereof,
  including any amended or successor version of such directive); and

  vii. other similar, equivalent or corresponding rights throughout the world
  based on applicable law or treaty, and any national implementations thereof.

2. Waiver. To the greatest extent permitted by, but not in contravention of,
applicable law, Affirmer hereby overtly, fully, permanently, irrevocably and
unconditionally waives, abandons, and surrenders all of Affirmer's Copyright
and Related Rights and associated claims and causes of action, whether now
known or unknown (including existing as well as future claims and causes of
action), in the Work (i) in all territories worldwide, (ii) for the maximum
duration provided by applicable law or treaty (including future time
extensions), (iii) in any current or future medium and for any number of
copies, and (iv) for any purpose whatsoever, including without limitation
commercial, advertising or promotional purposes (the "Waiver"). Affirmer makes
the Waiver for the benefit of each member of the public at large and to the
detriment of Affirmer's heirs and successors, fully intending that such Waiver
shall not be subject to revocation, rescission, cancellation, termination, or
any other legal or equitable action to disrupt the quiet enjoyment of the Work
by the public as contemplated by Affirmer's express Statement of Purpose.

3. Public License Fallback. Should any part of the Waiver for any reason be
judged legally invalid or ineffective under applicable law, then the Waiver
shall be preserved to the maximum extent permitted taking into account
Affirmer's express Statement of Purpose. In addition, to the extent the Waiver
is so judged Affirmer hereby grants to each affected person a royalty-free,
non transferable, non sublicensable, non exclusive, irrevocable and
unconditional license to exercise Affirmer's Copyright and Related Rights in
the Work (i) in all territories worldwide, (ii) for the maximum duration
provided by applicable law or treaty (including future time extensions), (iii)
in any current or future medium and for any number of copies, and (iv) for any
purpose whatsoever, including without limitation commercial, advertising or
promotional purposes (the "License"). The License shall be deemed effective as
of the date CC0 was applied by Affirmer to the Work. Should any part of the
License for any reason be judged legally invalid or ineffective under
applicable law, such partial invalidity or ineffectiveness shall not
invalidate the remainder of the License, and in such case Affirmer hereby
affirms that he or she will not (i) exercise any of his or her remaining
Copyright and Related Rights in the Work or (ii) assert any associated claims
and causes of action with respect to the Work, in either case contrary to
Affirmer's express Statement of Purpose.

4. Limitations and Disclaimers.

  a. No trademark or patent rights held by Affirmer are waived, abandoned,
  surrendered, licensed or otherwise affected by this document.

  b. Affirmer offers the Work as-is and makes no representations or warranties
  of any kind concerning the Work, express, implied, statutory or otherwise,
  including without limitation warranties of title, merchantability, fitness
  for a particular purpose, non infringement, or the absence of latent or
  other defects, accuracy, or the present or absence of errors, whether or not
  discoverable, all to the greatest extent permissible under applicable law.

  c. Affirmer disclaims responsibility for clearing rights of other persons
  that may apply to the Work or any use thereof, including without limitation
  any person's Copyright and Related Rights in the Work. Further, Affirmer
  disclaims responsibility for obtaining any necessary consents, permissions
  or other rights required for any use of the Work.

  d. Affirmer understands and acknowledges that Creative Commons is not a
  party to this document and has no duty or obligation with respect to this
  CC0 or use of the Work.

For more information, please see https://creativecommons.org/publicdomain/zero/1.0/
EOF
```

- [ ] **Step 2: Commit**

```bash
git add LICENSE
git commit -m "docs: add CC0 1.0 Universal LICENSE"
```

---

### Task 15: Final Review and README Polish

**Files:**
- Modify: `README.md` (final polish)

- [ ] **Step 1: Review all README content**

Check for:
- [ ] All 10 categories have populated tables
- [ ] No broken URLs or formatting errors
- [ ] Agent ratings are consistent with criteria
- [ ] Language switcher badges present at top
- [ ] TOC links work (they use anchor links matching GitHub's auto-generated anchors)
- [ ] All entries in a category alphabetically ordered (or logically grouped)

- [ ] **Step 2: Fix any issues found**

- [ ] **Step 3: Count total entries and add a badge**

Add after the language switcher, before the quote line:

```markdown
![Databases](https://img.shields.io/badge/databases-~150-blue)
![Categories](https://img.shields.io/badge/categories-10-green)
![Agent Ready](https://img.shields.io/badge/agent--ready-~60%25-brightgreen)
```

- [ ] **Step 4: Final commit**

```bash
git add README.md
git commit -m "polish: final README review, add count badges, fix formatting"
```

---

### Task 16: Create .gitignore

**Files:**
- Create: `.gitignore`

- [ ] **Step 1: Write .gitignore**

```gitignore
# OS files
.DS_Store
Thumbs.db

# Editor files
*.swp
*.swo
*~
.vscode/

# Python
__pycache__/
*.pyc
.venv/

# Temporary files
/tmp/
*.tmp
```

- [ ] **Step 2: Commit**

```bash
git add .gitignore
git commit -m "chore: add .gitignore"
```

---

### Task 17: Verify Entire Repo and Push

**Files:**
- All files reviewed

- [ ] **Step 1: List all tracked files**

```bash
git ls-files
```

Expected output:
```
.github/workflows/api-check.yml
.gitignore
CONTRIBUTING.md
LICENSE
README.ja.md
README.ko.md
README.md
README.zh.md
api-reference.md
docs/superpowers/specs/2026-05-23-awesome-bio-databases-design.md
docs/superpowers/plans/2026-05-23-awesome-bio-databases-plan.md
docs/p0-merged-sources.md
scripts/check_apis.sh
```

- [ ] **Step 2: Final git log review**

```bash
git log --oneline
```

- [ ] **Step 3: README render check**

Review `README.md` in a markdown previewer (or push to GitHub and check the rendered version).

- [ ] **Step 4: Run API check script one final time**

```bash
bash scripts/check_apis.sh
```

Fix any failing endpoints.

- [ ] **Step 5: Commit if any fixes made**

```bash
git add -A && git commit -m "chore: final fixes before v1.0 release"
```

---

## Post-MVP Tasks (Future Iterations)

These are intentionally out of scope for the initial implementation but documented for future:

1. Add minimal query examples per Agent-Ready database (actual data retrieval test)
2. Complete Japanese and Korean translations
3. Add a `data/databases.json` structured data file for programmatic consumption
4. Set up Crowdin GitHub Action for automated translation management
5. Add database update-frequency tracking
6. Create a GitHub Pages site with search/filter functionality
7. Outreach to bioinformatics communities for contributions
