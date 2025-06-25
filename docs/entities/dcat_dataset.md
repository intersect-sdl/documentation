---
id: 50e5bdb1-7aa2-4c0e-abe3-4f00232bd913
title: Entity Detail — dcat:Dataset
author: SDL Team
tags:
  - DCAT
  - RDF Class
  - Dataset
  - Entity Detail
version: 1.0
---

# `dcat:Dataset`

The `dcat:Dataset` class describes a collection of data that is published or curated. In SDL, it is used to represent datasets derived from scientific measurements, experimental workflows, sample analyses, and other research outputs.

---

## 🔎 Definition

**URI**: `http://www.w3.org/ns/dcat#Dataset`

> A `dcat:Dataset` is a collection of data, published or curated by a single agent, and available for access or download through one or more distributions.

---

## 📐 Usage in SDL

In SDL, `dcat:Dataset` is used to:

* Represent a scientific dataset as a first-class entity
* Connect distributions of data files
* Record metadata about the origin, purpose, and licensing of the dataset
* Track provenance and publishing events

Datasets often appear in `dcat:Catalog` entries and are managed through the `catalog-service` or `repository-service`.

---

## 🔄 Properties

| Property              | Description                                        | Optional |
| --------------------- | -------------------------------------------------- | -------- |
| `dcterms:title`       | Human-readable title                               | No       |
| `dcterms:description` | Description of the dataset                         | Yes      |
| `dcterms:identifier`  | Persistent or unique identifier                    | No       |
| `dcterms:issued`      | Date the dataset was first published               | Yes      |
| `dcterms:modified`    | Last modified date                                 | Yes      |
| `dcterms:publisher`   | Responsible organization or agent                  | Yes      |
| `dcterms:creator`     | Person or agent that created the dataset           | Yes      |
| `dcterms:language`    | Language of the dataset content                    | Yes      |
| `dcterms:license`     | License under which the dataset is published       | Yes      |
| `dcat:keyword`        | Tags or subject keywords                           | Yes      |
| `dcat:theme`          | Theme or classification of the dataset             | Yes      |
| `dcat:distribution`   | Links to one or more `dcat:Distribution` resources | Yes      |
| `foaf:page`           | Link to a landing page or documentation            | Yes      |

---

## 🧠 Composition

A `dcat:Dataset` may also be typed as:

* `prov:Entity` — to track how the dataset was generated
* `dcat:Resource` — to support catalog membership

It may be linked to observations, samples, workflows, or provenance traces depending on the data’s origin.

---

## 🧪 Example

```turtle
ex:dataset-co2 a dcat:Dataset , prov:Entity , dcat:Resource ;
  dcterms:title "CO2 Emissions from Soil Cores" ;
  dcterms:identifier "ds-co2-001" ;
  dcterms:issued "2023-10-01"^^xsd:date ;
  dcat:keyword "CO2" , "soil respiration" ;
  dcat:distribution ex:dist-co2-csv .

ex:dist-co2-csv a dcat:Distribution ;
  dcterms:title "CSV Download" ;
  dcat:mediaType "text/csv" ;
  dcat:downloadURL <https://example.org/data/co2.csv> .
```

---

## 🗂 Related Classes

* `dcat:Distribution` — describes file-based or service-based access
* `prov:Entity` — used to track dataset provenance
* `dcat:Catalog` — catalogs contain one or more datasets

---

## 📘 See Also

* [`dcat:Dataset`](https://www.w3.org/TR/vocab-dcat-3/#Class:Dataset)
* [`dcat:Distribution`](https://www.w3.org/TR/vocab-dcat-3/#Class:Distribution)
* [`prov:Entity`](https://www.w3.org/TR/prov-o/)

> `dcat:Dataset` is central to managing scientific output in SDL and supports FAIR principles by enabling structured metadata and discoverable distributions.
