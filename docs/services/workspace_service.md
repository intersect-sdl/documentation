---
uuid: 4a34a122-7d3e-41cb-91db-4e7e1dc4537e
title: Workspace Service Overview
published: true
authors:
    - Swen Boehm
    - SDL Team
draft: true
---

The **Workspace Service** enables collaborative, contextual organization of scientific content and resources in the SDL ecosystem. It provides a semantic and user-facing structure for managing collections of linked data.

It supports:

* Creation and management of workspaces scoped by users, projects, platforms, or roles
* Linking of resources from the Registry, Repository, and Catalog services
* Namespacing and versioning of RDF content within a workspace
* Integration with frontend applications for visual interaction and editing

## Core Features

### Workspaces

A workspace is a container for semantically linked resources such as:

* Experiments, workflows, samples
* Documents and procedures
* Datasets and catalogs

Each workspace has a unique URI and may be bound to an LDP container or graph root.

### Membership and Access

* Supports individual and group membership
* Integrated with RBAC (role-based access control)
* Resources may be public, shared, or private

### Namespace and Identity

* Workspaces define default namespaces for resource creation
* URI minting strategies align with registry and repository conventions

## Example Workspace Definition

```ttl
ex:aclWorkspace a sdl:Workspace ;
  dct:title "ACL Sample Workflow" ;
  dct:creator <https://acl-sdl.ornl.gov/users/swen> ;
  dct:created "2025-07-15"^^xsd:date ;
  dcat:dataset acl:xrdDataset, acl:tgaDataset ;
  dcat:service acl:xrdRawService ;
  sdl:graphRoot <https://acl-sdl.ornl.gov/workspaces/acl/> .
```

## Usage Patterns

* Semantic document editors like SDL Notebooks or Narrative Viewers
* Team-based annotation of RDF resources
* Experimental design and traceability across dataset lifecycles
