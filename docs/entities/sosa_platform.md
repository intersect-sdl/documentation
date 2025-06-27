---
uuid: 52f67437-d30a-4c84-9221-08dcf667d920
title: Entity Detail — sosa:Platform
author: SDL Team
tags:
  - SOSA
  - SSN
  - RDF Class
  - Platform
  - Entity Detail
version: 1.0
published: true
---

The `sosa:Platform` class represents a physical or logical structure that hosts sensors, samplers, or systems. In SDL, `sosa:Platform` is used to model sensor rigs, laboratory stations, UAVs, vehicles, and field installations that carry one or more deployed systems.

---

## 🔎 Definition

**URI**: `http://www.w3.org/ns/sosa/Platform`

> A `sosa:Platform` is an entity that can carry one or more `sosa:Sensor`, `sosa:Sampler`, or `sosa:Actuator` and may move or remain fixed.

---

## 📐 Usage in SDL

In SDL, `sosa:Platform` is used to:

* Identify fixed or mobile hosts for sensor systems
* Organize deployments based on spatial, organizational, or project structure
* Associate systems and observations with their hosting infrastructure
* Enable reusability of components across deployments

Platforms often appear in `ssn:Deployment` via the `ssn:deployedOnPlatform` property.

---

## 🔄 Properties

| Property               | Description                                              | Optional |
| ---------------------- | -------------------------------------------------------- | -------- |
| `dcterms:identifier`   | Unique identifier for the platform                       | Yes      |
| `dcterms:title`        | Human-readable name or label                             | Yes      |
| `dcterms:description`  | Textual description of the platform                      | Yes      |
| `dcterms:spatial`      | Spatial coverage or geometry of the platform             | Yes      |
| `ssn:hasDeployment`    | Inverse property linking to associated `ssn:Deployment`  | Yes      |
| `sosa:hosts`           | Links platform to hosted sensors or systems              | Yes      |
| `prov:wasAttributedTo` | Agent responsible for managing or deploying the platform | Yes      |

---

## 🧠 Composition

A platform may host one or more systems, each of which can be deployed separately:

```turtle
ex:rigPlatform1 a sosa:Platform ;
  dcterms:title "Field Station Rig A" ;
  sosa:hosts ex:li8250_system , ex:met_station .
```

---

## 🧪 Example — Platform and Deployment

```turtle
ex:rig1 a sosa:Platform ;
  dcterms:identifier "rig-a" ;
  dcterms:title "Gas Exchange Platform A" ;
  dcterms:spatial ex:plotA .

ex:deploymentA a ssn:Deployment ;
  ssn:deployedSystem ex:li8250_system ;
  ssn:deployedOnPlatform ex:rig1 ;
  prov:startedAtTime "2024-03-01T08:00:00Z"^^xsd:dateTime .
```

---

## 🗂 Related Classes

* `ssn:Deployment` — deployment context of systems on platforms
* `ssn:System` — sensor or processing unit hosted by the platform
* `prov:Agent` — responsible organization or maintainer

---

## 📘 See Also

* [`sosa:Platform`](https://www.w3.org/TR/vocab-ssn/#SOSAPlatform)
* [`ssn:Deployment`](https://www.w3.org/TR/vocab-ssn/#SOSADeployment)
* [`sosa:hosts`](https://www.w3.org/TR/vocab-ssn/#SOSAhosts)

> Platforms in SDL provide structure for system deployment, enabling repeatability, reuse, and accurate interpretation of environmental or laboratory observations.
