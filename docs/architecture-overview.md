---
title: Architecture Overview
---

## Table of Contents

- [Introduction](#introduction)
- [Service Layers](#service-layers)
- [Data Flow](#data-flow)
- [Ontologies](#ontologies)

## Introduction

The Scientific Data Layer (SDL) uses a **system-of-systems architecture** based on microservices.
It provides linked data capabilities for managing scientific data using standards like SSN, DCAT, and PROV.

## Service Layers

The architecture is organized into **three layers**:

```mermaid
flowchart TD
    subgraph L1[Layer 1: Storage]
        A[Blazegraph RDF Store]
        B[MinIO Object Storage]
        C[SQL / NoSQL Databases]
    end

    subgraph L2[Layer 2: Core Services]
        D[Registry Service]
        E[Data Transport Service]
    end

    subgraph L3[Layer 3: Applications]
        F[Catalog Service]
        G[Repository Service]
        H[Workspace Service]
    end

    A <--> D
    B <--> D
    C <--> D
    D --> E
    E --> F
    E --> G
    E --> H
```

## Data Flow

```mermaid
sequenceDiagram
    participant Sensor
    participant Registry
    participant Storage
    participant Catalog

    Sensor->>Registry: Register new observation
    Registry->>Storage: Store RDF and data files
    Catalog->>Storage: Query and retrieve metadata
    Catalog->>Registry: Cross-reference datasets
```
