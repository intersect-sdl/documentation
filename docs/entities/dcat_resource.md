---
id: 1390e5a5-5182-405e-8f99-20a6a86cc25f
title: dcat:Resource
author: SDL Team
tags:
    - DCAT
    - RDF Class
    - Resource
    - Entity Detail
version: 1.0
published: true
---

The :rdfterm[dcat:Resource] class is a general-purpose superclass in the DCAT vocabulary. In SDL, it is used to describe any discoverable resource — including datasets, systems, distributions, samples, or documentation — that may appear in a :rdfterm[dcat:Catalog].

---

## Definition

**URI**: `http://www.w3.org/ns/dcat#Resource`

> A :rdfterm[dcat:Resource] is any resource that can be described in a catalog. It is a superclass of :rdfterm[dcat:Dataset], :rdfterm[dcat:Distribution], `dcat:DataService`, and may be applied to arbitrary types to enable cataloging.

---

## Usage in SDL

In SDL, :rdfterm[dcat:Resource] is used to:

* Enable cataloging of non-dataset entities (e.g., instruments, samples, documents)
* Provide a common metadata pattern for discoverable content
* Support mixed-type catalogs where all entries share core descriptive fields

Common SDL entities typed as :rdfterm[dcat:Resource]:

* :rdfterm[ssn:System]
* :rdfterm[sosa:Sample]
* `doco:Document`
* Custom workflow or platform instances

---

## Common Properties

| Property              | Description                                 | Optional |
| --------------------- | ------------------------------------------- | -------- |
| :rdfterm[dcterms:title]       | Human-readable title                        | No       |
| :rdfterm[dcterms:description] | Description of the resource                 | Yes      |
| :rdfterm[dcterms:identifier]  | Persistent or unique identifier             | No       |
| :rdfterm[dcterms:issued]      | Date issued or published                    | Yes      |
| :rdfterm[dcterms:modified]    | Last modified timestamp                     | Yes      |
| :rdfterm[dcat:keyword]        | Tagging and indexing terms                  | Yes      |
| :rdfterm[dcterms:language]    | Language of the resource                    | Yes      |
| :rdfterm[dcterms:license]     | License associated with the resource        | Yes      |
| :rdfterm[dcterms:rights]      | Rights statement for the resource           | Yes      |
| :rdfterm[dcterms:publisher]   | Entity responsible for making the resource  | Yes      |
| :rdfterm[foaf:homepage]       | Link to additional documentation or webpage | Yes      |

---

## Composition

A resource in SDL typically has:

* At least one type (e.g., :rdfterm[sosa:Sample], :rdfterm[ssn:System])
* A set of `dcterms:*` properties for labeling and tracking
* Optional domain-specific properties depending on context

```turtle
ex:licor8250a a ssn:System , dcat:Resource ;
  dcterms:title "LI-COR 8250 Sensor Rig" ;
  dcterms:identifier "rig-2023a" ;
  dcterms:issued "2023-04-20"^^xsd:date .
```

---

## Example — Sample as a Resource

```turtle
ex:sample1 a sosa:Sample , dcat:Resource ;
  dcterms:title "Sample 1 from Incubation A" ;
  dcterms:identifier "sample-0001" ;
  dcterms:issued "2024-06-01"^^xsd:date ;
  sosa:isSampleOf ex:core1 .
```

This allows `ex:sample1` to be indexed and retrieved in catalogs.

---

## Related Classes

* :rdfterm[dcat:Catalog] — container of resources
* :rdfterm[dcat:Dataset] — subclass with additional structure
* :rdfterm[prov:Entity] — often used alongside for provenance

---

## See Also

* [:rdfterm[dcat:Catalog]](https://www.w3.org/TR/vocab-dcat-3/#Class:Catalog)
* [:rdfterm[dcat:Dataset]](https://www.w3.org/TR/vocab-dcat-3/#Class:Dataset)
* [:rdfterm[prov:Entity]](https://www.w3.org/TR/prov-o/)

> :rdfterm[dcat:Resource] provides a flexible foundation for entity discovery, making it a central building block in SDL's cataloging system.
