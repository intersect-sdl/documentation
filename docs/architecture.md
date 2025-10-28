---
id: 42acb7b9-8e81-42ac-a9c1-ed092de04a8e
title: Architecture Overview
description: "An overview of the Scientific Data Layer (SDL) architecture, including frontend and backend components."
# author: "SDL Team"
# date: "2025-06-25"
# published: true
# ctime: 2023-02-22 11:12:40 -05:00
# mtime: 2023-02-22 11:19:46 -05:00
# vtime: 2023-02-22 11:20:05 -05:00
---

> **Disclaimer:** Many of the features described in this guide are still in planning or active development. Some functionality may not yet be available in your instance.

The Scientific Data Layer (SDL) is a modular and extensible platform designed to manage scientific data using semantic web principles. It implements a system-of-systems architecture composed of microservices and semantic UI components. It provides linked data capabilities for managing scientific data using standards like SSN, DCAT, and PROV.

This guide introduces the SDL architecture, highlighting its main frontend and backend components and their interactions.

## Architectural Principles

SDL is built upon the following design principles:

- **Linked Data Platform (LDP)**: Resources are addressable and follow LDP standards.
- **Microservices**: Each core function is encapsulated as an independent Python-based service.
- **Semantic Interoperability**: Uses RDF, JSON-LD, and standard ontologies (e.g., DCAT, SSN, DoCO).

→ [See the Overview of Namespaces Used in SDL](/docs/ontologies)

- **Polyglot Storage**: Supports RDF triple stores, object storage, SQL, and NoSQL.
- **Extensibility**: Modular components and shared libraries for reusability.

  Semantic classes in SDL are composed from multiple ontologies and aligned to platform-specific requirements using RDF typing and graph separation. This composition enables semantic forms, content blocks, and workflows to be inferred and rendered dynamically.

→ [See the Overview of Semantic Classes Used in SDL](/docs/entity_overview)

## System Diagram

![SDL Architecture Diagram](/SDLArchitecture.svg)

## Frontend (SvelteKit UI)

The frontend is a modern, reactive application built with **SvelteKit**, structured as:

- A **component library** for reusable, semantically-aware UI elements (e.g., inputs, RDF viewers, content blocks)
- A **resource representation library** for mapping RDF resources to JavaScript/TypeScript objects with context-aware utilities
- A **workspace-driven application shell** inspired by Notion, enabling semantic content authoring and navigation

Key features:

- Semantic content editing
- Dynamic rendering by `rdfs:type`
- RDF-aware forms and views
- Component-driven architecture (Storybook supported)
- SPARQL-based dashboards (planned)

It interacts with backend services through a JSON-LD-aware API gateway.

## Backend Services

Each backend service is implemented in Python and communicates over REST, with plans to support GraphQL/SPARQL endpoints.

### Service Layers

The architecture is organized into **three layers**:

![SDL Service Layer Diagram](/SDLServiceTiers.svg)


#### Catalog Service

- Manages DCAT catalogs, datasets, distributions
- Supports search, indexing, and metadata publishing

#### Registry Service

- Manages identities of platforms, systems, sensors
- Supports SSN/PROV alignment and platform hierarchy

#### Repository Service

- Manages versioned RDF content
- Implements LDP containers and SPARQL endpoints

#### Workspace Service

- Handles user-defined spaces for organizing content
- Manages RBAC, dashboards, templates

#### Storage Service

- Maps logical stores to physical backends
- Coordinates access to Blazegraph, MinIO, Postgres, etc.

#### Data Transfer Service

- Manages asynchronous and bulk data movement
- Tracks provenance of imports/exports

### Data Flow

![Data Flow Diagram](/architecture_sequence_diag.svg)

## Shared Infrastructure

- **Blazegraph**: RDF triple store for SPARQL and semantic queries
- **MinIO**: Object storage for raw files and binary content
- **PostgreSQL**: For structured metadata and auxiliary indexing
- **MongoDB**: NoSQL document store for unstructured metadata and lightweight assets
- **NGINX**: Reverse proxy and static file serving, load balancing
- **AMP/MQTT**: Messaging protocol layer for real-time telemetry and data synchronization

## See Also

- [Backend Architecture](architecture/backend_architecture)
- [Ontology Integration](architecture/ontology_integration)
- [Platform Definition](architecture/platforms)
- [SDL Services](architecture/sdl_services)

---

SDL provides a flexible foundation for semantic scientific infrastructures. Its modular design supports both experimental and production-scale deployments.
