---
id: 16d67c2e-0382-497f-9616-f850f31362a5
title: "Ontology Integration"
description: "How ontologies are used and integrated within the Scientific Data Layer (SDL)."
author: "SDL Team"
date: "2025-06-25"
published: true
---

> **Disclaimer:** Many of the features described in this guide are still in planning or development. Your instance may not yet support all described functionality.

Ontologies are a core part of the Scientific Data Layer (SDL), enabling semantic interoperability, structured knowledge representation, and reasoning across services.

This guide covers how ontologies are used, loaded, aligned, and extended within SDL.

## Purpose of Ontologies in SDL

The :abbr[SDL] relies on :abbr[RDF] and :abbr[OWL] ontologies to model resources and their relationships.
In :abbr[RDF], a resource is described using one or more assertions (statements) about it.
A Resources can be assigned one or more classes in :abbr[RDF] vocabularies or :abbr[OWL] ontologies.
Additionally it can also have properties, providing additional context.

``` turtle
<http://example.org/sensors/LI-8250> a ssn:Sensor .
```

The example above is a single :abbr[RDF] statement (a "triple") written in Turtle syntax.
Every triple has a *Subject*, *Predicate* and *Object*: the *Subject* identifies the resource, and the *Predicate* links it to another *Object*.

The next example adds a second assertion about the same resource:

``` turtle
<http://example.org/sensors/LI-8250> a ssn:Sensor .
<http://example.org/sensors/LI-8250> a dcat:Resource .
```

The token `a` is a Turtle shorthand for :rdfterm[rdf\:type], which asserts that the *Subject* is an instance of the *Object* class.
From these two assertions, we can see that `<http://example.org/sensors/LI-8250>` is simultaneously an instance of both :rdfterm[ssn\:Sensor] and :rdfterm[dcat\:Resource].
In :abbr[RDF], a resource may belong to multiple classes.
This can be used by applications, reasoners, and agents to combine semantics from multiple ontologies.

Ontologies provide the semantic backbone for:

### Resource typing

Resources within the SDL are typed using different classes from multiple vocabularies and ontologies, e.g., :rdfterm[ssn:Sensor], :rdfterm[dcat:Dataset], :rdfterm[prov:Activity].

### Data validation

using SHACL and reasoning

### UI rendering

via :rdfterm[rdfs:Class] and :rdfterm[sh:property] definitions

### Search and discovery

via class-based filters


### Automated workflows and provenance tracking



## Supported Ontologies

SDL integrates a range of standard and domain-specific ontologies:

- **DCAT v3** Catalogs and datasets
- **SSN/SOSA** Sensors, systems, observations
- **PROV-O** Provenance of data and workflows
- **DoCO** Document components (for semantic content blocks)
- **SKOS** Controlled vocabularies
- **SHACL** Shape constraints for validation

Custom or local ontologies can be loaded to support specific domains.

## Ontology Management

Ontologies are loaded into the RDF store under a dedicated graph (e.g., `http://example.org/ontologies`).

You can manage ontologies using:

- The **Repository Service** (`POST /repository/resources`) to upload `.ttl` or `.jsonld` files
- A **designated admin UI** (planned)
- Programmatic loading during deployment/configuration

## Aligning Data with Ontologies

Each resource is annotated with `@type` and optionally `@context` to associate it with ontology terms.

Example:

``` json
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

## UI Integration

SDL uses ontologies to drive the UI dynamically:

- Forms are generated based on :rdfterm[sh:NodeShape]
- Labels, descriptions, ranges are extracted from :rdfterm[rdfs:label], :rdfterm[rdfs:comment], :rdfterm[sh:datatype], etc.
- Type-aware rendering of content blocks (e.g., data block vs. reference block)

This enables a flexible interface that adjusts to new types without hardcoding.

## Extending Ontologies

Users can:

- Import new vocabularies
- Define subclasses of known types
- Attach UI metadata using :rdfterm[sdl:uiTemplate], :rdfterm[sh:group], or :rdfterm[skos:note]
- Reference external ontologies (via :rdfterm[owl:imports])

Custom extensions can be maintained in dedicated named graphs.

## Planned Features

- Ontology browser UI
- Version control for vocabularies
- SPIN/SHACL reasoning support
- Context-aware autocompletion during semantic editing

Ontology integration ensures that SDL remains modular, extensible, and aligned with FAIR principles for data management and reuse.
