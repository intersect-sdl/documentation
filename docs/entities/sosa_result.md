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

The :rdfterm[sosa:Result] class represents the outcome of a :rdfterm[sosa:Observation], :rdfterm[sosa:Actuation], or :rdfterm[sosa:Sampling]. In SDL, results typically capture measured values, such as pH, temperature, or CO₂ concentration, often modeled as quantitative values or references to data files.

---

## Definition

**URI**: `http://www.w3.org/ns/sosa/Result`

> A :rdfterm[sosa:Result] is the outcome of an observation, actuation, or sampling, which may be a value, media file, or material entity.

---

## Usage in SDL

In SDL, :rdfterm[sosa:Result] is used to:

* Store the value or representation of a scientific measurement
* Link observations to meaningful outputs
* Represent both scalar values (e.g., numbers, text) and structured results (e.g., files, JSON, quantity values)

---

## Properties

| Property              | Description                                                | Optional |
| --------------------- | ---------------------------------------------------------- | -------- |
| :rdfterm[dcterms:identifier]  | Identifier for the result                                  | Yes      |
| :rdfterm[dcterms:title]       | Human-readable name or label                               | Yes      |
| :rdfterm[dcterms:description] | Description of the result                                  | Yes      |
| :rdfterm[rdf:value]           | The actual value (number, string, etc.)                    | Yes      |
| :rdfterm[qudt:numericValue]   | Quantity value if using QUDT format                        | Yes      |
| :rdfterm[qudt:unit]           | Associated unit of measurement                             | Yes      |
| :rdfterm[prov:wasGeneratedBy] | Sampling or observation activity that generated the result | Yes      |
| :rdfterm[dcat:downloadURL]    | If result is a file, the link to access it                 | Yes      |

---

## Composition

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

## Example — Quantity Value

```turtle
ex:co2Result a sosa:Result ;
  qudt:numericValue "396.2"^^xsd:float ;
  qudt:unit unit:PPM ;
  dcterms:title "CO₂ Reading" .
```

---

## Related Classes

* :rdfterm[sosa:Observation] — links to result via :rdfterm[sosa:hasResult]
* :rdfterm[qudt:QuantityValue] — used to express quantitative results
* :rdfterm[prov:Activity] — provenance of result generation
* :rdfterm[dcat:Distribution] — if the result is a downloadable file

---

## 📘 See Also

* [:rdfterm[sosa:Result]](https://www.w3.org/TR/vocab-ssn/#SOSAResult)
* [:rdfterm[qudt:QuantityValue]](http://qudt.org/schema/qudt/QuantityValue)
* [:rdfterm[rdf:value]](https://www.w3.org/TR/rdf-schema/#ch_value)
* [:rdfterm[dcat:downloadURL]](https://www.w3.org/TR/vocab-dcat/#Property:distribution_downloadURL)

> :rdfterm[sosa:Result] anchors the measurement data in SDL — enabling interoperability across values, files, and quantitative models.
