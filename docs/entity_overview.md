---
id: 3b6e0b3b-bdf8-47d9-9d2d-846ae02e45e3
title: Entity Overview in the Scientific Data Layer (SDL)
author: SDL Team
tags:
  - RDF
  - Entity Model
  - Classes
  - Composition
  - Ontologies
version: 1.0
published: true
---

This document provides a high-level overview of the different **RDF entity types** used in the SDL and how they relate through composition, ontology alignment, and Linked Data Platform (LDP) containers.

The SDL does not use a rigid class hierarchy. Instead, it enables **compositional modeling** by assigning multiple `rdf:type` values to describe the role and structure of each resource.

---

## 🧩 Core Concepts

### 🔖 `rdf:type`

Each entity in SDL can declare multiple RDF types to reflect its functional role in the system.

### 📦 LDP Containers

Entities are managed within LDP containers that determine how they are listed, created, and related to one another (Basic, Direct, Indirect).

---

## 🧠 Composition by `rdf:type`

SDL Entities often combine types from different vocabularies to model their structure and behavior. For example:

### Example: A file representing a sensor result

```turtle
ex:observation1
  a sosa:Observation , prov:Entity , dcat:Distribution ;
  dct:title "Soil Gas Measurement" ;
  sosa:madeBySensor ex:li8250 ;
  dcat:downloadURL <https://example.org/data/soil.csv> .
```

This shows that:

* The entity is a measurement (`sosa:Observation`)
* It is data that can be traced in provenance (`prov:Entity`)
* It is downloadable (`dcat:Distribution`)

---

## 🔄 Relationships

Entities in SDL are linked via named properties from the source ontologies:

* `dcat:dataset` links `dcat:Catalog` → `dcat:Dataset`
* `dcat:distribution` links `dcat:Dataset` → `dcat:Distribution`
* `prov:wasGeneratedBy` links `prov:Entity` → `prov:Activity`
* `sosa:hasResult` or `sosa:hasSimpleResult` associates observations with values
* `ssn:deployedSystem` links `ssn:Deployment` → `ssn:System`

---

## 📚 RDF Classes in SDL

| RDF Class           | Namespace | Description                                                       |                                     |
| ------------------- | --------- | ------------------------------------------------------------------|-------------------------------------|
| `dcat:Catalog`      | DCAT      | A container of datasets                                           | [more](./entities/dcat_catalog)     |
| `dcat:Dataset`      | DCAT      | A data asset described by metadata                                | [more](./entities/dcat_dataset)     |
| `dcat:Distribution` | DCAT      | A downloadable version of a dataset                               | [more](./entities/dcat_distribution)|
| `prov:Activity`     | PROV-O    | An event or process that generates or uses entities               | [more](./entities/prov_activity).   |
| `prov:Agent`        | PROV-O    | A person, system, or organization acting in provenance chains     | [more](./entities/prov_agent).      |
| `prov:Entity`       | PROV-O    | Any piece of data or recordable state                             | [more](./entities/prov_entitiy).    |
| `sosa:Observation`  | SOSA      | An act of measurement or data collection                          | [more](./entities/sosa_observation).|
| `sosa:Platform`     | SOSA      | A structure that hosts deployed sensors and systems               | [more](./entities/sosa_platform).   |
| `ssn:Deployment`    | SSN       | A system installed in a given context                             | [more](./entities/ssn_deployment).  |
| `ssn:Property`      | SSN       | A observable or measurable characteristics of real-world entities | [more](./entities/ssn_properties).  |
| `ssn:System`        | SSN       | A physical or logical sensor system or configuration              | [more](./entities/ssn_system).      |

---

> This modular, compositional approach enables reuse across scientific domains, supporting complex workflows and data lifecycles through shared semantics.
