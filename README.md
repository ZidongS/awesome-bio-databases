[![English](https://img.shields.io/badge/lang-en-blue.svg)](README.md)
[![中文](https://img.shields.io/badge/lang-zh-red.svg)](README.zh.md)
[![日本語](https://img.shields.io/badge/lang-ja-green.svg)](README.ja.md)
[![한국어](https://img.shields.io/badge/lang-ko-orange.svg)](README.ko.md)

![Databases](https://img.shields.io/badge/databases-~150-blue)
![Categories](https://img.shields.io/badge/categories-10-green)
![Agent Ready](https://img.shields.io/badge/agent--ready-~60%25-brightgreen)

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

## 🏷️ Legend

| Icon | Meaning | Criteria |
|------|---------|----------|
| 🤖 | **Agent-Ready** | Public REST/GraphQL API + bulk data download available |
| ⚠️ | **Partial** | Either API or download available, but not both |
| ❌ | **Manual** | Web UI only; no API and no bulk download |
| 🔑 | **API Key Required** | Free registration needed for API access (still Agent-Ready) |
| 💲 | **Commercial** | Paid API or data access required (downgraded to Partial) |

## 🧬 Sequence & Genome

| Name | Description | Agent | Links |
|------|-------------|-------|-------|
| 🧬 [DDBJ](https://www.ddbj.nig.ac.jp) | DNA Data Bank of Japan — primary nucleotide sequence archive, part of INSDC with GenBank and ENA | 🤖 | [REST API](https://www.ddbj.nig.ac.jp/resource/rest-api.html), [FTP](https://ftp.ddbj.nig.ac.jp/) |
| 🧬 [ENA](https://www.ebi.ac.uk/ena) | European Nucleotide Archive — comprehensive nucleotide sequence repository at EMBL-EBI | 🤖 | [REST API](https://www.ebi.ac.uk/ena/portal/api/), [FTP](https://ftp.ebi.ac.uk/pub/databases/ena/) |
| 🧬 [ENCODE](https://www.encodeproject.org) | Encyclopedia of DNA Elements — functional genomics data including ChIP-seq, RNA-seq, DNase-seq | 🤖 | [REST API](https://www.encodeproject.org/help/rest-api/), [Downloads](https://www.encodeproject.org/downloads/) |
| 🧬 [Ensembl](https://www.ensembl.org) | Genome browser for vertebrate genomes with gene annotation, variation, and comparative genomics | 🤖 | [REST API](https://rest.ensembl.org), [FTP](https://ftp.ensembl.org/pub/) |
| 🧬 [GenBank](https://www.ncbi.nlm.nih.gov/genbank/) | NIH genetic sequence database — annotated collection of all publicly available DNA sequences | 🤖 | [E-Utilities API](https://www.ncbi.nlm.nih.gov/books/NBK25501/), [FTP](https://ftp.ncbi.nlm.nih.gov/genbank/) |
| 🧬 [GENCODE](https://www.gencodegenes.org) | High-quality reference gene annotation for human and mouse genomes | ⚠️ | [FTP downloads](https://ftp.ebi.ac.uk/pub/databases/gencode/), no API |
| 🧬 [gnomAD](https://gnomad.broadinstitute.org) | Genome aggregation database — exome and whole-genome sequencing data from 140,000+ individuals | 🤖 | [GraphQL API](https://gnomad.broadinstitute.org/api), [Downloads](https://gnomad.broadinstitute.org/downloads) |
| 🧬 [HGNC](https://www.genenames.org) | HUGO Gene Nomenclature Committee — authoritative human gene symbols and names | 🤖 | [REST API](https://www.genenames.org/help/rest/), [Downloads](https://www.genenames.org/download/) |
| 🧬 [NCBI Assembly](https://www.ncbi.nlm.nih.gov/assembly/) | Database of assembled genome sequences with metadata and statistics | 🤖 | [E-Utilities API](https://www.ncbi.nlm.nih.gov/books/NBK25501/), [FTP](https://ftp.ncbi.nlm.nih.gov/genomes/) |
| 🧬 [NCBI Gene](https://www.ncbi.nlm.nih.gov/gene) | Integrative gene-centric information from NCBI including sequence, variation, and expression | 🤖 | [E-Utilities API](https://www.ncbi.nlm.nih.gov/books/NBK25501/), [FTP](https://ftp.ncbi.nlm.nih.gov/gene/) |
| 🧬 [PharmGKB](https://www.pharmgkb.org) | Pharmacogenomics knowledge base — genetic variation impact on drug response | 🤖 | [REST API](https://api.pharmgkb.org), [Downloads](https://www.pharmgkb.org/downloads) |
| 🧬 [RefSeq](https://www.ncbi.nlm.nih.gov/refseq/) | NCBI reference sequence database — curated, non-redundant set of sequences for genomic, transcript, and protein | 🤖 | [E-Utilities API](https://www.ncbi.nlm.nih.gov/books/NBK25501/), [FTP](https://ftp.ncbi.nlm.nih.gov/refseq/) |
| 🧬 [SRA](https://www.ncbi.nlm.nih.gov/sra) | Sequence Read Archive — raw sequencing reads from high-throughput sequencing platforms | 🤖 | [E-Utilities API](https://www.ncbi.nlm.nih.gov/books/NBK25501/), [FTP](https://ftp.ncbi.nlm.nih.gov/sra/) |
| 🧬 [T2T Genome](https://github.com/marbl/CHM13) | Telomere-to-Telomere consortium — complete human genome assembly (CHM13) | ⚠️ | [Downloads](https://s3-us-west-2.amazonaws.com/human-pangenomics/index.html), no API |
| 🧬 [UCSC Genome Browser](https://genome.ucsc.edu) | Interactive genome browser with comprehensive annotation tracks for human and model organisms | ⚠️ | [REST API](https://genome.ucsc.edu/goldenPath/help/api.html), [FTP downloads](https://hgdownload.soe.ucsc.edu/) |
| 🧬 [UniProt](https://www.uniprot.org) | Comprehensive protein sequence and functional information database | 🤖 | [REST API](https://www.uniprot.org/help/api), [FTP](https://ftp.uniprot.org/pub/databases/uniprot/) |
