---
id: 3b6e0b3b-bdf8-47d9-9d2d-846ae02e45e3
title: Entity Overview
author: SDL Team
tags:
  - RDF
  - Entity Model
  - Classes
  - Composition
  - Ontologies
version: 1.0
published: true
---

This document provides a high-level overview of the different **:abbr[RDF] entity types** used in the SDL and how they relate through composition, ontology alignment, and Linked Data Platform (LDP) containers.

The SDL does not use a rigid class hierarchy.
Instead, it enables **compositional modeling** by assigning multiple :rdfterm[rdf:type] values to describe the role and structure of each resource.

## Core Concepts

### rdf\:type

Each entity in :abbr[SDL] can declare multiple :abbr[RDF] types to reflect its functional role in the system.

### LDP Containers

Entities are managed within :abbr[LDP] containers that determine how they are listed, created, and related to one another (Basic, Direct, Indirect).

## Composition by :rdfterm[rdf:type]

SDL Entities often combine types from different vocabularies to model their structure and behavior. For example:

### Example: A file representing a sensor result

```turtle
ex:observation1
  a sosa:Observation , prov:Entity , dcat:Distribution ;
  dct:title "Soil Gas Measurement" ;
  sosa:madeBySensor ex:li8250 ;
  dcat:downloadURL <https://example.org/data/soil.csv> .
```

This shows that:

* The entity is a measurement (:rdfterm[sosa:Observation])
* It is data that can be traced in provenance (:rdfterm[prov:Entity])
* It is downloadable (:rdfterm[dcat:Distribution])

## Relationships

Entities in SDL are linked via named properties from the source ontologies:

* :rdfterm[dcat:dataset] links :rdfterm[dcat:Catalog] → :rdfterm[dcat:Dataset]
* :rdfterm[dcat:distribution] links :rdfterm[dcat:Dataset] → :rdfterm[dcat:Distribution]
* :rdfterm[prov:wasGeneratedBy] links :rdfterm[prov:Entity] → :rdfterm[prov:Activity]
* :rdfterm[sosa:hasResult] or :rdfterm[sosa:hasSimpleResult] asociates observations with values
* :rdfterm[ssn:deployedSystem] links :rdfterm[ssn:Deployment] → :rdfterm[ssn:System]

## RDF Classes in SDL

| RDF Class                        | Namespace | Description                                                                | Documentation                               |
| -------------------------------- | --------- | -------------------------------------------------------------------------- | ------------------------------------------- |
| :rdfterm[dcat:Catalog]           | DCAT      | A container resource that holds datasets                                   | [dcat\:Catalog](entities/dcat_catalog)            |
| :rdfterm[dcat:Dataset]           | DCAT      | A metadata-described scientific dataset                                    | [dcat\:Dataset](entities/dcat_dataset)             |
| :rdfterm[dcat:Distribution]      | DCAT      | A downloadable representation of a dataset                                 | [dcat\:Distribution](entities/dcat_distribution)        |
| :rdfterm[dcat:Resource]          | DCAT      | A general-purpose superclass for all cataloged resources                   | [dcat\:Resource](entities/dcat_resource)            |
| :rdfterm[prov:Activity]          | PROV-O    | An event or process that generates or uses entities                        | [prov\:Activity](entities/prov_activity)            |
| :rdfterm[prov:Agent]             | PROV-O    | A person, system, or organization involved in a provenance chain           | [prov\:Agent](entities/prov_agent)               |
| :rdfterm[prov:Entity]            | PROV-O    | A piece of data or recordable object with provenance                       | [prov\:Entity](entities/prov_entitiy)             |
| :rdfterm[sosa:FeatureOfInterest] | SOSA      | The entity whose properties are being observed or measured                 | [sosa\:FeatureOfInterest](entities/sosa_feature_of_interest) |
| :rdfterm[sosa:ObservableProperty]| SOSA      | The property observed during an Observation                                | [sosa\:ObservableProperty](entities/sosa_observable_property)         |
| :rdfterm[sosa:Observation]       | SOSA      | An act of observing or measuring a property of a feature                   | [sosa\:Observation](entities/sosa_observation)         |
| :rdfterm[sosa:Platform]          | SOSA      | A structure or system that hosts sensors or samplers                       | [sosa\:Platform](entities/sosa_platform)            |
| :rdfterm[sosa:Result]            | SOSA      | The outcome or value produced by an observation, sampling, or actuation    | [sosa\:Result](entities/sosa_result)              |
| :rdfterm[sosa:Sample]            | SOSA      | A physical or digital subset of a feature of interest used in observations | [sosa\:Sample](entities/sosa_sample)              |
| :rdfterm[sosa:Sampling]          | SOSA      | The act of producing a sample from a feature of interest                   | [sosa\:Sampling](entities/sosa_sampling)            |
| :rdfterm[sosa:Sampler]           | SOSA      | A device, software, or agent capable of performing a sampling activity     | [sosa\:Sampler](entities/sosa_sampler)             |
| :rdfterm[ssn:Deployment]         | SSN       | The deployment of a system into a specific context or environment          | [ssn\:Deployment](entities/ssn_deployment)           |
| :rdfterm[ssn:Property]           | SSN       | An observable or measurable characteristic of a real-world feature         | [ssn\:Property](entities/ssn_property)             |
| :rdfterm[ssn:System]             | SSN       | A sensing or measurement system that performs observations                 | [ssn\:System](entities/ssn_system)               |

---

> This modular, compositional approach enables reuse across scientific domains, supporting complex workflows and data stages through shared semantics.
