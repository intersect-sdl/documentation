---
uuid: 3117d937-d2cd-4fa3-9621-2f2559fd5fc0
title: Entity Detail — sosa:Sample
author: SDL Team
tags:
  - SOSA
  - RDF Class
  - Sample
  - Entity Detail
version: 1.0
published: true
---

The `sosa:Sample` class represents a physical or digital subset or instance of a feature of interest used in observations. In SDL, `sosa:Sample` is used to model soil cores, water aliquots, air canisters, and other material objects collected for analysis.

---

## 🔎 Definition

**URI**: `http://www.w3.org/ns/sosa/Sample`

> A `sosa:Sample` is a `sosa:FeatureOfInterest` that is representative of a larger whole and is used in the act of making an observation.

---

## 📐 Usage in SDL

In SDL, `sosa:Sample` is used to:

* Represent a physical entity extracted for analysis
* Serve as a feature of interest in `sosa:Observation`
* Track relationships between parent and derived samples
* Record sampling locations, agents, and timestamps

Samples are modeled as entities with potential provenance (`prov:Entity`) and may be cataloged using `dcat:Resource`.

---

## 🔄 Properties

| Property               | Description                                          | Optional |
| ---------------------- | ---------------------------------------------------- | -------- |
| `sosa:isSampleOf`      | Links to the feature or system the sample represents | Yes      |
| `sosa:hasSample`       | Inverse of `sosa:isSampleOf`, used for grouping      | Yes      |
| `dcterms:title`        | Human-readable label                                 | Yes      |
| `dcterms:description`  | Description of the sample                            | Yes      |
| `dcterms:identifier`   | Sample ID                                            | Yes      |
| `dcterms:spatial`      | Location where the sample was collected              | Yes      |
| `prov:wasGeneratedBy`  | Activity or event that created the sample            | Yes      |
| `prov:wasAttributedTo` | Agent responsible for collecting the sample          | Yes      |
| `prov:atLocation`      | Collection or storage location                       | Yes      |
| `prov:startedAtTime`   | Time of sampling                                     | Yes      |

---

## 🧠 Composition

Samples in SDL may be:

* Linked to field plots, devices, or features (`sosa:isSampleOf`)
* Recorded as input to observations
* Reused or split to generate derivative samples

```turtle
ex:sample1 a sosa:Sample , prov:Entity ;
  dcterms:title "Soil Core Sample 1" ;
  sosa:isSampleOf ex:plotA ;
  prov:wasGeneratedBy ex:sampling1 ;
  prov:wasAttributedTo ex:technicianB .
```

---

## 🧪 Example — Sample Tracking with Derivation

```turtle
ex:coreA a sosa:Sample ;
  dcterms:title "Soil Core A" ;
  sosa:isSampleOf ex:plot1 .

ex:aliquot1 a sosa:Sample ;
  sosa:isSampleOf ex:coreA ;
  dcterms:title "Subsample for Moisture Content" .
```

---

## 🗂 Related Classes

* `sosa:Observation` — samples are often the feature of interest
* `prov:Entity` — to support attribution and generation
* `dcat:Resource` — cataloged and searchable in the system

---

## 📘 See Also

* [`sosa:Sample`](https://www.w3.org/TR/vocab-ssn/#SOSASample)
* [`sosa:Observation`](https://www.w3.org/TR/vocab-ssn/#SOSAObservation)
* [`prov:Entity`](https://www.w3.org/TR/prov-o/#Entity)

> `sosa:Sample` enables SDL to model traceable physical evidence used in scientific observation — critical for reproducibility and material provenance.
