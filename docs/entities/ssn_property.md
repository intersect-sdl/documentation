---
id: 0ccfdb7a-0062-4c29-8e53-b3ea73a71be2
title: ssn:Property
author: SDL Team
tags:
  - SSN
  - RDF Class
  - Property
  - Entity Detail
version: 1.0
published: true
---

The :rdfterm[ssn:Property] class represents observable or measurable characteristics of real-world entities. In SDL, :rdfterm[ssn:Property] is used to define what is being observed by a system or sensor, such as temperature, pH, or conductivity.

---

## Definition

**URI**: `http://www.w3.org/ns/ssn/Property`

> A :rdfterm[ssn:Property] is an aspect of an entity that can be observed or measured by a sensor or computation.

---

## Usage in SDL

In SDL, :rdfterm[ssn:Property] is used to:

* Define the type of phenomenon being observed
* Drive consistency across observation data
* Enable semantic alignment with domain ontologies and units

A :rdfterm[ssn:Property] is typically linked from :rdfterm[sosa:Observation] using :rdfterm[sosa:observedProperty], and from :rdfterm[ssn:System] using `ssn:forProperty`.

---

## Properties

| Property              | Description                                             | Optional |
| --------------------- | ------------------------------------------------------- | -------- |
| :rdfterm[dcterms:identifier]  | A unique ID for the property                            | Yes      |
| :rdfterm[dcterms:title]       | A human-readable label                                  | Yes      |
| :rdfterm[dcterms:description] | Free-text description of what the property measures     | Yes      |
| :rdfterm[rdfs:subClassOf]     | Optional semantic classification from a domain ontology | Yes      |
| :rdfterm[skos:exactMatch]     | External URI that semantically matches the property     | Yes      |

---

## Composition and Relationships

Properties are used in both observation and deployment models:

```turtle
ex:temperature a ssn:Property ;
  dcterms:title "Air Temperature" ;
  skos:exactMatch <http://qudt.org/vocab/quantitykind/Temperature> .

ex:obs123 a sosa:Observation ;
  sosa:observedProperty ex:temperature ;
  sosa:hasResult ex:result42 .
```

---

## Common Properties in SDL

Here are some common properties used in SDL:

* `ex:co2` — CO₂ concentration ([QUDT: MolarConcentration](http://qudt.org/vocab/quantitykind/MolarConcentration))
* `ex:ph` — Soil or water pH ([QUDT: Acidity](http://qudt.org/vocab/quantitykind/Acidity))
* `ex:temperature` — Air or soil temperature ([QUDT: Temperature](http://qudt.org/vocab/quantitykind/Temperature))
* `ex:moisture` — Soil volumetric water content ([QUDT: MoistureContent](http://qudt.org/vocab/quantitykind/MoistureContent))
* [Plant specific Properties](/platforms/bessd/properties/properties_plants_overview)
* [Observational Properties based on PlantCV](/platforms/bessd/properties/plantcv)
* [Solid State Chemistry Specific Properties](/platforms/acl/properties/properties_solid_state_chemistry)

---

## Related Classes

* :rdfterm[sosa:Observation] — uses :rdfterm[sosa:observedProperty]
* :rdfterm[ssn:System] — configured to detect specific :rdfterm[ssn:Property]
* :rdfterm[qudt:QuantityKind] — semantic alignment to units and scientific meaning

---

## See Also

* [:rdfterm[ssn:Property]](https://www.w3.org/TR/vocab-ssn/#Property)
* [:rdfterm[qudt:QuantityKind]](http://qudt.org/schema/qudt/QuantityKind)
* [:rdfterm[sosa:observedProperty]](https://www.w3.org/TR/vocab-ssn/#SOSAobservedProperty)

> :rdfterm[ssn:Property] connects what is being sensed to a shared semantic understanding — a foundation for interoperable scientific data.
