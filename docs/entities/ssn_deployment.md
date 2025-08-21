---
id: 7a0df2a9-e108-4ec8-bc14-11cd6f25edcf
title: ssn:Deployment
author: SDL Team
tags:
  - SSN
  - RDF Class
  - Deployment
  - Entity Detail
version: 1.0
published: true
---

The :rdfterm[ssn:Deployment] class models the situation in which a system or sensor is deployed in a particular configuration at a particular location and time. In SDL, :rdfterm[ssn:Deployment] is used to track how instruments, rigs, or sensors are arranged in the field or lab, and to describe their operational context.

---

## Definition

**URI**: `http://www.w3.org/ns/ssn/Deployment`

> A :rdfterm[ssn:Deployment] is a situation in which a system (sensor, actuator, sampler) is deployed for a particular purpose in a given context.

---

## Usage in SDL

In SDL, :rdfterm[ssn:Deployment] is used to:

* Represent sensor rigs, stations, or platforms in the field
* Track the arrangement and use of system components
* Link physical systems with sampling and observation contexts
* Support reuse of systems across multiple deployments

Each deployment may describe:

* The deployed system (:rdfterm[ssn:deployedSystem])
* The target or purpose of deployment (`ssn:forProperty`, `prov:hadPrimarySource`)
* Associated agents, locations, and time windows

---

## Properties

| Property                 | Description                                          | Optional |
| ------------------------ | ---------------------------------------------------- | -------- |
| :rdfterm[ssn:deployedSystem]     | The :rdfterm[ssn:System] being deployed                      | No       |
| :rdfterm[ssn:deployedOnPlatform] | Platform or host on which the system is deployed     | Yes      |
| :rdfterm[dcterms:location]       | Geospatial or descriptive location of the deployment | Yes      |
| :rdfterm[prov:startedAtTime]     | When the deployment began                            | Yes      |
| :rdfterm[prov:endedAtTime]       | When the deployment ended                            | Yes      |
| :rdfterm[prov:wasAssociatedWith] | The agent responsible for the deployment             | Yes      |
| :rdfterm[dcterms:identifier]     | Deployment identifier                                | Yes      |
| :rdfterm[dcterms:title]          | Human-readable title                                 | Yes      |
| :rdfterm[dcterms:description]    | Description of the deployment                        | Yes      |

---

## Composition

A deployment defines a relationship between:

* One or more :rdfterm[ssn:System] instances
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

## Example — Multiple Deployments

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

## Related Classes

* :rdfterm[ssn:System] — the deployed sensor or system
* :rdfterm[prov:Activity] — temporal framing and process tracking
* :rdfterm[dcat:Resource] — deployments may be cataloged as resources

---

## See Also

* [:rdfterm[ssn:Deployment]](https://www.w3.org/TR/vocab-ssn/#SOSADeployment)
* [:rdfterm[ssn:System]](https://www.w3.org/TR/vocab-ssn/#System)
* [:rdfterm[sosa:Platform]](https://www.w3.org/TR/vocab-ssn/#SOSAPlatform)

> :rdfterm[ssn:Deployment] enables SDL to track when and where systems are used, how long they operate, and in what configuration — supporting reuse, reproducibility, and field auditability.
