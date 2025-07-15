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

The :rdfterm[prov:Entity] class is a fundamental concept in the PROV-O ontology. It represents any piece of data, record, or state that can be subject to provenance tracking. In SDL, :rdfterm[prov:Entity] is used to annotate datasets, observations, samples, and distributions with provenance metadata.

---

## Definition

**URI**: `http://www.w3.org/ns/prov#Entity`

> A :rdfterm[prov:Entity] is a physical, digital, conceptual, or other kind of thing with some fixed aspects; entities may be generated, modified, or used by activities.

---

## Usage in SDL

In SDL, :rdfterm[prov:Entity] is used to:

* Indicate that a resource is subject to provenance tracking
* Link data artifacts to their generating activities (:rdfterm[prov:wasGeneratedBy])
* Associate data with responsible agents (:rdfterm[prov:wasAttributedTo])
* Record usage or derivation relationships

Entities are typically typed with other roles in addition to :rdfterm[prov:Entity], such as :rdfterm[dcat:Dataset], :rdfterm[sosa:Observation], :rdfterm[sosa:Sample], or :rdfterm[dcat:Distribution].

---

## Properties

| Property                    | Description                                                   | Optional |
| --------------------------- | ------------------------------------------------------------- | -------- |
| :rdfterm[prov:wasGeneratedBy]       | Links the entity to the activity that generated it            | Yes      |
| :rdfterm[prov:wasAttributedTo]      | Indicates the agent responsible for the entity                | Yes      |
| :rdfterm[prov:wasDerivedFrom]       | Identifies an entity that this entity was derived from        | Yes      |
| :rdfterm[prov:qualifiedGeneration]  | Describes generation in detail using a `prov:Generation` node | Yes      |
| :rdfterm[prov:qualifiedAttribution] | Provides detailed attribution via a `prov:Attribution` node   | Yes      |
| :rdfterm[prov:qualifiedDerivation]  | Provides detailed derivation via a `prov:Derivation` node     | Yes      |
| :rdfterm[prov:wasRevisionOf]        | Indicates this entity is a revision of another                | Yes      |

---

## Composition

A :rdfterm[prov:Entity] often has multiple roles. In SDL it may be used alongside:

* :rdfterm[dcat:Resource] and :rdfterm[dcat:Dataset] to represent data objects
* :rdfterm[sosa:Observation] and :rdfterm[sosa:Sample] to track scientific data

```turtle
ex:dataset1 a dcat:Dataset , prov:Entity ;
  dcterms:title "Soil Respiration Dataset" ;
  prov:wasGeneratedBy ex:workflow1 ;
  prov:wasAttributedTo ex:agent1 .
```

---

## Example — Sample with Provenance

```turtle
ex:sample1 a sosa:Sample , prov:Entity ;
  dcterms:title "Soil Core Sample 1" ;
  prov:wasGeneratedBy ex:samplingActivity ;
  prov:wasAttributedTo ex:technicianA .
```

---

## Related Classes

* :rdfterm[prov:Activity] — action that generates or uses entities
* :rdfterm[prov:Agent] — person, system, or organization involved
* :rdfterm[dcat:Dataset], :rdfterm[dcat:Distribution] — data that is often tracked as entities

---

## See Also

* [:rdfterm[prov:Entity]](https://www.w3.org/TR/prov-o/#Entity)
* [:rdfterm[prov:Activity]](https://www.w3.org/TR/prov-o/#Activity)
* [:rdfterm[prov:Agent]](https://www.w3.org/TR/prov-o/#Agent)

> Provenance modeling is essential for reproducibility, data integrity, and traceability. In SDL, :rdfterm[prov:Entity] enables clear attribution and lineage tracking across scientific workflows.
