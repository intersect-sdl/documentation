---
uuid: 8a790fe4-d6d1-41e3-b404-08d1696cb144
title: Entity Detail — sosa:FeatureOfInterest
author: SDL Team
tags:
  - SOSA
  - RDF Class
  - Feature
  - Entity Detail
version: 1.0
published: true
---

The `sosa:FeatureOfInterest` class represents the entity whose properties are being observed or measured. In SDL, this typically refers to a sample, plot, material, or environment that is the subject of scientific observations.

---

## 🔎 Definition

**URI**: `http://www.w3.org/ns/sosa/FeatureOfInterest`

> A `sosa:FeatureOfInterest` is an entity whose observable properties are of interest and are the target of an observation.

---

## 📐 Usage in SDL

In SDL, `sosa:FeatureOfInterest` is used to:

* Link observations to the real-world or sample-based context being observed
* Identify samples, environments, or systems whose properties are studied
* Anchor measurements to features such as soil plots, water bodies, equipment, or specimens

All `sosa:Observation` instances should include a `sosa:hasFeatureOfInterest` property pointing to the relevant feature.

---

## 🔄 Properties

| Property               | Description                                            | Optional |
| ---------------------- | ------------------------------------------------------ | -------- |
| `dcterms:identifier`   | Unique ID or URI for the feature                       | Yes      |
| `dcterms:title`        | Human-readable label                                   | Yes      |
| `dcterms:description`  | Textual description of the feature                     | Yes      |
| `geo:hasGeometry`      | Geospatial location or shape                           | Yes      |
| `prov:wasAttributedTo` | Agent responsible for defining or curating the feature | Yes      |
| `prov:wasGeneratedBy`  | Event or activity that originated the feature          | Yes      |

---

## 🧠 Composition

Any entity can be a feature of interest if it is linked from an observation. This includes:

* `sosa:Sample` (e.g., a soil or water sample)
* `sosa:Platform` (e.g., a rig or station)
* Environmental features (e.g., locations, plots, ecosystems)

```turtle
ex:sampleA a sosa:Sample , sosa:FeatureOfInterest ;
  dcterms:title "Soil Sample A" .

ex:obsA a sosa:Observation ;
  sosa:hasFeatureOfInterest ex:sampleA ;
  sosa:observedProperty ex:ph ;
  sosa:hasResult ex:result1 .
```

---

## 🧪 Example — Plot as Feature of Interest

```turtle
ex:plot1 a sosa:FeatureOfInterest ;
  dcterms:title "Field Plot 1" ;
  geo:hasGeometry ex:geometry1 .

ex:obsB a sosa:Observation ;
  sosa:hasFeatureOfInterest ex:plot1 ;
  sosa:observedProperty ex:soilTemp ;
  sosa:hasResult ex:tempValue .
```

---

## 🗂 Related Classes

* `sosa:Observation` — observations reference features via `sosa:hasFeatureOfInterest`
* `sosa:Sample` — typically also a `sosa:FeatureOfInterest`
* `geo:Geometry` — describes location of spatial features
* `prov:Entity` — used when tracking provenance of the feature

---

## 📘 See Also

* [`sosa:FeatureOfInterest`](https://www.w3.org/TR/vocab-ssn/#SOSAFeatureOfInterest)
* [`geo:hasGeometry`](https://www.w3.org/2003/01/geo/)
* [`sosa:Observation`](https://www.w3.org/TR/vocab-ssn/#SOSAObservation)

> `sosa:FeatureOfInterest` provides the semantic anchor for scientific measurements — ensuring all observations are clearly linked to their contextual targets.
