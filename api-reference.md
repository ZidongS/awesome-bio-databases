# API Reference — Agent-Ready Biological Databases

Detailed API endpoints and curl examples for Agent-Ready (🤖) databases listed in the [main README](README.md).

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
- **Auth:** 🔑 API key recommended (3 req/s without, 10 req/s with key)
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

### CATH REST API
- **Base URL:** `https://www.cathdb.info/version/latest/api/rest/`
- **Auth:** None
- **Example:** `curl "https://www.cathdb.info/version/latest/api/rest/pdb/4hhb"`
- **Response:** JSON
- **Docs:** https://www.cathdb.info/wiki/doku.php?id=api:rest_api

### Human Protein Atlas API
- **Base URL:** `https://www.proteinatlas.org/api/`
- **Auth:** None
- **Example:** `curl "https://www.proteinatlas.org/api/search/BRCA2"`
- **Response:** JSON
- **Docs:** https://www.proteinatlas.org/about/api

### MobiDB REST API
- **Base URL:** `https://mobidb.org/api/`
- **Auth:** None
- **Example:** `curl "https://mobidb.org/api/download?format=json&acc=P00519"`
- **Response:** JSON
- **Docs:** https://mobidb.org/api_docs

### SAbDab REST API
- **Base URL:** `https://opig.stats.ox.ac.uk/webapps/sabdab-sabpred/sabdab/api/`
- **Auth:** None
- **Example:** `curl "https://opig.stats.ox.ac.uk/webapps/sabdab-sabpred/sabdab/api/summary/?pdb=4hhb"`
- **Response:** JSON
- **Docs:** https://opig.stats.ox.ac.uk/webapps/sabdab-sabpred/sabdab/api/

### SWISS-MODEL Repository API
- **Base URL:** `https://swissmodel.expasy.org/repository/`
- **Auth:** None
- **Example:** `curl "https://swissmodel.expasy.org/repository/uniprot/P00519.json"`
- **Response:** JSON
- **Docs:** https://swissmodel.expasy.org/docs/repository_help#api

## Enzymes & Metabolism APIs

### KEGG REST API
- **Base URL:** `https://rest.kegg.jp/`
- **Auth:** None (💲 commercial FTP subscription for bulk download)
- **Example:** `curl "https://rest.kegg.jp/list/pathway/hsa"`
- **Response:** Text (tab-delimited)
- **Docs:** https://www.kegg.jp/kegg/rest/keggapi.html

### Reactome ContentService API
- **Base URL:** `https://reactome.org/ContentService/`
- **Auth:** None
- **Example:** `curl "https://reactome.org/ContentService/data/query/PTEN"`
- **Response:** JSON
- **Docs:** https://reactome.org/ContentService/

### SABIO-RK REST API
- **Base URL:** `http://sabiork.h-its.org/api/`
- **Auth:** None
- **Example:** `curl "http://sabiork.h-its.org/api/search/kineticlaws?q=glucose"`
- **Response:** JSON
- **Docs:** http://sabiork.h-its.org/api/

### Rhea REST API
- **Base URL:** `https://www.rhea-db.org/`
- **Auth:** None
- **Example:** `curl "https://www.rhea-db.org/rhea?query=ATP&format=json"`
- **Response:** JSON
- **Docs:** https://www.rhea-db.org/help/api

### eQuilibrator REST API
- **Base URL:** `https://equilibrator.weizmann.ac.il/api`
- **Auth:** None
- **Example:** `curl "https://equilibrator.weizmann.ac.il/api/search?query=ATP"`
- **Response:** JSON
- **Docs:** https://equilibrator.weizmann.ac.il/api

## Compounds & Drugs APIs

### PubChem PUG REST API
- **Base URL:** `https://pubchem.ncbi.nlm.nih.gov/rest/pug/`
- **Auth:** None (rate limited)
- **Example:** `curl "https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/name/aspirin/property/MolecularWeight/JSON"`
- **Response:** JSON
- **Docs:** https://pubchem.ncbi.nlm.nih.gov/docs/pug-rest

### ChEMBL REST API
- **Base URL:** `https://www.ebi.ac.uk/chembl/api/data/`
- **Auth:** None
- **Example:** `curl "https://www.ebi.ac.uk/chembl/api/data/molecule/chembl25.json"`
- **Response:** JSON
- **Docs:** https://www.ebi.ac.uk/chembl/api/data/docs

### ChEBI Web Services
- **Base URL:** `https://www.ebi.ac.uk/chebi/`
- **Auth:** None
- **Example:** `curl "https://www.ebi.ac.uk/chebi/webServices.do?chebiId=CHEBI:15377"`
- **Response:** XML (legacy SOAP), JSON via newer endpoints
- **Docs:** https://www.ebi.ac.uk/chebi/webServices.do

### ZINC REST API
- **Base URL:** `https://zinc.docking.org/`
- **Auth:** None
- **Example:** `curl "https://zinc.docking.org/substances.json?count=3"`
- **Response:** JSON
- **Docs:** https://zinc.docking.org/api/

### BindingDB REST API
- **Base URL:** `https://www.bindingdb.org/api/v1/`
- **Auth:** None
- **Example:** `curl "https://www.bindingdb.org/api/v1/targets/EGFR"`
- **Response:** JSON
- **Docs:** https://www.bindingdb.org/api/v1/

### DGIdb GraphQL API
- **Base URL:** `https://dgidb.org/api/graphql`
- **Auth:** None
- **Example:** `curl -X POST "https://dgidb.org/api/graphql" -H "Content-Type: application/json" -d '{"query":"{ drugs(names: [\"imatinib\"]) { nodes { name } } }"}'`
- **Response:** JSON
- **Docs:** https://dgidb.org/api

### Open Targets Platform GraphQL API
- **Base URL:** `https://api.platform.opentargets.org/api/v4/graphql`
- **Auth:** None
- **Example:** `curl -X POST "https://api.platform.opentargets.org/api/v4/graphql" -H "Content-Type: application/json" -d '{"query":"{ target(ensemblId: \"ENSG00000139618\") { approvedSymbol } }"}'`
- **Response:** JSON
- **Docs:** https://platform.opentargets.org/api

## Disease & Clinical APIs

### ClinVar E-Utilities
- **Base URL:** `https://eutils.ncbi.nlm.nih.gov/entrez/eutils/`
- **Auth:** 🔑 API key recommended
- **Example:** `curl "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=clinvar&term=BRCA2[gene]&retmax=3&retmode=json"`
- **Response:** JSON
- **Docs:** https://www.ncbi.nlm.nih.gov/books/NBK25501/

### DisGeNET REST API
- **Base URL:** `https://www.disgenet.org/api/`
- **Auth:** 🔑 Free registration required for API key
- **Example:** `curl "https://www.disgenet.org/api/gene/disease?gene_id=675&format=json"`
- **Response:** JSON
- **Docs:** https://www.disgenet.org/api/

### ClinicalTrials.gov API v2
- **Base URL:** `https://clinicaltrials.gov/api/v2/`
- **Auth:** None
- **Example:** `curl "https://clinicaltrials.gov/api/v2/studies?query.term=diabetes&pageSize=3"`
- **Response:** JSON
- **Docs:** https://clinicaltrials.gov/data-api/api

### cBioPortal REST API
- **Base URL:** `https://www.cbioportal.org/api/`
- **Auth:** None
- **Example:** `curl "https://www.cbioportal.org/api/studies"`
- **Response:** JSON
- **Docs:** https://www.cbioportal.org/api/swagger-ui.html

### HPO REST API
- **Base URL:** `https://hpo.jax.org/api/hp/`
- **Auth:** None
- **Example:** `curl "https://hpo.jax.org/api/hp/terms/HP:0001250"`
- **Response:** JSON
- **Docs:** https://hpo.jax.org/api

### GDC REST API
- **Base URL:** `https://api.gdc.cancer.gov/`
- **Auth:** None
- **Example:** `curl "https://api.gdc.cancer.gov/status"`
- **Response:** JSON
- **Docs:** https://api.gdc.cancer.gov

### Monarch Initiative API
- **Base URL:** `https://api.monarchinitiative.org/api/`
- **Auth:** None
- **Example:** `curl "https://api.monarchinitiative.org/api/association/disease/OMIM:219700"`
- **Response:** JSON
- **Docs:** https://api.monarchinitiative.org

### Open Targets Genetics GraphQL API
- **Base URL:** `https://api.genetics.opentargets.org/graphql`
- **Auth:** None
- **Example:** `curl -X POST "https://api.genetics.opentargets.org/graphql" -H "Content-Type: application/json" -d '{"query":"{ genes(search: \"BRCA2\") { id symbol } }"}'`
- **Response:** JSON
- **Docs:** https://genetics.opentargets.org/api

## Interaction & Network APIs

### STRING REST API
- **Base URL:** `https://string-db.org/api/`
- **Auth:** None
- **Example:** `curl "https://string-db.org/api/json/network?identifiers=TP53&species=9606"`
- **Response:** JSON
- **Docs:** https://string-db.org/help/api/

### BioGRID REST API
- **Base URL:** `https://webservice.thebiogrid.org/`
- **Auth:** 🔑 Requires free access key (register at https://thebiogrid.org)
- **Example:** `curl "https://webservice.thebiogrid.org/interactions?geneList=TP53&taxId=9606&format=json&accesskey=YOUR_KEY"`
- **Response:** JSON
- **Docs:** https://wiki.thebiogrid.org/doku.php/webservice

### IntAct REST API
- **Base URL:** `https://www.ebi.ac.uk/intact/ws/psi-mi/`
- **Auth:** None
- **Example:** `curl "https://www.ebi.ac.uk/intact/ws/psi-mi/interaction/findInteractions?query=BRCA2&format=json"`
- **Response:** JSON
- **Docs:** https://www.ebi.ac.uk/intact/documentation/api

### PathwayCommons REST API
- **Base URL:** `https://www.pathwaycommons.org/pc2/`
- **Auth:** None
- **Example:** `curl "https://www.pathwaycommons.org/pc2/search?q=TP53&format=json"`
- **Response:** JSON
- **Docs:** https://www.pathwaycommons.org/pc2/

### WikiPathways REST API
- **Base URL:** `https://webservice.wikipathways.org/`
- **Auth:** None
- **Example:** `curl "https://webservice.wikipathways.org/listOrganisms"`
- **Response:** JSON
- **Docs:** https://webservice.wikipathways.org

## Expression & Regulation APIs

### GEO E-Utilities
- **Base URL:** `https://eutils.ncbi.nlm.nih.gov/entrez/eutils/`
- **Auth:** 🔑 API key recommended
- **Example:** `curl "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=gds&term=cancer&retmax=3&retmode=json"`
- **Response:** JSON
- **Docs:** https://www.ncbi.nlm.nih.gov/books/NBK25501/

### ArrayExpress / BioStudies API
- **Base URL:** `https://www.ebi.ac.uk/biostudies/api/v1/`
- **Auth:** None
- **Example:** `curl "https://www.ebi.ac.uk/biostudies/api/v1/studies?query=cancer&pageSize=3"`
- **Response:** JSON
- **Docs:** https://www.ebi.ac.uk/biostudies/api

### GTEx REST API
- **Base URL:** `https://gtexportal.org/api/v2/`
- **Auth:** None
- **Example:** `curl "https://gtexportal.org/api/v2/dataset/openAccess?pageSize=3"`
- **Response:** JSON
- **Docs:** https://gtexportal.org/home/api-docs

### Expression Atlas API
- **Base URL:** `https://www.ebi.ac.uk/gxa/api/`
- **Auth:** None
- **Example:** `curl "https://www.ebi.ac.uk/gxa/api/experiments?limit=3"`
- **Response:** JSON
- **Docs:** https://www.ebi.ac.uk/gxa/api/

### JASPAR REST API
- **Base URL:** `https://jaspar.genereg.net/api/v1/`
- **Auth:** None
- **Example:** `curl "https://jaspar.genereg.net/api/v1/matrix/MA0001.1/"`
- **Response:** JSON
- **Docs:** https://jaspar.genereg.net/api/

### HOCOMOCO Downloads
- **Base URL:** `https://hocomoco11.autosome.org/downloads`
- **Auth:** None
- **Example:** `curl "https://hocomoco11.autosome.org/downloads"`
- **Response:** Direct file downloads (MEME/PWM format)
- **Docs:** https://hocomoco11.autosome.org

## Single Cell APIs

### CZ CELLxGENE REST API
- **Base URL:** `https://api.cellxgene.cziscience.com/curation/v1/`
- **Auth:** None
- **Example:** `curl "https://api.cellxgene.cziscience.com/curation/v1/collections"`
- **Response:** JSON
- **Docs:** https://api.cellxgene.cziscience.com/curation/v1/

### Human Cell Atlas Data Portal API
- **Base URL:** `https://service.azul.data.humancellatlas.org/`
- **Auth:** None
- **Example:** `curl "https://service.azul.data.humancellatlas.org/index/collections?size=3"`
- **Response:** JSON
- **Docs:** https://data.humancellatlas.org/apis/api-documentation

### Single Cell Expression Atlas API
- **Base URL:** `https://www.ebi.ac.uk/gxa/sc/api/`
- **Auth:** None
- **Example:** `curl "https://www.ebi.ac.uk/gxa/sc/api/experiments?limit=3"`
- **Response:** JSON
- **Docs:** https://www.ebi.ac.uk/gxa/sc/api/

## Plants APIs

### Gramene API
- **Base URL:** `https://www.gramene.org/api/`
- **Auth:** None
- **Example:** `curl "https://www.gramene.org/api/genomes"`
- **Response:** JSON
- **Docs:** https://www.gramene.org/api

### Ensembl Plants REST API
- **Base URL:** `https://rest.ensembl.org`
- **Auth:** None
- **Example:** `curl -H "Content-Type: application/json" "https://rest.ensembl.org/lookup/symbol/oryza_sativa/OS01G0100100?expand=1"`
- **Response:** JSON
- **Docs:** https://rest.ensembl.org

## Microbes APIs

### MGnify REST API
- **Base URL:** `https://www.ebi.ac.uk/metagenomics/api/v1/`
- **Auth:** None
- **Example:** `curl "https://www.ebi.ac.uk/metagenomics/api/v1/biomes"`
- **Response:** JSON
- **Docs:** https://www.ebi.ac.uk/metagenomics/api/

### BacDive REST API
- **Base URL:** `https://api.bacdive.dsmz.de/`
- **Auth:** 🔑 Free registration required
- **Example:** `curl "https://api.bacdive.dsmz.de/fetch/genus/Bacillus?access_token=YOUR_TOKEN"`
- **Response:** JSON
- **Docs:** https://api.bacdive.dsmz.de/

### CARD REST API
- **Base URL:** `https://card.mcmaster.ca/api/`
- **Auth:** None
- **Example:** `curl "https://card.mcmaster.ca/api/ontology"`
- **Response:** JSON
- **Docs:** https://card.mcmaster.ca/api
