---
uuid: a53bc456-1219-41f0-b8f3-ecf5245c4d59
title: Entity Detail — dcat:Distribution
author: SDL Team
tags:
  - DCAT
  - RDF Class
  - Distribution
  - Entity Detail
version: 1.0
published: true
---

The `dcat:Distribution` class describes an accessible form of a dataset — for example, a downloadable file, an API endpoint, or an archived package. In SDL, this entity is used to link scientific datasets with their physical or digital representations.

---

## 🔎 Definition

**URI**: `http://www.w3.org/ns/dcat#Distribution`

> A `dcat:Distribution` represents an accessible form of a `dcat:Dataset`, such as a downloadable file or service endpoint.

---

## 📐 Usage in SDL

In SDL, `dcat:Distribution` is used to:

* Represent downloadable datasets (CSV, NetCDF, JSON, etc.)
* Link to files in object stores or external archives
* Describe APIs or service-based access points
* Provide metadata for accessing and interpreting dataset content

Distributions are typically managed or referenced through the `repository-service` or generated during data publication workflows.

---

## 🔄 Properties

| Property              | Description                                            | Optional |
| --------------------- | ------------------------------------------------------ | -------- |
| `dcterms:title`       | Human-readable name for the distribution               | Yes      |
| `dcterms:description` | Description of the file or service                     | Yes      |
| `dcat:downloadURL`    | URL where the distribution can be directly accessed    | No       |
| `dcat:accessURL`      | Link to landing page or access service                 | Yes      |
| `dcat:mediaType`      | IANA media type (e.g., `text/csv`, `application/json`) | No       |
| `dcat:byteSize`       | Size of the distribution in bytes                      | Yes      |
| `dcterms:format`      | File format, if known                                  | Yes      |
| `dcterms:license`     | License for the distribution                           | Yes      |
| `dcterms:issued`      | Publication date                                       | Yes      |
| `dcterms:modified`    | Last update date                                       | Yes      |
| `dcterms:language`    | Language of the distribution content                   | Yes      |
| `foaf:page`           | Link to a human-readable documentation or page         | Yes      |

---

## 🧠 Composition

A `dcat:Distribution` may be associated with:

* One or more `dcat:Dataset`
* `prov:Entity` for provenance tracking
* `rdf:type` values such as `sosa:Observation` or `prov:Entity` when representing data products

```turtle
ex:dist-co2-csv a dcat:Distribution , prov:Entity ;
  dcterms:title "CSV Download" ;
  dcat:mediaType "text/csv" ;
  dcat:downloadURL <https://example.org/data/co2.csv> .
```

---

## 🧪 Example — Multiple Formats

```turtle
ex:dataset-co2 a dcat:Dataset ;
  dcterms:title "CO2 Emissions from Soil Cores" ;
  dcat:distribution ex:dist-csv , ex:dist-nc .

ex:dist-csv a dcat:Distribution ;
  dcat:mediaType "text/csv" ;
  dcat:downloadURL <https://example.org/data/co2.csv> .

ex:dist-nc a dcat:Distribution ;
  dcat:mediaType "application/netcdf" ;
  dcat:downloadURL <https://example.org/data/co2.nc> .
```

---

## 🗂 Related Classes

* `dcat:Dataset` — parent of the distribution
* `prov:Entity` — distribution may carry provenance info
* `foaf:Document` — often used for static documentation

---

## 📘 See Also

* [`dcat:Distribution`](https://www.w3.org/TR/vocab-dcat-3/#Class:Distribution)
* [`dcat:Dataset`](https://www.w3.org/TR/vocab-dcat-3/#Class:Dataset)
* [`prov:Entity`](https://www.w3.org/TR/prov-o/)

> `dcat:Distribution` bridges the gap between abstract datasets and concrete data representations. In SDL, it plays a critical role in enabling reproducibility and accessibility.
