---
id: 11e9e0c1-3a4f-4d08-bd4e-4b26cf17c565
title: Repository Service Overview
published: true
authors:
    - Swen Boehm
    - SDL Team
draft: true
---

The **Repository Service** provides durable, versioned, and structured storage for semantic resources in the SDL ecosystem.

It supports:

* Ingestion of RDF resources into named graphs
* Version control of individual resource states
* Read/write access via Linked Data Platform (LDP) patterns
* Organization of data by workspace, user, or platform context

## Capabilities

### Resource Management

* Each RDF resource is stored in a named graph
* Graphs are organized by container (e.g., workspace, platform, experiment)
* Supports updates, replacements, and deletions with provenance tracking

### Versioning

* All changes to a resource are stored as distinct named graph revisions
* Changes are tracked using `prov:Activity`, `prov:wasDerivedFrom`, and timestamp metadata

### Query and Resolution

* Resources can be queried using SPARQL endpoints
* Supports `GET`, `PUT`, `PATCH`, `DELETE` via LDP-compliant interfaces

## Example Resource Record

```ttl
acl:Sample789 a acl:SolidSample ;
  dct:title "Annealed perovskite powder" ;
  dct:created "2025-07-15"^^xsd:date ;
  prov:wasGeneratedBy acl:SynthesisRun456 ;
  dct:isPartOf <https://example.org/repo/workspaces/acl-project/> .
```

## Example Graph Metadata

```ttl
<https://example.org/repo/graphs/sample789-v1> a ssd:GraphVersion ;
  dct:identifier "sample789-v1" ;
  prov:generatedAtTime "2025-07-15T10:30:00Z"^^xsd:dateTime ;
  prov:wasDerivedFrom <https://example.org/repo/graphs/sample789-v0> .
```

## Federation and Linking

* Repository contents are discoverable via the Catalog Service
* Can interoperate with external triple stores (e.g., Blazegraph, GraphDB)
* Supports import/export in multiple RDF serializations (Turtle, JSON-LD, N-Quads)
