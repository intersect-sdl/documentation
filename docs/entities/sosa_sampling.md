---
uid: 7d24f56b-0191-4df8-aaf5-2b7c3b0d8cb7
title: Entity Detail — sosa:Sampling
author: SDL Team
tags:
  - SOSA
  - RDF Class
  - Sampling
  - Entity Detail
version: 1.0
published: true
---

The `sosa:Sampling` class represents an act of creating a `sosa:Sample` to be used as a `sosa:FeatureOfInterest`. In SDL, this includes collecting soil cores, drawing water samples, or extracting air samples for subsequent analysis.

---

## 🔎 Definition

**URI**: `http://www.w3.org/ns/sosa/Sampling`

> A `sosa:Sampling` is an activity whose result is a `sosa:Sample` that is used as the `sosa:FeatureOfInterest` in an observation.

---

## 📐 Usage in SDL

In SDL, `sosa:Sampling` is used to:

* Represent the act of collecting or deriving a sample
* Link the resulting sample (`prov:generated`) to its feature of origin
* Associate agents, times, and locations with the sampling event

Sampling events establish a provenance trail for how `sosa:Sample` entities came to be.

---

## 🔄 Properties

| Property                 | Description                                            | Optional |
| ------------------------ | ------------------------------------------------------ | -------- |
| `prov:generated`         | The resulting `sosa:Sample` from the sampling activity | No       |
| `prov:used`              | The original `sosa:FeatureOfInterest` that was sampled | Yes      |
| `prov:wasAssociatedWith` | Agent (person or instrument) involved in sampling      | Yes      |
| `prov:atLocation`        | Where the sampling occurred                            | Yes      |
| `prov:startedAtTime`     | When the sampling started                              | Yes      |
| `prov:endedAtTime`       | When the sampling ended                                | Yes      |
| `dcterms:description`    | Textual description of the sampling context or method  | Yes      |

---

## 🧠 Composition

Sampling is frequently performed prior to an observation and is responsible for producing the sample that is later studied:

```turtle
ex:plot1 a sosa:FeatureOfInterest .

ex:sampling1 a sosa:Sampling ;
  prov:used ex:plot1 ;
  prov:generated ex:sample1 ;
  prov:wasAssociatedWith ex:fieldTech1 ;
  prov:startedAtTime "2024-05-01T08:00:00Z"^^xsd:dateTime .

ex:sample1 a sosa:Sample ;
  sosa:isSampleOf ex:plot1 ;
  prov:wasGeneratedBy ex:sampling1 .
```

---

## 🧪 Example — Subsampling from a Core

```turtle
ex:sampling2 a sosa:Sampling ;
  prov:used ex:coreA ;
  prov:generated ex:subAliquot ;
  prov:wasAssociatedWith ex:labTech1 .

ex:subAliquot a sosa:Sample ;
  sosa:isSampleOf ex:coreA ;
  prov:wasGeneratedBy ex:sampling2 .
```

---

## 🗂 Related Classes

* `sosa:Sample` — the result of a sampling
* `prov:Activity` — superclass of `sosa:Sampling`
* `prov:Entity` — used for both input (`prov:used`) and output (`prov:generated`)
* `sosa:FeatureOfInterest` — origin of the sample

---

## 📘 See Also

* [`sosa:Sampling`](https://www.w3.org/TR/vocab-ssn/#SOSASampling)
* [`prov:Activity`](https://www.w3.org/TR/prov-o/#Activity)
* [`sosa:Sample`](https://www.w3.org/TR/vocab-ssn/#SOSASample)

> `sosa:Sampling` defines the critical link between original context and derived material — essential for scientific traceability.
