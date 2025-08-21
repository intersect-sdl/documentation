---
id: 61fe2df0-c558-41ad-94a7-6dff479c0aa2
title: Data Transport Service Overview
published: true
authors:
    - Swen Boehm
    - SDL Team
draft: true
---

The **Data Transport Service** coordinates the secure and efficient movement of data across systems in the SDL ecosystem.

It supports:

* Transfer of data between instruments, storage services, and analytical services
* Handling of both real-time and batch transport modalities
* Integration with streaming protocols (e.g., MQTT, Kafka, NATS) and standard transfer protocols (e.g., HTTPS, SFTP, Rsync)
* Support for provenance-aware data staging and caching strategies

## Scope and Capabilities

The Data Transport Service is responsible for moving data between different stores:

* Between subsystems within a platform
* Across different SDL deployments
* To/from external services if explicitly authorized

### Data Input Handling

* **External inputs** are treated as raw data unless coming from a trusted SDL deployment.
* **Inter-deployment inputs** are assumed to be cataloged and presented in a known format (e.g., RDF, HDF5, NetCDF).

### Data Output Access

* Outputs are generally only available if the dataset is cataloged.
* Trusted SDL deployments may exchange raw and derived datasets, including direct repository and store access.

## Event Messaging via INTERSECT

SDL systems can share events using the **INTERSECT messaging protocol**. Events can describe:

* File transfers initiated or completed
* Activities started, paused, completed, or failed
* New data becoming available in a repository

These events are modeled using `prov:Activity` and related properties for provenance tracking.

### Example: Activity-Based Messaging

```ttl
ex:transfer123 a prov:Activity ;
  prov:used ex:sourceFile ;
  prov:generated ex:copiedFile ;
  prov:wasAssociatedWith ex:transportService ;
  prov:startedAtTime "2025-07-15T10:03:00Z"^^xsd:dateTime ;
  prov:endedAtTime "2025-07-15T10:03:15Z"^^xsd:dateTime .

ex:DataTransferEvent a sosa:Observation ;
  sosa:hasFeatureOfInterest ex:transfer123 ;
  sosa:resultTime "2025-07-15T10:03:16Z"^^xsd:dateTime ;
  sosa:hasResult [ rdf:value "success" ] .
```

## Example Data Transport Use Cases

### 1. Transferring Data from Instrument to MinIO

* Source: `/mnt/furnace/output/temp_log.csv`
* Target: `https://minio.example.org/bucket/furnace1/temp_log.csv`
* Method: `rsync` or local agent

### 2. Subscribing to Gas Sensor Stream

```ttl
acl:gasSensorStream a dcat:DataService ;
  dct:title "Gas Sensor Telemetry MQTT" ;
  dcat:endpointURL <mqtt://broker.example.org/topic/sensors/gas> ;
  dcat:servesDataset acl:gasSensorDataset .
```

### 3. Syncing Cataloged Dataset Between Deployments

```ttl
acl:remoteACL a dcat:DataService ;
  dct:title "ACL Catalog Service at Site B" ;
  dcat:endpointURL <https://siteb.example.org/sdl/catalog/> ;
  dcat:servesDataset acl:xrdDataset .
```

## Future Topics

* Secure token-based access control for external endpoints
* Mapping `prov:Activity` to lifecycle state transitions
* Federation of transport agents between SDL nodes
