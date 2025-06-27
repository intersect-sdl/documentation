---
uuid: 4e2cb9d4-b7aa-4e63-b040-0efddcfbdc39
title: Entity Detail — prov:Entity
author: SDL Team
tags:
  - PROV-O
  - RDF Class
  - Provenance
  - Entity Detail
version: 1.0
published: true
---

The `prov:Entity` class is a fundamental concept in the PROV-O ontology. It represents any piece of data, record, or state that can be subject to provenance tracking. In SDL, `prov:Entity` is used to annotate datasets, observations, samples, and distributions with provenance metadata.

---

## 🔎 Definition

**URI**: `http://www.w3.org/ns/prov#Entity`

> A `prov:Entity` is a physical, digital, conceptual, or other kind of thing with some fixed aspects; entities may be generated, modified, or used by activities.

---

## 📐 Usage in SDL

In SDL, `prov:Entity` is used to:

* Indicate that a resource is subject to provenance tracking
* Link data artifacts to their generating activities (`prov:wasGeneratedBy`)
* Associate data with responsible agents (`prov:wasAttributedTo`)
* Record usage or derivation relationships

Entities are typically typed with other roles in addition to `prov:Entity`, such as `dcat:Dataset`, `sosa:Observation`, `sosa:Sample`, or `dcat:Distribution`.

---

## 🔄 Properties

| Property                    | Description                                                   | Optional |
| --------------------------- | ------------------------------------------------------------- | -------- |
| `prov:wasGeneratedBy`       | Links the entity to the activity that generated it            | Yes      |
| `prov:wasAttributedTo`      | Indicates the agent responsible for the entity                | Yes      |
| `prov:wasDerivedFrom`       | Identifies an entity that this entity was derived from        | Yes      |
| `prov:qualifiedGeneration`  | Describes generation in detail using a `prov:Generation` node | Yes      |
| `prov:qualifiedAttribution` | Provides detailed attribution via a `prov:Attribution` node   | Yes      |
| `prov:qualifiedDerivation`  | Provides detailed derivation via a `prov:Derivation` node     | Yes      |
| `prov:wasRevisionOf`        | Indicates this entity is a revision of another                | Yes      |

---

## 🧠 Composition

A `prov:Entity` often has multiple roles. In SDL it may be used alongside:

* `dcat:Resource` and `dcat:Dataset` to represent data objects
* `sosa:Observation` and `sosa:Sample` to track scientific data

```turtle
ex:dataset1 a dcat:Dataset , prov:Entity ;
  dcterms:title "Soil Respiration Dataset" ;
  prov:wasGeneratedBy ex:workflow1 ;
  prov:wasAttributedTo ex:agent1 .
```

---

## 🧪 Example — Sample with Provenance

```turtle
ex:sample1 a sosa:Sample , prov:Entity ;
  dcterms:title "Soil Core Sample 1" ;
  prov:wasGeneratedBy ex:samplingActivity ;
  prov:wasAttributedTo ex:technicianA .
```

---

## 🗂 Related Classes

* `prov:Activity` — action that generates or uses entities
* `prov:Agent` — person, system, or organization involved
* `dcat:Dataset`, `dcat:Distribution` — data that is often tracked as entities

---

## 📘 See Also

* [`prov:Entity`](https://www.w3.org/TR/prov-o/#Entity)
* [`prov:Activity`](https://www.w3.org/TR/prov-o/#Activity)
* [`prov:Agent`](https://www.w3.org/TR/prov-o/#Agent)

> Provenance modeling is essential for reproducibility, data integrity, and traceability. In SDL, `prov:Entity` enables clear attribution and lineage tracking across scientific workflows.
