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

## 🧪 Protein & Structure

| Name | Description | Agent | Links |
|------|-------------|-------|-------|
| 🧪 [AlphaFold DB](https://alphafold.ebi.ac.uk) | Predicted protein structures for 200M+ proteins from AlphaFold2, hosted by EMBL-EBI | 🤖 | [API docs](https://alphafold.ebi.ac.uk/api-docs), [Bulk download](https://ftp.ebi.ac.uk/pub/databases/alphafold/) |
| 🧪 [CATH](https://www.cathdb.info) | Hierarchical classification of protein domain structures (Class, Architecture, Topology, Homology) | 🤖 | [REST API](https://www.cathdb.info/wiki/doku.php?id=api:rest_api), [Downloads](https://www.cathdb.info/download) |
| 🧪 [ELM](http://elm.eu.org) | Eukaryotic Linear Motif resource — curated short linear motifs in eukaryotic proteins | ⚠️ | [Downloads](http://elm.eu.org/downloads), web API limited |
| 🧪 [Human Protein Atlas](https://www.proteinatlas.org) | Protein expression across human tissues, cells, and cancer — immunohistochemistry and RNA-seq based | 🤖 | [REST API](https://www.proteinatlas.org/about/api), [Downloads](https://www.proteinatlas.org/about/download) |
| 🧪 [InterPro](https://www.ebi.ac.uk/interpro/) | Integrative protein domain and family classification combining Pfam, PROSITE, SMART, and more | 🤖 | [REST API](https://www.ebi.ac.uk/interpro/api/), [FTP](https://ftp.ebi.ac.uk/pub/databases/interpro/) |
| 🧪 [MobiDB](https://mobidb.org) | Database of intrinsically disordered proteins and protein disorder annotations | 🤖 | [REST API](https://mobidb.org/api_docs), [Downloads](https://mobidb.org/download) |
| 🧪 [PDB](https://www.rcsb.org) | Worldwide Protein Data Bank — 3D structural data of proteins and nucleic acids | 🤖 | [REST API](https://data.rcsb.org/), [FTP download](https://ftp.wwpdb.org) |
| 🧪 [Pfam](https://www.ebi.ac.uk/interpro/entry/pfam/) | Protein families database — multiple sequence alignments and hidden Markov models (now part of InterPro) | 🤖 | [InterPro API](https://www.ebi.ac.uk/interpro/api/), [FTP](https://ftp.ebi.ac.uk/pub/databases/Pfam/) |
| 🧪 [PROSITE](https://prosite.expasy.org) | Database of protein domains, families, and functional sites with associated patterns and profiles | ⚠️ | [Downloads via FTP](https://ftp.expasy.org/databases/prosite/), no public API |
| 🧪 [SAbDab](https://opig.stats.ox.ac.uk/webapps/sabdab-sabpred/sabdab) | Structural Antibody Database — all publicly available antibody structures with annotations | 🤖 | [REST API](https://opig.stats.ox.ac.uk/webapps/sabdab-sabpred/sabdab/api/), [Downloads](https://opig.stats.ox.ac.uk/webapps/sabdab-sabpred/sabdab/downloads) |
| 🧪 [SCOP](https://scop.mrc-lmb.cam.ac.uk) | Structural Classification of Proteins — hierarchical classification of protein folds and families | ⚠️ | [Downloads](https://scop.mrc-lmb.cam.ac.uk/downloads), web API limited |
| 🧪 [SWISS-MODEL Repository](https://swissmodel.expasy.org/repository) | Homology-modelled protein structures for model organism proteomes | 🤖 | [REST API](https://swissmodel.expasy.org/docs/repository_help#api), [Downloads](https://swissmodel.expasy.org/repository) |

## 🌿 Plants

| Name | Description | Agent | Links |
|------|-------------|-------|-------|
| 🌿 [BAR](https://bar.utoronto.ca) | Bio-Analytic Resource for Plant Biology — Arabidopsis tools, expression data, and interaction viewers | ⚠️ | [Downloads](https://bar.utoronto.ca/), mostly web-based |
| 🌿 [Ensembl Plants](https://plants.ensembl.org) | Ensembl genome browser specialized for plant genomes (67+ species) | 🤖 | [REST API](https://rest.ensembl.org), [FTP](https://ftp.ensemblgenomes.ebi.ac.uk/pub/plants/) |
| 🌿 [Gramene](https://www.gramene.org) | Comparative plant genomics and pathway resource for crop plants (rice, maize, wheat, etc.) | 🤖 | [REST API](https://www.gramene.org/api), [Downloads](https://www.gramene.org/download) |
| 🌿 [MaizeGDB](https://www.maizegdb.org) | Maize genetics and genomics database — comprehensive resource for Zea mays | ⚠️ | [Downloads](https://www.maizegdb.org/download), API limited |
| 🌿 [Phytozome](https://phytozome-next.jgi.doe.gov) | Plant comparative genomics portal — 100+ assembled plant genomes with annotations | ⚠️ | [Bulk download](https://phytozome-next.jgi.doe.gov/download), no public REST API |
| 🌿 [Plant Reactome](https://plantreactome.gramene.org) | Curated plant metabolic and signaling pathways in Reactome framework | 🤖 | [ContentService API](https://reactome.org/ContentService/), [Downloads](https://plantreactome.gramene.org/download) |
| 🌿 [PlantGDB](https://www.plantgdb.org) | Plant Genome Database — EST assemblies, genome browsers for diverse plant species | ⚠️ | [FTP downloads](https://www.plantgdb.org/download/), no API |
| 🌿 [PlantTFDB](https://planttfdb.gao-lab.org) | Plant Transcription Factor Database — curated TFs across 165 plant species | ⚠️ | [Downloads](https://planttfdb.gao-lab.org/download.php), web-based only |
| 🌿 [PLAZA](https://bioinformatics.psb.ugent.be/plaza/) | Plant comparative genomics platform with gene families, orthology, and synteny across species | ⚠️ | [Bulk downloads](https://bioinformatics.psb.ugent.be/plaza/download/), no API |
| 🌿 [PlncRNADB](https://www.plncrnadb.com) | Plant long non-coding RNA database with expression profiles, epigenetic marks, and functional annotations | ❌ | Web-based with search |
| 🌿 [RAP-DB](https://rapdb.dna.affrc.go.jp) | Rice Annotation Project Database — high-quality annotation of the rice genome (Oryza sativa) | ⚠️ | [Downloads](https://rapdb.dna.affrc.go.jp/download/), no API |
| 🌿 [SoyBase](https://www.soybase.org) | Soybean genetics and genomics database for Glycine max | ⚠️ | [Downloads](https://www.soybase.org/dl/), no public API |
| 🌿 [TAIR](https://www.arabidopsis.org) | The Arabidopsis Information Resource — comprehensive model plant database for Arabidopsis thaliana | ⚠️ | [REST API](https://www.arabidopsis.org/tools/araport/), bulk download via request |
| 🌿 [WheatOmics](http://wheatomics.sdau.edu.cn) | Wheat multi-omics database — transcriptome, proteome, metabolome for Triticum aestivum | ❌ | Web-based query only |
