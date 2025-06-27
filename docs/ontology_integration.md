---
uuid: 16d67c2e-0382-497f-9616-f850f31362a5
title: "Ontology Integration"
description: "How ontologies are used and integrated within the Scientific Data Layer (SDL)."
author: "SDL Team"
date: "2025-06-25"
published: true
---

> **Disclaimer:** Many of the features described in this guide are still in planning or development. Your instance may not yet support all described functionality.

# Ontology Integration

Ontologies are a core part of the Scientific Data Layer (SDL), enabling semantic interoperability, structured knowledge representation, and reasoning across services.

This guide covers how ontologies are used, loaded, aligned, and extended within SDL.

---

## Purpose of Ontologies in SDL

Ontologies provide the semantic backbone for:

- **Resource typing** (e.g., `ssn:Sensor`, `dcat:Dataset`, `prov:Activity`)
- **Data validation** using SHACL and reasoning
- **UI rendering** via `rdfs:Class` and `sh:property` definitions
- **Search and discovery** via class-based filters
- **Automated workflows** and provenance tracking

---

## Supported Ontologies

SDL integrates a range of standard and domain-specific ontologies:

- **DCAT v3** – Catalogs and datasets
- **SSN/SOSA** – Sensors, systems, observations
- **PROV-O** – Provenance of data and workflows
- **DoCO** – Document components (for semantic content blocks)
- **SKOS** – Controlled vocabularies
- **SHACL** – Shape constraints for validation

Custom or local ontologies can be loaded to support specific domains.

---

## Ontology Management

Ontologies are loaded into the RDF store under a dedicated graph (e.g., `http://example.org/ontologies`).

You can manage ontologies using:

- The **Repository Service** (`POST /repository/resources`) to upload `.ttl` or `.jsonld` files
- A **designated admin UI** (planned)
- Programmatic loading during deployment/configuration

---

## Aligning Data with Ontologies

Each resource is annotated with `@type` and optionally `@context` to associate it with ontology terms.

Example:
```json
{
  "@type": "ssn:Sensor",
  "rdfs:label": "LI-8250 CO2 Analyzer",
  "sosa:hosts": { "@id": "platform:chamber01" }
}
```

```turtle
@prefix ssn: <http://www.w3.org/ns/ssn/> .
@prefix sosa: <http://www.w3.org/ns/sosa/> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix platform: <http://example.org/platform/> .

<http://example.org/sensors/LI-8250> a ssn:Sensor ;
  rdfs:label "LI-8250 CO2 Analyzer" ;
  sosa:hosts platform:chamber01 .
```

Validation and reasoning can check for consistency with the ontology definition.

---

## UI Integration

SDL uses ontologies to drive the UI dynamically:

- Forms are generated based on `sh:NodeShape`
- Labels, descriptions, ranges are extracted from `rdfs:label`, `rdfs:comment`, `sh:datatype`, etc.
- Type-aware rendering of content blocks (e.g., data block vs. reference block)

This enables a flexible interface that adjusts to new types without hardcoding.

---

## Extending Ontologies

Users can:

- Import new vocabularies
- Define subclasses of known types
- Attach UI metadata using `sdl:uiTemplate`, `sh:group`, or `skos:note`
- Reference external ontologies (via `owl:imports`)

Custom extensions can be maintained in dedicated named graphs.

---

## Planned Features

- Ontology browser UI
- Version control for vocabularies
- SPIN/SHACL reasoning support
- Context-aware autocompletion during semantic editing

---

Ontology integration ensures that SDL remains modular, extensible, and aligned with FAIR principles for data management and reuse.
