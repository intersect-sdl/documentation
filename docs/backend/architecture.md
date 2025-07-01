---
uuid: 7cf5b663-6761-444f-873c-33f89554634c
title: 🧠 SDL Backend Architecture
author: SDL Team
published: true
---

## Overview

The Scientific Data Layer (SDL) backend implements a **Linked Data Platform (LDP)** that supports modular, scalable scientific data management across a system-of-systems (SoS) architecture. The platform is built on microservices that interoperate through well-defined RDF-based interfaces, allowing distributed deployment, semantic integration, and extensibility.

The architecture is designed with **three layers of abstraction**:

* **Layer 1: Storage Abstractions**
* **Layer 2: Core Services**
* **Layer 3: Domain Services**

Each layer encapsulates distinct responsibilities, promoting separation of concerns and clean layering for service orchestration and reuse.

---

## 🔗 Linked Data Platform (LDP) in SDL

The SDL adopts the [W3C Linked Data Platform](https://www.w3.org/TR/ldp/) standard, enabling resources to be accessed and managed using HTTP operations with RDF content negotiation. Key features include:

* Support for **LDP Containers** (Basic, Direct, and Indirect)
* Full RDF serialization support (Turtle, JSON-LD, RDF/XML)
* Content negotiation and pagination
* Membership triple management
* LDP preference headers (Prefer/Include/Omit)

### Benefits of LDP for SDL

* Interoperability with existing semantic web infrastructure
* Seamless integration of new data sources and services
* Federated architecture via HTTP-based interfaces
* Modular handling of RDF-based resources with type-specific routing

---

## 🔲 Layer 1: Storage Abstractions

This layer provides unified access to diverse storage backends:

* **Triple Stores**: e.g., Blazegraph, GraphDB (for RDF graphs)
* **Object Storage**: e.g., MinIO, S3 (for binary files and media)
* **File System**: Local or network-based hierarchical file access
* **Databases**: SQL (e.g., PostgreSQL) and NoSQL (e.g., MongoDB)

### Key Components

* `StorageService`: Main service interfacing with storage adapters
* `StorageAdapters`: Plug-ins for specific storage technologies
* `GraphStore`, `FileStore`, `ObjectStore`, `DocumentStore`: Abstractions over common types of data

---

## ⚙️ Layer 2: Core Services

These services interact directly with Layer 1 abstractions to offer higher-order functionality.

### Registry Service

* Manages identity and metadata of resources
* Assigns persistent URIs
* Interfaces with `GraphStore` to maintain system metadata

### Data Transfer Service

* Coordinates the movement of raw and processed data
* Supports streaming, batch uploads, and ingestion workflows
* Interfaces with `ObjectStore` and `FileStore`

These services form the operational and orchestration backbone of the SDL.

---

## 🧩 Layer 3: Domain Services

These services build on core services to provide domain-specific, user-facing functionality. They aggregate, manage, and expose scientific content in semantically meaningful ways.

### Catalog Service

* Exposes `dcat:Catalog`, `dcat:Dataset`, and `dcat:Distribution`
* Organizes datasets into hierarchical, discoverable catalogs
* Uses LDP containers for dataset navigation

### Repository Service

* Manages experimental and observational data repositories
* Supports SSN/SOSA ontologies and scientific workflows

### Workspace Service

* Implements collaborative workspaces akin to Notion
* Manages `doco:Document`, `spar:Project`, and `sdlo:Page` resources
* Utilizes ProseMirror and DoCO alignment for editable block content

---

## 🔄 Inter-Service Relationships

```plaintext
+----------------------+     +---------------------+
|   Workspace Service  | <-- |   Catalog Service   |
+----------------------+     +---------------------+
             |                         |
             v                         v
     +------------------+     +---------------------+
     | Repository Service| <-- | Registry + Transfer |
     +------------------+     +---------------------+
                         \        /
                         Layer 2
                           |
                     +------------+
                     |  Storage   |
                     +------------+
```

Layer 3 services depend on the Registry and Data Transfer services for URI management, metadata registration, and data ingestion. These, in turn, use the Storage layer for physical storage and retrieval.

---

## ✨ Advantages of the Architecture

* **Modularity**: Each service is independently deployable
* **Extensibility**: New services can be added at any layer
* **Scalability**: Storage and compute can scale separately
* **Interoperability**: LDP and RDF interfaces ensure compatibility with semantic web tools
* **Reusability**: Abstractions can be reused across domains and workflows

---

## 🔮 Future Extensions

* Provenance tracking using `prov:Activity`, `prov:Agent`, and `prov:Entity`
* Workflow execution using `pwo:Workflow`, `p-plan:Step`
* Real-time streaming via MQTT or AMPQ integrations
* Event-based automation with workflow triggers

---

This structured backend enables SDL to manage scientific data in a FAIR, modular, and linked fashion, adaptable to complex research ecosystems and evolving data governance needs.
