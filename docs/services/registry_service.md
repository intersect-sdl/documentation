---
uuid: 0b1af7e2-86fb-4872-91ef-4073a97fcde3
title: Registry Service Overview
published: true
authors:
    - Swen Boehm
    - SDL Team
draft: true
---

The **Registry Service** is a core component of the SDL ecosystem responsible for managing unique identities, metadata schemas, and resource relationships.

It supports:

* Registration of RDF resources and entities within and across SDL deployments
* Generation of globally unique and resolvable IRIs for linked data
* Management of type declarations (`rdf:type`) and shapes for class-based validation
* Resolution and introspection of resource metadata

## Core Responsibilities

### Resource Registration

* Track and issue IRIs for scientific entities (samples, datasets, procedures, etc.)
* Maintain version history and provenance of registered resources

### Schema and Type Management

* Map each registered resource to one or more RDF types
* Associate SHACL or OWL schemas for validation and inferencing

### Identifier Strategies

* Human-readable local names
* UUID-backed IRIs for long-term persistence
* Support for CURIE-based lookup and resolution

## Example Registrations

### 1. Sample Instance

```ttl
acl:Sample789 a acl:SolidSample ;
  dct:title "Annealed perovskite powder" ;
  dct:identifier "urn:uuid:5538e2e8-2e57-45a2-8083-2bc3f4bba147" ;
  prov:wasGeneratedBy acl:SynthesisRun456 .
```

### 2. Shape Reference for Validation

```ttl
acl:SolidSampleShape a sh:NodeShape ;
  sh:targetClass acl:SolidSample ;
  sh:property [
    sh:path dct:title ;
    sh:datatype xsd:string ;
    sh:minCount 1
  ] .
```

## Interoperability

* The Registry supports cross-deployment federation of resources
* It is tightly coupled with the **Catalog**, **Repository**, and **Storage** services
* Registered resources are discoverable via SPARQL and RESTful linked data endpoints
