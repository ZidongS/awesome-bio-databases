[![English](https://img.shields.io/badge/lang-en-blue.svg)](README.md)
[![中文](https://img.shields.io/badge/lang-zh-red.svg)](README.zh.md)
[![日本語](https://img.shields.io/badge/lang-ja-green.svg)](README.ja.md)
[![한국어](https://img.shields.io/badge/lang-ko-orange.svg)](README.ko.md)

![Databases](https://img.shields.io/badge/databases-~150-blue)
![Categories](https://img.shields.io/badge/categories-10-green)
![Agent Ready](https://img.shields.io/badge/agent--ready-~60%25-brightgreen)

# Awesome Bio Databases 🤖

> 一个带有 **AI Agent 友好性评级** 的生物数据库精选列表。
> 为 AI for Science 研究者和开发者构建。欢迎贡献！

## 📋 目录

- [🏷️ 图例](#-图例)
- [🧬 序列与基因组](#-序列与基因组)
- [🧪 蛋白与结构](#-蛋白与结构)
- [🌿 植物](#-植物)
- [🦠 微生物与病毒](#-微生物与病毒)
- [🔬 单细胞](#-单细胞)
- [⚗️ 酶与代谢](#-酶与代谢)
- [💊 化合物与药物](#-化合物与药物)
- [🏥 疾病与临床](#-疾病与临床)
- [🔗 互作与网络](#-互作与网络)
- [📊 表达与调控](#-表达与调控)
- [🤝 贡献指南](#-贡献指南)
- [📡 API 参考](#-api-参考)
- [📜 许可证](#-许可证)

## 🏷️ 图例

| 图标 | 含义 | 标准 |
|------|------|------|
| 🤖 | **Agent 就绪** | 公开 REST/GraphQL API + 批量数据下载 |
| ⚠️ | **部分可用** | 有 API 或下载其一，但非两者兼备 |
| ❌ | **仅手动** | 仅提供网页界面；无 API 无批量下载 |
| 🔑 | **需要 API Key** | 需要免费注册获取 API 访问（仍为 Agent 就绪） |
| 💲 | **商业付费** | 需要付费 API 或数据访问（降级为部分可用） |

## 🧬 序列与基因组

| 名称 | 描述 | Agent | 链接 |
|------|------|-------|------|
| 🧬 [DDBJ](https://www.ddbj.nig.ac.jp) | 日本DNA数据库 — 主要核苷酸序列档案库，与 GenBank 和 ENA 同为 INSDC 成员 | 🤖 | [REST API](https://www.ddbj.nig.ac.jp/resource/rest-api.html), [FTP](https://ftp.ddbj.nig.ac.jp/) |
| 🧬 [ENA](https://www.ebi.ac.uk/ena) | 欧洲核苷酸档案库 — EMBL-EBI 的综合核苷酸序列存储库 | 🤖 | [REST API](https://www.ebi.ac.uk/ena/portal/api/), [FTP](https://ftp.ebi.ac.uk/pub/databases/ena/) |
| 🧬 [ENCODE](https://www.encodeproject.org) | DNA元件百科全书 — 功能基因组数据，包括 ChIP-seq、RNA-seq、DNase-seq | 🤖 | [REST API](https://www.encodeproject.org/help/rest-api/), [下载](https://www.encodeproject.org/downloads/) |
| 🧬 [Ensembl](https://www.ensembl.org) | 脊椎动物基因组浏览器，提供基因注释、变异和比较基因组学 | 🤖 | [REST API](https://rest.ensembl.org), [FTP](https://ftp.ensembl.org/pub/) |
| 🧬 [GenBank](https://www.ncbi.nlm.nih.gov/genbank/) | NIH 遗传序列数据库 — 所有公开可用 DNA 序列的带注释集合 | 🤖 | [E-Utilities API](https://www.ncbi.nlm.nih.gov/books/NBK25501/), [FTP](https://ftp.ncbi.nlm.nih.gov/genbank/) |
| 🧬 [GENCODE](https://www.gencodegenes.org) | 人类和小鼠基因组的高质量参考基因注释 | ⚠️ | [FTP 下载](https://ftp.ebi.ac.uk/pub/databases/gencode/), 无 API |
| 🧬 [gnomAD](https://gnomad.broadinstitute.org) | 基因组聚合数据库 — 来自 140,000+ 个体的外显子和全基因组测序数据 | 🤖 | [GraphQL API](https://gnomad.broadinstitute.org/api), [下载](https://gnomad.broadinstitute.org/downloads) |
| 🧬 [HGNC](https://www.genenames.org) | HUGO 基因命名委员会 — 权威的人类基因符号和名称 | 🤖 | [REST API](https://www.genenames.org/help/rest/), [下载](https://www.genenames.org/download/) |
| 🧬 [NCBI Assembly](https://www.ncbi.nlm.nih.gov/assembly/) | 组装基因组序列数据库，含元数据和统计信息 | 🤖 | [E-Utilities API](https://www.ncbi.nlm.nih.gov/books/NBK25501/), [FTP](https://ftp.ncbi.nlm.nih.gov/genomes/) |
| 🧬 [NCBI Gene](https://www.ncbi.nlm.nih.gov/gene) | NCBI 基因中心整合信息，包括序列、变异和表达 | 🤖 | [E-Utilities API](https://www.ncbi.nlm.nih.gov/books/NBK25501/), [FTP](https://ftp.ncbi.nlm.nih.gov/gene/) |
| 🧬 [PharmGKB](https://www.pharmgkb.org) | 药物基因组学知识库 — 遗传变异对药物反应的影响 | 🤖 | [REST API](https://api.pharmgkb.org), [下载](https://www.pharmgkb.org/downloads) |
| 🧬 [RefSeq](https://www.ncbi.nlm.nih.gov/refseq/) | NCBI 参考序列数据库 — 基因组、转录本和蛋白的策划非冗余序列集 | 🤖 | [E-Utilities API](https://www.ncbi.nlm.nih.gov/books/NBK25501/), [FTP](https://ftp.ncbi.nlm.nih.gov/refseq/) |
| 🧬 [SRA](https://www.ncbi.nlm.nih.gov/sra) | 序列读取档案 — 高通量测序平台的原始测序读数 | 🤖 | [E-Utilities API](https://www.ncbi.nlm.nih.gov/books/NBK25501/), [FTP](https://ftp.ncbi.nlm.nih.gov/sra/) |
| 🧬 [T2T Genome](https://github.com/marbl/CHM13) | 端粒到端粒联盟 — 完整的人类基因组组装 (CHM13) | ⚠️ | [下载](https://s3-us-west-2.amazonaws.com/human-pangenomics/index.html), 无 API |
| 🧬 [UCSC Genome Browser](https://genome.ucsc.edu) | 交互式基因组浏览器，提供人类和模式生物的全面注释轨道 | ⚠️ | [REST API](https://genome.ucsc.edu/goldenPath/help/api.html), [FTP 下载](https://hgdownload.soe.ucsc.edu/) |
| 🧬 [UniProt](https://www.uniprot.org) | 全面的蛋白质序列和功能信息数据库 | 🤖 | [REST API](https://www.uniprot.org/help/api), [FTP](https://ftp.uniprot.org/pub/databases/uniprot/) |

## 🧪 蛋白与结构

| 名称 | 描述 | Agent | 链接 |
|------|------|-------|------|
| 🧪 [AlphaFold DB](https://alphafold.ebi.ac.uk) | AlphaFold2 预测的 2亿+ 蛋白质结构，由 EMBL-EBI 托管 | 🤖 | [API 文档](https://alphafold.ebi.ac.uk/api-docs), [批量下载](https://ftp.ebi.ac.uk/pub/databases/alphafold/) |
| 🧪 [CATH](https://www.cathdb.info) | 蛋白质结构域的分层分类（类、架构、拓扑、同源性） | 🤖 | [REST API](https://www.cathdb.info/wiki/doku.php?id=api:rest_api), [下载](https://www.cathdb.info/download) |
| 🧪 [ELM](http://elm.eu.org) | 真核生物线性基序资源 — 真核蛋白中策划的短线性基序 | ⚠️ | [下载](http://elm.eu.org/downloads), Web API 有限 |
| 🧪 [Human Protein Atlas](https://www.proteinatlas.org) | 人类组织、细胞和癌症中蛋白质表达 — 基于免疫组化和 RNA-seq | 🤖 | [REST API](https://www.proteinatlas.org/about/api), [下载](https://www.proteinatlas.org/about/download) |
| 🧪 [InterPro](https://www.ebi.ac.uk/interpro/) | 整合蛋白结构域和家族分类，结合 Pfam、PROSITE、SMART 等 | 🤖 | [REST API](https://www.ebi.ac.uk/interpro/api/), [FTP](https://ftp.ebi.ac.uk/pub/databases/interpro/) |
| 🧪 [MobiDB](https://mobidb.org) | 内在无序蛋白和蛋白质无序注释数据库 | 🤖 | [REST API](https://mobidb.org/api_docs), [下载](https://mobidb.org/download) |
| 🧪 [PDB](https://www.rcsb.org) | 全球蛋白质数据库 — 蛋白质和核酸的 3D 结构数据 | 🤖 | [REST API](https://data.rcsb.org/), [FTP 下载](https://ftp.wwpdb.org) |
| 🧪 [Pfam](https://www.ebi.ac.uk/interpro/entry/pfam/) | 蛋白质家族数据库 — 多序列比对和隐马尔可夫模型（现已并入 InterPro） | 🤖 | [InterPro API](https://www.ebi.ac.uk/interpro/api/), [FTP](https://ftp.ebi.ac.uk/pub/databases/Pfam/) |
| 🧪 [PROSITE](https://prosite.expasy.org) | 蛋白质结构域、家族和功能位点数据库，含相关模式和谱 | ⚠️ | [FTP 下载](https://ftp.expasy.org/databases/prosite/), 无公开 API |
| 🧪 [SAbDab](https://opig.stats.ox.ac.uk/webapps/sabdab-sabpred/sabdab) | 结构抗体数据库 — 所有公开可用的抗体结构及注释 | 🤖 | [REST API](https://opig.stats.ox.ac.uk/webapps/sabdab-sabpred/sabdab/api/), [下载](https://opig.stats.ox.ac.uk/webapps/sabdab-sabpred/sabdab/downloads) |
| 🧪 [SCOP](https://scop.mrc-lmb.cam.ac.uk) | 蛋白质结构分类 — 蛋白质折叠和家族的分层分类 | ⚠️ | [下载](https://scop.mrc-lmb.cam.ac.uk/downloads), Web API 有限 |
| 🧪 [SWISS-MODEL Repository](https://swissmodel.expasy.org/repository) | 模式生物蛋白质组的同源建模蛋白质结构 | 🤖 | [REST API](https://swissmodel.expasy.org/docs/repository_help#api), [下载](https://swissmodel.expasy.org/repository) |

*(以下分类内容正在翻译中，欢迎贡献。参见 [CONTRIBUTING.md](CONTRIBUTING.md) 了解如何参与翻译。)*

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

## 🦠 Microbes & Viruses

| Name | Description | Agent | Links |
|------|-------------|-------|-------|
| 🦠 [BacDive](https://bacdive.dsmz.de) | Bacterial Diversity database — standardized metadata for 90,000+ bacterial and archaeal strains | 🤖 | [REST API](https://api.bacdive.dsmz.de/), [Downloads](https://bacdive.dsmz.de/download) 🔑 |
| 🦠 [BV-BRC](https://www.bv-brc.org) | Bacterial and Viral Bioinformatics Resource Center — integrated genomic and metadata for pathogens | 🤖 | [REST API](https://www.bv-brc.org/api), [Downloads](https://www.bv-brc.org/downloads) |
| 🦠 [CARD](https://card.mcmaster.ca) | Comprehensive Antibiotic Resistance Database — curated resistance genes and mechanisms | 🤖 | [REST API](https://card.mcmaster.ca/api), [Downloads](https://card.mcmaster.ca/download) |
| 🦠 [GISAID](https://gisaid.org) | Global Initiative on Sharing All Influenza Data — viral genome sequences (notably SARS-CoV-2 and influenza) | ⚠️ | 🔑 API requires registration and agreement; [Data access](https://gisaid.org/register/) |
| 🦠 [Greengenes2](https://greengenes2.ucsd.edu) | Updated 16S rRNA reference database with whole-genome-enhanced taxonomy | 🤖 | [Downloads + API via Qiita/FTP](https://ftp.microbio.me/greengenes_release/) |
| 🦠 [IMG/M](https://img.jgi.doe.gov) | Integrated Microbial Genomes & Microbiomes — JGI's metagenome analysis platform | ⚠️ | [REST API](https://img.jgi.doe.gov/docs/api), data download via JGI portal |
| 🦠 [MGnify](https://www.ebi.ac.uk/metagenomics) | EBI metagenomics resource — free analysis and archiving of microbiome-derived sequences | 🤖 | [REST API](https://www.ebi.ac.uk/metagenomics/api/), [Downloads](https://www.ebi.ac.uk/metagenomics/download) |
| 🦠 [MicrobiomeDB](https://microbiomedb.org) | Multi-omics microbiome data warehouse with integrated analysis tools | ⚠️ | [Downloads](https://microbiomedb.org/mbio/app/record/dataset), API limited |
| 🦠 [SILVA](https://www.arb-silva.de) | Comprehensive ribosomal RNA gene database for all three domains of life | ⚠️ | [Downloads](https://www.arb-silva.de/download/), no public API |
| 🦠 [VFDB](http://www.mgc.ac.cn/VFs/) | Virulence Factor Database — experimentally validated bacterial virulence factors | ⚠️ | [Downloads](http://www.mgc.ac.cn/VFs/download.htm), web-based API |
| 🦠 [ViPR](https://www.viprbrc.org) | Virus Pathogen Resource — integrated data for human pathogenic viruses | ⚠️ | [Downloads](https://www.viprbrc.org/brc/publicData.spg), API via BV-BRC |

## 🔬 Single Cell

| Name | Description | Agent | Links |
|------|-------------|-------|-------|
| 🔬 [Azimuth](https://azimuth.hubmapconsortium.org) | Reference-based automated cell type annotation for single-cell data | 🤖 | [API via R/Python packages](https://azimuth.hubmapconsortium.org/references/), [Downloads](https://azimuth.hubmapconsortium.org/references/) |
| 🔬 [CZ CELLxGENE](https://cellxgene.cziscience.com) | Chan Zuckerberg Initiative single-cell data platform — standardized scRNA-seq datasets with cell annotation | 🤖 | [REST API](https://api.cellxgene.cziscience.com/curation/v1/), [Downloads](https://cellxgene.cziscience.com/datasets) |
| 🔬 [DISCO](https://www.immunesinglecell.org) | Database of Immune Cell eQTLs, scRNA-seq, and cell-type expression profiles in immune cells | ⚠️ | [Downloads](https://www.immunesinglecell.org/download), web-based |
| 🔬 [Human Cell Atlas](https://www.humancellatlas.org) | International open atlas of all human cells — single-cell reference maps across tissues | 🤖 | [Data Portal API](https://data.humancellatlas.org/apis/api-documentation), [Downloads](https://data.humancellatlas.org/explore/projects) |
| 🔬 [JingleBells](https://jinglebells.bgu.ac.il) | Standardized scRNA-seq datasets in BAM format for benchmarking immune repertoire analysis | ⚠️ | [Downloads](https://jinglebells.bgu.ac.il/), no API |
| 🔬 [PanglaoDB](https://panglaodb.se) | Single-cell transcriptomics resource for mouse and human — cell type markers and expression data | ⚠️ | [Downloads](https://panglaodb.se/data_release.html), no API |
| 🔬 [scRNASeqDB](https://bioinfo.uth.edu/scrnaseqdb/) | Human single-cell RNA-seq gene expression profiles across conditions and cell types | ❌ | Web-based query only |
| 🔬 [Single Cell Expression Atlas](https://www.ebi.ac.uk/gxa/sc/home) | EMBL-EBI single-cell expression atlas — standardized reprocessing of scRNA-seq datasets | 🤖 | [REST API](https://www.ebi.ac.uk/gxa/sc/api/), [Downloads](https://www.ebi.ac.uk/gxa/sc/experiments) |
| 🔬 [Single Cell Portal](https://singlecell.broadinstitute.org/single_cell) | Broad Institute's single-cell data portal — curated scRNA-seq studies | ⚠️ | [API](https://singlecell.broadinstitute.org/single_cell/api/v1/), downloads per study |
| 🔬 [Tabula Sapiens](https://tabula-sapiens-portal.ds.czbiohub.org) | Cell atlas of human tissues — ~500,000 cells across 24 organs with deep annotation | ⚠️ | [Downloads](https://tabula-sapiens-portal.ds.czbiohub.org/data), limited API |
| 🔬 [TISCH](http://tisch.comp-genomics.org) | Tumor microenvironment single-cell atlas — 2M+ cells from 79 cancer types | ⚠️ | [Downloads](http://tisch.comp-genomics.org/download/), API via gene search |
| 🔬 [TISSUES](https://tissues.jensenlab.org) | Tissue-disease-gene associations integrating transcriptomics, proteomics, and text mining | ⚠️ | [Downloads](https://tissues.jensenlab.org/Downloads), no API |

## ⚗️ Enzymes & Metabolism

| Name | Description | Agent | Links |
|------|-------------|-------|-------|
| ⚗️ [BioCyc](https://biocyc.org) | Collection of 20,000+ Pathway/Genome Databases for sequenced organisms with metabolic reconstructions | ⚠️ | [REST API](https://biocyc.org/api), API key required; downloads limited |
| ⚗️ [BRENDA](https://www.brenda-enzymes.org) | Comprehensive enzyme information system — 40+ million data points on enzyme function, kinetics, and structure | ⚠️ | [SOAP API](https://www.brenda-enzymes.org/soap), bulk download via academic license only |
| ⚗️ [CAZy](http://www.cazy.org) | Carbohydrate-Active enZYmes database — classification of glycoside hydrolases, transferases, etc. | ⚠️ | [Downloads via FTP request](http://www.cazy.org/Download/), no public API |
| ⚗️ [eQuilibrator](https://equilibrator.weizmann.ac.il) | Biochemical thermodynamics calculator with reaction Gibbs free energies | 🤖 | [REST API](https://equilibrator.weizmann.ac.il/api), [Downloads](https://gitlab.com/equilibrator/equilibrator-data) |
| ⚗️ [ExPASy ENZYME](https://enzyme.expasy.org) | Swiss-Prot enzyme nomenclature database — EC numbers, names, reactions, and cofactors | ⚠️ | [Downloads via FTP](https://ftp.expasy.org/databases/enzyme/), no API |
| ⚗️ [HMDB](https://hmdb.ca) | Human Metabolome Database — comprehensive metabolite information with links to pathways and enzymes | ⚠️ | [Downloads](https://hmdb.ca/downloads), no public API |
| ⚗️ [IntEnz](https://www.ebi.ac.uk/intenz/) | Integrated relational Enzyme database — official IUBMB enzyme nomenclature with cross-references | ⚠️ | [FTP downloads](https://ftp.ebi.ac.uk/pub/databases/intenz/), SOAP API deprecated |
| ⚗️ [KEGG](https://www.genome.jp/kegg/) | Kyoto Encyclopedia of Genes and Genomes — integrated pathway, drug, disease, and genomic resource | 🤖 | [REST API](https://www.kegg.jp/kegg/rest/), [FTP](https://www.genome.jp/kegg/download/) 💲 |
| ⚗️ [Lipid Maps](https://www.lipidmaps.org/databases/lmsd/overview) | LIPID MAPS Structure Database — curated lipid structures, classifications, and annotations | ⚠️ | [Downloads](https://www.lipidmaps.org/databases/lmsd/download), API limited |
| ⚗️ [MetaCyc](https://metacyc.org) | Comprehensive curated database of experimentally elucidated metabolic pathways across all domains | ⚠️ | [Downloads](https://metacyc.org/downloads.shtml), API via Pathway Tools 💲 |
| ⚗️ [Reactome](https://reactome.org) | Curated open-source pathway database for human biological processes | 🤖 | [ContentService API](https://reactome.org/ContentService/), [Downloads](https://reactome.org/download-data) |
| ⚗️ [Rhea](https://www.rhea-db.org) | Curated database of biochemical reactions — reaction participants, stoichiometry, and cross-references | 🤖 | [REST API](https://www.rhea-db.org/api), [Downloads](https://www.rhea-db.org/download) |
| ⚗️ [SABIO-RK](http://sabiork.h-its.org) | Curated database of biochemical reaction kinetics — kinetic parameters, rate equations, and conditions | 🤖 | [REST API](http://sabiork.h-its.org/api/), [Downloads](http://sabiork.h-its.org/download) |

## 💊 Compounds & Drugs

| Name | Description | Agent | Links |
|------|-------------|-------|-------|
| 💊 [BindingDB](https://www.bindingdb.org) | Public database of measured binding affinities for protein-ligand, protein-protein interactions | 🤖 | [REST API](https://www.bindingdb.org/api/v1/), [Downloads](https://www.bindingdb.org/rwd/bind/chemsearch/marvin/Download.jsp) |
| 💊 [ChEBI](https://www.ebi.ac.uk/chebi/) | Chemical Entities of Biological Interest — dictionary of small chemical compounds | 🤖 | [REST API](https://www.ebi.ac.uk/chebi/webServices.do), [FTP](https://ftp.ebi.ac.uk/pub/databases/chebi/) |
| 💊 [ChEMBL](https://www.ebi.ac.uk/chembl/) | Manually curated database of bioactive molecules with drug-like properties and associated bioactivity data | 🤖 | [REST API](https://www.ebi.ac.uk/chembl/api/data/), [Downloads](https://ftp.ebi.ac.uk/pub/databases/chembl/) |
| 💊 [DGIdb](https://www.dgidb.org) | Drug-Gene Interaction database — 40,000+ drug-gene interactions from 30+ sources | 🤖 | [GraphQL API](https://dgidb.org/api), [Downloads](https://www.dgidb.org/downloads) |
| 💊 [Drug Repurposing Hub](https://clue.io/repurposing) | Broad Institute's annotated collection of approved and investigational drugs for repurposing studies | 🤖 | [Downloads](https://clue.io/repurposing#download-data), API via CLUE 🔑 |
| 💊 [DrugBank](https://go.drugbank.com) | Comprehensive drug knowledgebase — 500,000+ drug entries with targets, pathways, and interactions | ⚠️ | [Downloads](https://go.drugbank.com/releases/latest) (free for academic use), API restricted 💲 |
| 💊 [Open Targets Platform](https://platform.opentargets.org) | Comprehensive target-disease association evidence from genetics, omics, and literature | 🤖 | [GraphQL API](https://api.platform.opentargets.org/api/v4/graphql), [Downloads](https://platform.opentargets.org/downloads) |
| 💊 [PDBbind](http://www.pdbbind.org.cn) | Curated database of experimentally measured binding affinities for protein-ligand complexes | ⚠️ | [Downloads](http://www.pdbbind.org.cn/download.php) (registration required) |
| 💊 [PubChem](https://pubchem.ncbi.nlm.nih.gov) | World's largest public chemistry database — 115M+ compounds with bioactivity, safety, and literature data | 🤖 | [PUG REST API](https://pubchem.ncbi.nlm.nih.gov/docs/pug-rest), [FTP](https://ftp.ncbi.nlm.nih.gov/pubchem/) |
| 💊 [SMPDB](https://smpdb.ca) | Small Molecule Pathway Database — interactive metabolic and signaling pathway diagrams | ⚠️ | [Downloads](https://smpdb.ca/downloads), no API |
| 💊 [STITCH](http://stitch.embl.de) | Search Tool for Interacting Chemicals — known and predicted chemical-protein interactions | ⚠️ | [Downloads](http://stitch.embl.de/cgi/download.pl), API via STRING |
| 💊 [SuperDRUG2](http://cheminfo.charite.de/superdrug2) | Comprehensive database of approved and marketed drugs with their targets and side effects | ❌ | Web-based search and download |
| 💊 [ZINC](https://zinc.docking.org) | Free database of commercially available compounds for virtual screening — 1.5B+ purchasable molecules | 🤖 | [REST API](https://zinc.docking.org/api/), [Downloads](https://zinc.docking.org/substances/home/) |

## 🏥 Disease & Clinical

| Name | Description | Agent | Links |
|------|-------------|-------|-------|
| 🏥 [cBioPortal](https://www.cbioportal.org) | Open-source platform for interactive exploration of cancer genomics datasets from large-scale studies | 🤖 | [REST API](https://www.cbioportal.org/api/swagger-ui.html), [Downloads](https://www.cbioportal.org/datasets) |
| 🏥 [ClinicalTrials.gov](https://clinicaltrials.gov) | NIH registry of clinical trials worldwide — 450,000+ studies in 220+ countries | 🤖 | [REST API v2](https://clinicaltrials.gov/api/v2/), [Downloads](https://clinicaltrials.gov/ct2/download) |
| 🏥 [ClinVar](https://www.ncbi.nlm.nih.gov/clinvar/) | NCBI database of clinically significant human genetic variants with assertions of pathogenicity | 🤖 | [E-Utilities API](https://www.ncbi.nlm.nih.gov/books/NBK25501/), [FTP](https://ftp.ncbi.nlm.nih.gov/pub/clinvar/) |
| 🏥 [COSMIC](https://cancer.sanger.ac.uk/cosmic) | Catalogue of Somatic Mutations in Cancer — comprehensive somatic mutation database | ⚠️ | [Downloads](https://cancer.sanger.ac.uk/cosmic/download) (registration + license required) |
| 🏥 [DepMap](https://depmap.org) | Cancer Dependency Map — genome-scale CRISPR and RNAi screens across 1,000+ cancer cell lines | 🤖 | [Downloads + Portal](https://depmap.org/portal/download/all/), API via data files |
| 🏥 [DisGeNET](https://www.disgenet.org) | Knowledge platform integrating gene-disease associations, variant-disease links, and disease information | 🤖 | [REST API](https://www.disgenet.org/api/), [Downloads](https://www.disgenet.org/Download) 🔑 |
| 🏥 [HPO](https://hpo.jax.org) | Human Phenotype Ontology — standardized vocabulary of phenotypic abnormalities for clinical genomics | 🤖 | [REST API](https://hpo.jax.org/api/hp/), [Downloads](https://hpo.jax.org/data/annotations) |
| 🏥 [ICGC](https://dcc.icgc.org) | International Cancer Genome Consortium — genomic data from 25,000+ cancer cases across 50 tumor types | ⚠️ | [Downloads](https://dcc.icgc.org/releases), API access limited |
| 🏥 [MIMIC-IV](https://physionet.org/content/mimiciv/) | Medical Information Mart for Intensive Care — de-identified ICU patient data from Beth Israel Deaconess | ⚠️ | [Downloads via PhysioNet](https://physionet.org/content/mimiciv/) (credentialed access + CITI training required) |
| 🏥 [Monarch Initiative](https://monarchinitiative.org) | Integrative platform connecting genotypes, phenotypes, and diseases across species | 🤖 | [REST API](https://api.monarchinitiative.org/api), [Downloads](https://monarchinitiative.org/downloads) |
| 🏥 [OMIM](https://www.omim.org) | Online Mendelian Inheritance in Man — authoritative catalog of human genes and genetic disorders | ⚠️ | [API](https://omim.org/api) (limited free tier), downloads restricted |
| 🏥 [Open Targets Genetics](https://genetics.opentargets.org) | GWAS and functional genomics data for identifying drug targets from genetic evidence | 🤖 | [GraphQL API](https://api.genetics.opentargets.org/graphql), [Downloads](https://genetics.opentargets.org/downloads) |
| 🏥 [Orphanet](https://www.orpha.net) | Portal for rare diseases and orphan drugs — disease classifications, epidemiological data, and expert centers | ⚠️ | [Downloads](https://www.orpha.net/consor/cgi-bin/Education_AboutOrphanet.php?lng=EN&stapage=ST_EDUCATION_ABOUTORPHANET_DOWNLOADS), no public API |
| 🏥 [TCGA/GDC](https://portal.gdc.cancer.gov) | NCI Genomic Data Commons — unified repository for The Cancer Genome Atlas and other cancer genomics programs | 🤖 | [REST API](https://api.gdc.cancer.gov), [Downloads](https://portal.gdc.cancer.gov/repository) |

## 🔗 Interaction & Network

| Name | Description | Agent | Links |
|------|-------------|-------|-------|
| 🔗 [BioGRID](https://thebiogrid.org) | Curated biological interaction database — 2.5M+ protein, genetic, and chemical interactions across all species | 🤖 | [REST API](https://wiki.thebiogrid.org/doku.php/webservice), [Downloads](https://downloads.thebiogrid.org/BioGRID/) |
| 🔗 [CORUM](http://mips.helmholtz-muenchen.de/corum/) | Comprehensive resource of manually annotated mammalian protein complexes | ⚠️ | [Downloads](http://mips.helmholtz-muenchen.de/corum/#download), no API |
| 🔗 [DRKG](https://github.com/gnn4dr/DRKG) | Drug Repurposing Knowledge Graph — comprehensive biomedical KG for drug discovery and repurposing | ⚠️ | [Downloads](https://github.com/gnn4dr/DRKG#download), no public API |
| 🔗 [Hetionet](https://het.io) | Heterogeneous knowledge graph integrating 47K nodes and 2.25M relationships across compounds, diseases, genes, and more | 🤖 | [Downloads](https://github.com/hetio/hetionet), API via Neo4j |
| 🔗 [HIPPIE](http://cbdm-01.zdv.uni-mainz.de/~mschaefer/hippie/) | Human Integrated Protein-Protein Interaction rEference — scored human PPIs with context information | ⚠️ | [Downloads](http://cbdm-01.zdv.uni-mainz.de/~mschaefer/hippie/download.php), web-based API |
| 🔗 [IID](http://iid.ophid.utoronto.ca) | Integrated Interactions Database — tissue-specific and species-specific protein interactions | ⚠️ | [Downloads](http://iid.ophid.utoronto.ca/download/), no public API |
| 🔗 [IntAct](https://www.ebi.ac.uk/intact/) | EMBL-EBI molecular interaction database — curated protein-protein, protein-DNA, protein-small molecule interactions | 🤖 | [REST API](https://www.ebi.ac.uk/intact/webservice/), [FTP](https://ftp.ebi.ac.uk/pub/databases/intact/) |
| 🔗 [PathwayCommons](https://www.pathwaycommons.org) | Aggregated public pathway data from 22 databases in BioPAX format | 🤖 | [REST API](https://www.pathwaycommons.org/pc2/), [Downloads](https://www.pathwaycommons.org/archives/) |
| 🔗 [PrimeKG](https://www.denisf.org/post/primekg) | Precision Medicine Knowledge Graph — multimodal knowledge graph integrating 20+ biomedical resources | 🤖 | [Downloads](https://dataverse.harvard.edu/dataset.xhtml?persistentId=doi:10.7910/DVN/IXA7BM), API via Neo4j |
| 🔗 [STRING](https://string-db.org) | Search Tool for the Retrieval of Interacting Genes/Proteins — known and predicted protein-protein interactions | 🤖 | [REST API](https://string-db.org/help/api/), [Downloads](https://string-db.org/cgi/download) |
| 🔗 [TRRUST](https://www.grnpedia.org/trrust/) | Transcriptional Regulatory Relationships Unraveled by Sentence-based Text mining — human TF-target interactions | ⚠️ | [Downloads](https://www.grnpedia.org/trrust/download/), no API |
| 🔗 [WikiPathways](https://wikipathways.org) | Community-curated biological pathway database in a wiki framework | 🤖 | [REST API](https://webservice.wikipathways.org), [Downloads](https://wikipathways.org/index.php/Download_Pathways) |

## 📊 Expression & Regulation

| Name | Description | Agent | Links |
|------|-------------|-------|-------|
| 📊 [ArrayExpress](https://www.ebi.ac.uk/biostudies/arrayexpress) | EMBL-EBI functional genomics data archive (now merged into BioStudies) | 🤖 | [REST API](https://www.ebi.ac.uk/biostudies/api/), [FTP](https://ftp.ebi.ac.uk/pub/databases/arrayexpress/) |
| 📊 [Expression Atlas](https://www.ebi.ac.uk/gxa) | EMBL-EBI gene expression across species and conditions — baseline, differential, and proteomics expression | 🤖 | [REST API](https://www.ebi.ac.uk/gxa/api/), [Downloads](https://www.ebi.ac.uk/gxa/download) |
| 📊 [FANTOM5](https://fantom.gsc.riken.jp/5/) | Functional Annotation of Mammalian Genome 5 — promoter-level expression atlas across primary cell types | ⚠️ | [Downloads](https://fantom.gsc.riken.jp/5/data/), no public API |
| 📊 [GEO](https://www.ncbi.nlm.nih.gov/geo/) | Gene Expression Omnibus — NCBI's public functional genomics data repository (5M+ samples) | 🤖 | [E-Utilities API](https://www.ncbi.nlm.nih.gov/books/NBK25501/), [FTP](https://ftp.ncbi.nlm.nih.gov/geo/) |
| 📊 [GTEx](https://gtexportal.org) | Genotype-Tissue Expression project — gene expression and eQTL data across 54 human tissues | 🤖 | [REST API](https://gtexportal.org/home/api-docs/index.html), [Downloads](https://gtexportal.org/home/downloads/adult-gtex) |
| 📊 [HOCOMOCO](https://hocomoco11.autosome.org) | Comprehensive collection of human and mouse transcription factor binding models from ChIP-seq data | 🤖 | [Downloads](https://hocomoco11.autosome.org/downloads), API via MEME Suite format |
| 📊 [JASPAR](https://jaspar.genereg.net) | Open-access database of curated, non-redundant transcription factor binding profiles | 🤖 | [REST API](https://jaspar.genereg.net/api/), [Downloads](https://jaspar.genereg.net/downloads/) |
| 📊 [mirBase](https://www.mirbase.org) | microRNA database — published miRNA sequences, annotation, and predicted targets | ⚠️ | [FTP downloads](https://www.mirbase.org/download/), no API |
| 📊 [miRTarBase](https://mirtarbase.cuhk.edu.cn) | Experimentally validated microRNA-target interactions database | ⚠️ | [Downloads](https://mirtarbase.cuhk.edu.cn/~miRTarBase/miRTarBase_2022/download.php), no API |
| 📊 [RegNetwork](http://www.regnetworkweb.org) | Repository of transcriptional and post-transcriptional regulatory relationships in human and mouse | ❌ | Web-based query and download |
| 📊 [Roadmap Epigenomics](http://www.roadmapepigenomics.org) | NIH Roadmap Epigenomics Project — reference epigenomic maps across human tissues and cell types | ⚠️ | [Downloads via GEO/SRA](http://www.roadmapepigenomics.org/data), no unified API |
| 📊 [TRANSFAC](http://gene-regulation.com/pub/databases.html) | Curated database of eukaryotic transcription factors, their binding sites, and regulated genes | 💲 | Commercial license required for full access; limited public version at [PATCH](http://gene-regulation.com/pub/programs.html#patch) |

## 🤝 贡献指南

请参阅 [CONTRIBUTING.md](CONTRIBUTING.md) 了解添加新数据库的指南。

## 📡 API 参考

Agent 就绪类数据库的详细 API 端点和 curl 示例见 [api-reference.md](api-reference.md)。

## 📜 许可证

[![CC0](https://img.shields.io/badge/license-CC0-blue.svg)](LICENSE)

本仓库中的数据库列表和描述根据 [CC0 1.0 Universal](https://creativecommons.org/publicdomain/zero/1.0/) 贡献至公有领域。所有关于数据库的事实信息（名称、网址、访问方式）不受版权保护。
