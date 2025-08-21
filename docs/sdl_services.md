---
id: a3cba938-63a2-4fa7-82ce-6a1fdfc1076a
title: "Service Architecture Overview"
published: true
authors:
    - Swen Boehm
    - SDL Team
draft: true
---

The **Scientific Data Layer (SDL)** provides an extensible microservice architecture for managing FAIR and provenance-rich scientific data. The SDL service ecosystem defines a modular set of semantic services, each with a well-defined purpose and interoperable data model.

This page provides an overview of the primary SDL services and how they work together.

## Core Services

### 1. **Registry Service**

Manages unique identifiers, RDF resource types, and validation schemas across deployments.

* Issues URIs for samples, datasets, activities, etc.
* Registers SHACL shapes and OWL ontologies
* Supports introspection, resolution, and typing

➡️ See: [Registry Service](./services/registry_service)

### 2. **Repository Service**

Provides durable, version-controlled RDF storage.

* Organizes resources in named graphs
* Tracks changes via `prov:Activity`
* Supports LDP-style read/write and graph queries

➡️ See: [Repository Service](./services/repository_service)

### 3. **Catalog Service**

Surfaces discoverable datasets and distributions using DCAT v3.

* Organizes datasets by platform, workspace, or theme
* Registers `dcat:Dataset`, `dcat:Distribution`, `dcat:DataService`
* Enables federation and SPARQL discovery

➡️ See: [Catalog Service](./services/catalog_service)

### 4. **Storage Service**

Manages physical data storage endpoints.

* Maps datasets to object, graph, stream, and tabular backends
* Supports `dcat:DataService` for access interfaces
* Includes MinIO, Blazegraph, PostgreSQL, MQTT, etc.

➡️ See: [Storage Service](./services/storage_service)

### 5. **Data Transport Service**

Coordinates secure and provenance-aware data movement.

* Transfers between platforms and services
* Supports raw and cataloged data
* Uses `prov:Activity` and INTERSECT event modeling

➡️ See: [Data Transport Service](./services/data_transport_service)

### 6. **Workspace Service**

Encapsulates resources in collaborative semantic contexts.

* Groups resources by project, experiment, or user
* Supports scoped namespaces and access control
* Used for notebook editing, semantic UI, and publishing

➡️ See: [Workspace Service](./services/workspace_service)

## Interoperability and Semantics

All services communicate using RDF, and are linked via shared vocabularies such as:

* `dcat`, `dcterms`, `prov`, `sosa/ssn`, `shacl`, and SDL-specific namespaces

Each service exposes HTTP or messaging APIs compatible with Linked Data Platform patterns, enabling decentralized, federated operation.

Let me know if you'd like a diagram or JSON-LD context that maps out the full architecture.
