---
uuid: 7a0df2a9-e108-4ec8-bc14-11cd6f25edcf
title: Entity Detail — ssn:Deployment
author: SDL Team
tags:
  - SSN
  - RDF Class
  - Deployment
  - Entity Detail
version: 1.0
published: true
---

The `ssn:Deployment` class models the situation in which a system or sensor is deployed in a particular configuration at a particular location and time. In SDL, `ssn:Deployment` is used to track how instruments, rigs, or sensors are arranged in the field or lab, and to describe their operational context.

---

## 🔎 Definition

**URI**: `http://www.w3.org/ns/ssn/Deployment`

> A `ssn:Deployment` is a situation in which a system (sensor, actuator, sampler) is deployed for a particular purpose in a given context.

---

## 📐 Usage in SDL

In SDL, `ssn:Deployment` is used to:

* Represent sensor rigs, stations, or platforms in the field
* Track the arrangement and use of system components
* Link physical systems with sampling and observation contexts
* Support reuse of systems across multiple deployments

Each deployment may describe:

* The deployed system (`ssn:deployedSystem`)
* The target or purpose of deployment (`ssn:forProperty`, `prov:hadPrimarySource`)
* Associated agents, locations, and time windows

---

## 🔄 Properties

| Property                 | Description                                          | Optional |
| ------------------------ | ---------------------------------------------------- | -------- |
| `ssn:deployedSystem`     | The `ssn:System` being deployed                      | No       |
| `ssn:deployedOnPlatform` | Platform or host on which the system is deployed     | Yes      |
| `dcterms:location`       | Geospatial or descriptive location of the deployment | Yes      |
| `prov:startedAtTime`     | When the deployment began                            | Yes      |
| `prov:endedAtTime`       | When the deployment ended                            | Yes      |
| `prov:wasAssociatedWith` | The agent responsible for the deployment             | Yes      |
| `dcterms:identifier`     | Deployment identifier                                | Yes      |
| `dcterms:title`          | Human-readable title                                 | Yes      |
| `dcterms:description`    | Description of the deployment                        | Yes      |

---

## 🧠 Composition

A deployment defines a relationship between:

* One or more `ssn:System` instances
* A time-bounded activity context
* A platform or location where deployment occurred

```turtle
ex:deploymentA a ssn:Deployment ;
  ssn:deployedSystem ex:rig8250 ;
  dcterms:title "Deployment of CO2 Rig 8250 at Plot A" ;
  dcterms:location ex:plotA ;
  prov:startedAtTime "2024-05-01T08:00:00Z"^^xsd:dateTime .
```

---

## 🧪 Example — Multiple Deployments

```turtle
ex:deployment1 a ssn:Deployment ;
  ssn:deployedSystem ex:li8250_system ;
  dcterms:title "First Spring Deployment at Field Site X" ;
  dcterms:location ex:fieldSiteX ;
  prov:startedAtTime "2024-03-15T09:00:00Z"^^xsd:dateTime ;
  prov:endedAtTime "2024-04-15T17:00:00Z"^^xsd:dateTime .

ex:deployment2 a ssn:Deployment ;
  ssn:deployedSystem ex:li8250_system ;
  dcterms:title "Summer Deployment at Field Site Y" ;
  dcterms:location ex:fieldSiteY ;
  prov:startedAtTime "2024-06-01T08:30:00Z"^^xsd:dateTime .
```

---

## 🗂 Related Classes

* `ssn:System` — the deployed sensor or system
* `prov:Activity` — temporal framing and process tracking
* `dcat:Resource` — deployments may be cataloged as resources

---

## 📘 See Also

* [`ssn:Deployment`](https://www.w3.org/TR/vocab-ssn/#SOSADeployment)
* [`ssn:System`](https://www.w3.org/TR/vocab-ssn/#System)
* [`sosa:Platform`](https://www.w3.org/TR/vocab-ssn/#SOSAPlatform)

> `ssn:Deployment` enables SDL to track when and where systems are used, how long they operate, and in what configuration — supporting reuse, reproducibility, and field auditability.
