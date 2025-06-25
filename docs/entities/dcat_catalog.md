---
id: 27b4ef25-8d9b-4689-bf08-84159c8edc1c
title: Entity Detail — dcat:Catalog
author: SDL Team
tags:
  - DCAT
  - RDF Class
  - Catalog
  - Entity Detail
version: 1.0

---

The `dcat:Catalog` class represents a curated collection of datasets or other resources. In SDL, it is used to organize and expose datasets, sensor systems, documents, or workflows in a semantically rich and discoverable manner.

---

## 🔎 Definition

**URI**: `http://www.w3.org/ns/dcat#Catalog`

> A `dcat:Catalog` is a curated collection of metadata about datasets or other resources. It is often used to publish and maintain lists of available data within a domain, institution, or research program.

---

## 📐 Usage in SDL

In SDL, `dcat:Catalog` is used to:

* Group datasets under a common theme or organizational unit
* Publish collections of `ssn:System` entities, e.g., instrument registries
* Publish collections of `sosa:Sample` entities for sample registries
* Serve as the root container for dataset discovery interfaces
* Provide metadata about the catalog itself (creator, issued date, description, etc.)

Catalogs are typically exposed via the `catalog-service` and managed using an LDP `BasicContainer`.

---

## 🔄 Related Properties

| Property              | Description                                                |
| --------------------- | ---------------------------------------------------------- |
| `dcat:dataset`        | Links a catalog to its constituent `dcat:Dataset` entities |
| `dcat:resource`       | Links the catalog to generic `dcat:Resource` members       |
| `dcterms:title`       | A human-readable title for the catalog                     |
| `dcterms:description` | Textual description of the catalog's contents              |
| `dcterms:publisher`   | The entity responsible for maintaining the catalog         |
| `dcterms:issued`      | The date the catalog was first published                   |
| `dcterms:modified`    | The last modified date                                     |
| `foaf:homepage`       | A link to the catalog homepage                             |

---

## 🧠 Composition

A `dcat:Catalog` may also be treated as:

* `prov:Entity` — to track the provenance of catalog publication
* `dcat:Resource` — when applying shared metadata patterns (e.g. licensing, rights)

---

## 🗂 Container Pattern

Catalogs are managed using LDP **BasicContainers**, allowing each catalog to be treated as a resource with directly contained datasets or resources:

```turtle
ex:myCatalog a dcat:Catalog , ldp:BasicContainer ;
  dcterms:title "SDL Catalog of Gas Flux Experiments" ;
  dcat:dataset ex:dataset1 , ex:dataset2 .
```

---

## 🧪 Examples

### Dataset Catalog

```turtle
ex:catalog1 a dcat:Catalog ;
  dcterms:title "Soil Respiration Experiments" ;
  dcterms:description "Datasets describing CH4 and CO2 flux from soil incubation studies." ;
  dcterms:issued "2024-04-12"^^xsd:date ;
  dcat:dataset ex:dataset-co2 , ex:dataset-ch4 .
```

### System Catalog using `dcat:resource`

```turtle
ex:sensorCatalog a dcat:Catalog ;
  dcterms:title "Catalog of Gas Sensor Platforms" ;
  dcat:resource ex:licor8250a , ex:licor8250b .

ex:licor8250a a ssn:System , sosa:Sensor , dcat:Resource ;
  dcterms:title "LI-8250 System A" ;
  ssn:hasSubSystem ex:li8250 , ex:li8250_headspace .
```

### Sample Catalog using `dcat:resource`

```turtle
ex:sampleCatalog a dcat:Catalog ;
  dcterms:title "Soil Gas Samples" ;
  dcat:resource ex:sample1 , ex:sample2 .

ex:sample1 a sosa:Sample , dcat:Resource ;
  dcterms:title "Sample 1 from Incubation A" ;
  sosa:isSampleOf ex:core1 .
```

This example shows how `sosa:Sample` entities are cataloged as `dcat:Resource` members to support sample tracking.

---

## 📘 See Also

* [`dcat:Dataset`](https://www.w3.org/TR/vocab-dcat-3/#Class:Dataset)
* [`dcat:Resource`](https://www.w3.org/TR/vocab-dcat-3/#Class:Resource)
* [`ssn:System`](https://www.w3.org/TR/vocab-ssn/#ssn-system)
* [`sosa:Sample`](https://www.w3.org/TR/vocab-ssn/#SOSA)
* [SDL Catalog Service Documentation](./services/catalog.md)

> Catalogs play a critical role in discoverability, curation, and organization of SDL datasets, systems, samples, and other semantic resources.
