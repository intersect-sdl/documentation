---
uuid: 96d99738-12e1-4ed0-a19e-50cbd7e5cc16
title: Entity Detail — sosa:ObservableProperty
published: true
tags:
  - SOSA
  - RDF Class
  - Observable Property
  - Entity Detai
authors:
    - Swen Boehm
    - SDL Team
draft: true

---

The class `sosa:ObservableProperty` is a core concept from the [SOSA/SSN ontology](https://www.w3.org/TR/vocab-ssn/). It represents a quality, characteristic, or measurable feature of a phenomenon, system, or feature of interest.

---

## Definition

**IRI**: `http://www.w3.org/ns/sosa/ObservableProperty`

> An `ObservableProperty` represents **what is being observed**. It can refer to physical, chemical, biological, or conceptual characteristics. It is typically linked to `sosa:Observation` through the property `sosa:observedProperty`.

---

## Usage in SDL

In the Scientific Data Layer (SDL), `sosa:ObservableProperty` is used to describe:

* The measurable aspects of samples (e.g., phase composition, purity)
* Output targets of procedures and instruments (e.g., temperature, mass loss)
* Features of interest captured during workflows

Each observable property should be semantically described and, where applicable, typed with appropriate units and value types.

---

## Customization by Deployment

SDL supports **deployment-specific customization** of observable properties:

* Each SDL deployment may define its own set of custom observable properties, tailored to local experimental needs, instruments, and workflows.
* These custom properties may coexist alongside shared/common terms defined in shared namespaces (e.g., `acl:`, `sdl:`).
* Data types (e.g., numeric, string, URI) and associated file representations (e.g., `.xye`, `.csv`, `.txt`, `.json`) may also be customized per deployment.
* Catalog entries, shapes, and UI views can adapt based on the declared observable property types.

This flexibility allows the SDL platform to maintain **semantic interoperability** while also accommodating **local specialization and evolution** of measurements.

---

## Example

```ttl
acl:phaseComposition a sosa:ObservableProperty ;
  rdfs:label "Phase Composition" ;
  dct:description "Crystal phase derived from XRD analysis." .

acl:xrdObs123 a sosa:Observation ;
  sosa:observedProperty acl:phaseComposition ;
  sosa:hasResult [ rdf:value "Orthorhombic perovskite" ] .
```

---

## Related Terms

| Predicate                        | Description                                               |
| -------------------------------- | --------------------------------------------------------- |
| `sosa:observedProperty`          | Connects an Observation to an ObservableProperty          |
| `sosa:hasFeatureOfInterest`      | Links observation to entity being measured (sample, etc.) |
| `qudt:unit` or `schema:unitText` | Used to indicate units for numeric results                |

---

## Best Practices

* Provide `rdfs:label` and `dct:description`
* Use `qudt:unit` or similar vocabularies for measurable quantities
* Align with controlled vocabularies when available (e.g., ENVO, CHEBI)
* Reuse properties across platforms where applicable
* Clearly document locally defined properties, units, and formats to support federation

Let me know if you'd like to auto-generate a vocabulary file for your custom observable properties.
