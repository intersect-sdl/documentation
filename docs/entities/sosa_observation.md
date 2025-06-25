---
id: 857c9b92-3c39-4608-8806-f7fc0345b0b3
title: Entity Detail — sosa:Observation
author: SDL Team
tags:
  - SOSA
  - RDF Class
  - Observation
  - Entity Detail
version: 1.0
---

The `sosa:Observation` class represents the act of observing a property or phenomenon using a sensor, sampler, or procedure. In SDL, `sosa:Observation` is used to model the results of scientific measurements or analyses performed on physical samples or environments.

---

## 🔎 Definition

**URI**: `http://www.w3.org/ns/sosa/Observation`

> A `sosa:Observation` is an act that results in the determination of the value of a property of a feature of interest.

---

## 📐 Usage in SDL

In SDL, `sosa:Observation` is used to:

* Capture measurement events and analytic results
* Link samples or features of interest to observed properties
* Associate values, units, time, and responsible agents with recorded results
* Trace provenance of derived data products

Observations are often treated as `prov:Entity` to support attribution and workflow traceability.

---

## 🔄 Properties

| Property                    | Description                                         | Optional |
| --------------------------- | --------------------------------------------------- | -------- |
| `sosa:hasFeatureOfInterest` | The entity whose property is being observed         | No       |
| `sosa:observedProperty`     | The property that is being measured or described    | No       |
| `sosa:hasResult`            | The value or outcome of the observation             | No       |
| `sosa:madeBySensor`         | The sensor or system that performed the observation | Yes      |
| `sosa:usedProcedure`        | Procedure followed to obtain the observation        | Yes      |
| `sosa:resultTime`           | Timestamp when the result became available          | Yes      |
| `sosa:phenomenonTime`       | Time at which the observed phenomenon occurred      | Yes      |
| `prov:wasGeneratedBy`       | Activity that generated the observation             | Yes      |
| `prov:wasAttributedTo`      | Agent responsible for the observation               | Yes      |
| `dcterms:identifier`        | Identifier for the observation                      | Yes      |
| `dcterms:title`             | Human-readable title                                | Yes      |
| `dcterms:description`       | Description or notes about the observation          | Yes      |

---

## 🧠 Composition

Observations in SDL may:

* Be associated with one or more `sosa:Sample`, `prov:Activity`, or `prov:Agent`
* Be used as evidence for derived datasets
* Serve as entries in catalogs via `dcat:Resource`

```turtle
ex:obs1 a sosa:Observation , prov:Entity ;
  sosa:hasFeatureOfInterest ex:sampleA ;
  sosa:observedProperty ex:ph ;
  sosa:hasResult ex:result7_2 ;
  sosa:madeBySensor ex:probe1 ;
  sosa:resultTime "2024-04-15T10:30:00Z"^^xsd:dateTime .
```

---

## 🧪 Example — Observation with Sample and Result

```turtle
ex:sampleA a sosa:Sample ;
  dcterms:title "Soil Sample from Plot A" .

ex:result7_2 a qudt:QuantityValue ;
  qudt:numericValue "7.2"^^xsd:decimal ;
  qudt:unit qudt:PH-UNIT .

ex:obs1 a sosa:Observation , prov:Entity ;
  sosa:hasFeatureOfInterest ex:sampleA ;
  sosa:observedProperty ex:ph ;
  sosa:hasResult ex:result7_2 ;
  sosa:resultTime "2024-04-15T10:30:00Z"^^xsd:dateTime ;
  prov:wasGeneratedBy ex:activity3 ;
  prov:wasAttributedTo ex:labTech1 .
```

---

## 🗂 Related Classes

* `sosa:Sample` — may be the feature of interest
* `prov:Activity` — generating process
* `qudt:QuantityValue` — type of result used in scientific observations
* `dcat:Resource` — observations may be cataloged or referenced

---

## 📘 See Also

* [`sosa:Observation`](https://www.w3.org/TR/vocab-ssn/#SOSAObservation)
* [`sosa:Sample`](https://www.w3.org/TR/vocab-ssn/#SOSASample)
* [`qudt:QuantityValue`](http://qudt.org/schema/qudt/QuantityValue)

> `sosa:Observation` enables granular, semantically rich modeling of scientific measurements in SDL. It supports provenance, cataloging, and data integration across disciplines.
