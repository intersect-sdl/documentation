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

The :rdfterm[sosa:Platform] class represents a physical or logical structure that hosts sensors, samplers, or systems. In SDL, :rdfterm[sosa:Platform] is used to model sensor rigs, laboratory stations, UAVs, vehicles, and field installations that carry one or more deployed systems.

---

## Definition

**URI**: `http://www.w3.org/ns/sosa/Platform`

> A :rdfterm[sosa:Platform] is an entity that can carry one or more :rdfterm[sosa:Sensor], :rdfterm[sosa:Sampler], or :rdfterm[sosa:Actuator] and may move or remain fixed.

---

## Usage in SDL

In SDL, :rdfterm[sosa:Platform] is used to:

* Identify fixed or mobile hosts for sensor systems
* Organize deployments based on spatial, organizational, or project structure
* Associate systems and observations with their hosting infrastructure
* Enable reusability of components across deployments

Platforms often appear in :rdfterm[ssn:Deployment] via the :rdfterm[ssn:deployedOnPlatform] property.

---

## Properties

| Property               | Description                                              | Optional |
| ---------------------- | -------------------------------------------------------- | -------- |
| :rdfterm[dcterms:identifier]   | Unique identifier for the platform                       | Yes      |
| :rdfterm[dcterms:title]        | Human-readable name or label                             | Yes      |
| :rdfterm[dcterms:description]  | Textual description of the platform                      | Yes      |
| :rdfterm[dcterms:spatial]      | Spatial coverage or geometry of the platform             | Yes      |
| :rdfterm[ssn:hasDeployment]    | Inverse property linking to associated :rdfterm[ssn:Deployment]  | Yes      |
| :rdfterm[sosa:hosts]           | Links platform to hosted sensors or systems              | Yes      |
| :rdfterm[prov:wasAttributedTo] | Agent responsible for managing or deploying the platform | Yes      |

---

## Composition

A platform may host one or more systems, each of which can be deployed separately:

```turtle
ex:rigPlatform1 a sosa:Platform ;
  dcterms:title "Field Station Rig A" ;
  sosa:hosts ex:li8250_system , ex:met_station .
```

---

## Example — Platform and Deployment

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

## Related Classes

* :rdfterm[ssn:Deployment] — deployment context of systems on platforms
* :rdfterm[ssn:System] — sensor or processing unit hosted by the platform
* :rdfterm[prov:Agent] — responsible organization or maintainer

---

## See Also

* [:rdfterm[sosa:Platform]](https://www.w3.org/TR/vocab-ssn/#SOSAPlatform)
* [:rdfterm[ssn:Deployment]](https://www.w3.org/TR/vocab-ssn/#SOSADeployment)
* [:rdfterm[sosa:hosts]](https://www.w3.org/TR/vocab-ssn/#SOSAhosts)

> Platforms in SDL provide structure for system deployment, enabling repeatability, reuse, and accurate interpretation of environmental or laboratory observations.
