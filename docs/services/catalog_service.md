---
uuid: 3cbbf292-5a2a-442a-a3ee-9713e3a51b89
title: Catalog Service Overview
published: true
authors:
    - Swen Boehm
    - SDL Team
draft: true
---

The **Catalog Service** provides discovery and organization of data resources in the SDL ecosystem. It builds upon W3C DCAT v3 to support semantic indexing of datasets, distributions, and associated metadata.

It supports:

* Hierarchical catalogs organized by workspace, platform, or user-defined scopes
* Registration of datasets, their formats, and access services
* Federated discovery across SDL deployments and external linked data sources
* Integration with repository and storage services to surface available data

## Core Concepts

### Catalog

A `dcat:Catalog` acts as a collection of datasets and services. Multiple catalogs may exist across workspaces or deployments.

### Dataset

A `dcat:Dataset` represents a logical data collection with associated metadata, provenance, and distributions.

### Distribution

A `dcat:Distribution` describes an accessible form of a dataset, including file formats, download URLs, and media types.

### DataService

A `dcat:DataService` describes an API or endpoint used to access distributions (e.g., S3, SPARQL, HTTPS, MQTT).

## Example Dataset Entry

```ttl
acl:xrdDataset a dcat:Dataset ;
  dct:title "XRD Diffraction Patterns - July 2025" ;
  dct:creator acl:ACLPlatform01 ;
  dct:issued "2025-07-15"^^xsd:date ;
  dcat:distribution acl:xrdDist123 ;
  dcat:theme <http://vocab.example.org/materials/crystallography> .
```

## Example Distribution

```ttl
acl:xrdDist123 a dcat:Distribution ;
  dcat:downloadURL <https://data.example.org/minio/acl-xrd-xye/scan789.xye> ;
  dct:format "text/plain" ;
  dcat:mediaType "application/x-xye" ;
  dcat:accessService acl:xrdRawService .
```

## Example Catalog Structure

```ttl
acl:aclCatalog a dcat:Catalog ;
  dct:title "ACL Platform Catalog" ;
  dcat:dataset acl:xrdDataset, acl:tgaDataset, acl:hplcDataset ;
  dcat:service acl:xrdRawService, acl:tgaStore, acl:hplcBroker .
```

## Federation and Discovery

* Catalogs can be queried via SPARQL or JSON-LD interfaces
* External catalogs can be linked via `dcat:catalog` or `dcat:dataset`
* Supports import of metadata from repositories or storage providers

Let me know when you’re ready to define custom themes, query templates, or catalog synchronization patterns.
