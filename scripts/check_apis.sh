#!/bin/bash
# check_apis.sh — Batch API reachability tester for Agent-Ready databases
# Usage: bash scripts/check_apis.sh

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

TIMEOUT=15
FAILURES=0
TOTAL=0

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
  "Human Protein Atlas|https://www.proteinatlas.org/api/search/BRCA2|200"
  "MGnify API|https://www.ebi.ac.uk/metagenomics/api/v1/biomes|200"
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
  "GTEx API|https://gtexportal.org/api/v2/dataset/openAccess?pageSize=3|200"
  "Expression Atlas API|https://www.ebi.ac.uk/gxa/api/experiments?limit=3|200"
  "JASPAR API|https://jaspar.genereg.net/api/v1/matrix/MA0001.1/|200"
  "CELLxGENE API|https://api.cellxgene.cziscience.com/curation/v1/collections|200"
  "HCA Data Portal|https://service.azul.data.humancellatlas.org/index/collections?size=1|200"
  "Single Cell Expression Atlas|https://www.ebi.ac.uk/gxa/sc/api/experiments?limit=3|200"
  "eQuilibrator API|https://equilibrator.weizmann.ac.il/api/search?query=ATP|200"
  "CARD API|https://card.mcmaster.ca/api/ontology|200"
  "Open Targets Genetics|https://api.genetics.opentargets.org/graphql|405"
  "Gramene API|https://www.gramene.org/api/genomes|200"
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
