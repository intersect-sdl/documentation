---
uuid: 740ed579-c185-4c59-a5b1-63a2024bb8a0
title: Entity Detail — sosa:Result
author: SDL Team
tags:
  - SOSA
  - RDF Class
  - Result
  - Entity Detail
version: 1.0
published: true
---

The `sosa:Result` class represents the outcome of a `sosa:Observation`, `sosa:Actuation`, or `sosa:Sampling`. In SDL, results typically capture measured values, such as pH, temperature, or CO₂ concentration, often modeled as quantitative values or references to data files.

---

## 🔎 Definition

**URI**: `http://www.w3.org/ns/sosa/Result`

> A `sosa:Result` is the outcome of an observation, actuation, or sampling, which may be a value, media file, or material entity.

---

## 📐 Usage in SDL

In SDL, `sosa:Result` is used to:

* Store the value or representation of a scientific measurement
* Link observations to meaningful outputs
* Represent both scalar values (e.g., numbers, text) and structured results (e.g., files, JSON, quantity values)

---

## 🔄 Properties

| Property              | Description                                                | Optional |
| --------------------- | ---------------------------------------------------------- | -------- |
| `dcterms:identifier`  | Identifier for the result                                  | Yes      |
| `dcterms:title`       | Human-readable name or label                               | Yes      |
| `dcterms:description` | Description of the result                                  | Yes      |
| `rdf:value`           | The actual value (number, string, etc.)                    | Yes      |
| `qudt:numericValue`   | Quantity value if using QUDT format                        | Yes      |
| `qudt:unit`           | Associated unit of measurement                             | Yes      |
| `prov:wasGeneratedBy` | Sampling or observation activity that generated the result | Yes      |
| `dcat:downloadURL`    | If result is a file, the link to access it                 | Yes      |

---

## 🧠 Composition

Results can be literal values, quantity values, or links to structured files:

```turtle
ex:obs1 a sosa:Observation ;
  sosa:hasResult ex:result1 .

ex:result1 a sosa:Result ;
  rdf:value "7.1"^^xsd:decimal ;
  qudt:unit unit:PH ;
  dcterms:description "Measured pH of the soil solution" .
```

Or:

```turtle
ex:resultFile a sosa:Result ;
  dcat:downloadURL <https://example.org/data/sample42.csv> ;
  dcterms:description "Raw data export from gas analyzer" .
```

---

## 🧪 Example — Quantity Value

```turtle
ex:co2Result a sosa:Result ;
  qudt:numericValue "396.2"^^xsd:float ;
  qudt:unit unit:PPM ;
  dcterms:title "CO₂ Reading" .
```

---

## 🗂 Related Classes

* `sosa:Observation` — links to result via `sosa:hasResult`
* `qudt:QuantityValue` — used to express quantitative results
* `prov:Activity` — provenance of result generation
* `dcat:Distribution` — if the result is a downloadable file

---

## 📘 See Also

* [`sosa:Result`](https://www.w3.org/TR/vocab-ssn/#SOSAResult)
* [`qudt:QuantityValue`](http://qudt.org/schema/qudt/QuantityValue)
* [`rdf:value`](https://www.w3.org/TR/rdf-schema/#ch_value)
* [`dcat:downloadURL`](https://www.w3.org/TR/vocab-dcat/#Property:distribution_downloadURL)

> `sosa:Result` anchors the measurement data in SDL — enabling interoperability across values, files, and quantitative models.
