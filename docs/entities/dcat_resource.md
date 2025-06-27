---
uuid: 1390e5a5-5182-405e-8f99-20a6a86cc25f
title: Entity Detail — dcat:Resource
author: SDL Team
tags:
    - DCAT
    - RDF Class
    - Resource
    - Entity Detail
version: 1.0
published: true
---

The `dcat:Resource` class is a general-purpose superclass in the DCAT vocabulary. In SDL, it is used to describe any discoverable resource — including datasets, systems, distributions, samples, or documentation — that may appear in a `dcat:Catalog`.

---

## 🔎 Definition

**URI**: `http://www.w3.org/ns/dcat#Resource`

> A `dcat:Resource` is any resource that can be described in a catalog. It is a superclass of `dcat:Dataset`, `dcat:Distribution`, `dcat:DataService`, and may be applied to arbitrary types to enable cataloging.

---

## 📐 Usage in SDL

In SDL, `dcat:Resource` is used to:

* Enable cataloging of non-dataset entities (e.g., instruments, samples, documents)
* Provide a common metadata pattern for discoverable content
* Support mixed-type catalogs where all entries share core descriptive fields

Common SDL entities typed as `dcat:Resource`:

* `ssn:System`
* `sosa:Sample`
* `doco:Document`
* Custom workflow or platform instances

---

## 🔄 Common Properties

| Property              | Description                                 | Optional |
| --------------------- | ------------------------------------------- | -------- |
| `dcterms:title`       | Human-readable title                        | No       |
| `dcterms:description` | Description of the resource                 | Yes      |
| `dcterms:identifier`  | Persistent or unique identifier             | No       |
| `dcterms:issued`      | Date issued or published                    | Yes      |
| `dcterms:modified`    | Last modified timestamp                     | Yes      |
| `dcat:keyword`        | Tagging and indexing terms                  | Yes      |
| `dcterms:language`    | Language of the resource                    | Yes      |
| `dcterms:license`     | License associated with the resource        | Yes      |
| `dcterms:rights`      | Rights statement for the resource           | Yes      |
| `dcterms:publisher`   | Entity responsible for making the resource  | Yes      |
| `foaf:homepage`       | Link to additional documentation or webpage | Yes      |

---

## 🧠 Composition

A resource in SDL typically has:

* At least one type (e.g., `sosa:Sample`, `ssn:System`)
* A set of `dcterms:*` properties for labeling and tracking
* Optional domain-specific properties depending on context

```turtle
ex:licor8250a a ssn:System , dcat:Resource ;
  dcterms:title "LI-COR 8250 Sensor Rig" ;
  dcterms:identifier "rig-2023a" ;
  dcterms:issued "2023-04-20"^^xsd:date .
```

---

## 🧪 Example — Sample as a Resource

```turtle
ex:sample1 a sosa:Sample , dcat:Resource ;
  dcterms:title "Sample 1 from Incubation A" ;
  dcterms:identifier "sample-0001" ;
  dcterms:issued "2024-06-01"^^xsd:date ;
  sosa:isSampleOf ex:core1 .
```

This allows `ex:sample1` to be indexed and retrieved in catalogs.

---

## 🗂 Related Classes

* `dcat:Catalog` — container of resources
* `dcat:Dataset` — subclass with additional structure
* `prov:Entity` — often used alongside for provenance

---

## 📘 See Also

* [`dcat:Catalog`](https://www.w3.org/TR/vocab-dcat-3/#Class:Catalog)
* [`dcat:Dataset`](https://www.w3.org/TR/vocab-dcat-3/#Class:Dataset)
* [`prov:Entity`](https://www.w3.org/TR/prov-o/)

> `dcat:Resource` provides a flexible foundation for entity discovery, making it a central building block in SDL's cataloging system.
