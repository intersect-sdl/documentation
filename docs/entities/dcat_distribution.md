---
id: a53bc456-1219-41f0-b8f3-ecf5245c4d59
title: dcat:Distribution
author: SDL Team
tags:
  - DCAT
  - RDF Class
  - Distribution
  - Entity Detail
version: 1.0
published: true
---

The :rdfterm[dcat:Distribution] class describes an accessible form of a dataset — for example, a downloadable file, an API endpoint, or an archived package. In SDL, this entity is used to link scientific datasets with their physical or digital representations.

---

## Definition

**URI**: `http://www.w3.org/ns/dcat#Distribution`

> A :rdfterm[dcat:Distribution] represents an accessible form of a :rdfterm[dcat:Dataset], such as a downloadable file or service endpoint.

---

## Usage in SDL

In SDL, :rdfterm[dcat:Distribution] is used to:

* Represent downloadable datasets (CSV, NetCDF, JSON, etc.)
* Link to files in object stores or external archives
* Describe APIs or service-based access points
* Provide metadata for accessing and interpreting dataset content

Distributions are typically managed or referenced through the `repository-service` or generated during data publication workflows.

---

## Properties

| Property              | Description                                            | Optional |
| --------------------- | ------------------------------------------------------ | -------- |
| :rdfterm[dcterms:title]       | Human-readable name for the distribution               | Yes      |
| :rdfterm[dcterms:description] | Description of the file or service                     | Yes      |
| :rdfterm[dcat:downloadURL]    | URL where the distribution can be directly accessed    | No       |
| :rdfterm[dcat:accessURL]      | Link to landing page or access service                 | Yes      |
| :rdfterm[dcat:mediaType]      | IANA media type (e.g., `text/csv`, `application/json`) | No       |
| :rdfterm[dcat:byteSize]       | Size of the distribution in bytes                      | Yes      |
| :rdfterm[dcterms:format]      | File format, if known                                  | Yes      |
| :rdfterm[dcterms:license]     | License for the distribution                           | Yes      |
| :rdfterm[dcterms:issued]      | Publication date                                       | Yes      |
| :rdfterm[dcterms:modified]    | Last update date                                       | Yes      |
| :rdfterm[dcterms:language]    | Language of the distribution content                   | Yes      |
| :rdfterm[foaf:page]           | Link to a human-readable documentation or page         | Yes      |

---

## Composition

A :rdfterm[dcat:Distribution] may be associated with:

* One or more :rdfterm[dcat:Dataset]
* :rdfterm[prov:Entity] for provenance tracking
* :rdfterm[rdf:type] values such as :rdfterm[sosa:Observation] or :rdfterm[prov:Entity] when representing data products

```turtle
ex:dist-co2-csv a dcat:Distribution , prov:Entity ;
  dcterms:title "CSV Download" ;
  dcat:mediaType "text/csv" ;
  dcat:downloadURL <https://example.org/data/co2.csv> .
```

---

## Example — Multiple Formats

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

## Related Classes

* :rdfterm[dcat:Dataset] — parent of the distribution
* :rdfterm[prov:Entity] — distribution may carry provenance info
* :rdfterm[foaf:Document] — often used for static documentation

---

## See Also

* [:rdfterm[dcat:Distribution]](https://www.w3.org/TR/vocab-dcat-3/#Class:Distribution)
* [:rdfterm[dcat:Dataset]](https://www.w3.org/TR/vocab-dcat-3/#Class:Dataset)
* [:rdfterm[prov:Entity]](https://www.w3.org/TR/prov-o/)

> :rdfterm[dcat:Distribution] bridges the gap between abstract datasets and concrete data representations. In SDL, it plays a critical role in enabling reproducibility and accessibility.
