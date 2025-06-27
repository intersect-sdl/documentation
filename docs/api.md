---
uuid: 66591140-6658-44cb-9e85-7db52399870d
title: "API Reference"
description: "Endpoints and usage examples for the Scientific Data Layer (SDL) APIs."
author: "SDL Team"
date: "2025-06-25"
published: true
---

> **Disclaimer:** Many of the features described in this documentation are still in planning or under development. Some endpoints may not be available in your current instance.

This guide provides an overview of the RESTful APIs available in the Scientific Data Layer (SDL). Each microservice exposes a set of endpoints, most of which use JSON-LD and follow Linked Data Platform (LDP) and REST best practices.

All endpoints support standard HTTP verbs and content negotiation (`application/ld+json`, `text/turtle`, `application/json`).

Authentication is typically via OAuth2 Bearer tokens.

---

## Base Structure

All endpoints follow the base pattern:

```
https://<host>/<service>/<resource-path>
```

Example:
```
GET https://sdl.example.org/catalog/datasets
```

---

## Common Headers

```http
Accept: application/ld+json
Authorization: Bearer <token>
Content-Type: application/ld+json
```

---

## Catalog Service

### `GET /catalog/datasets`
List all datasets.

### `POST /catalog/datasets`
Create a new dataset. Body must include `@type: dcat:Dataset`.

### `GET /catalog/datasets/{id}`
Retrieve a specific dataset.

### `PUT /catalog/datasets/{id}`
Replace the dataset metadata.

### `PATCH /catalog/datasets/{id}`
Update part of the dataset.

---

## Registry Service

### `GET /registry/platforms`
List all registered platforms.

### `GET /registry/platforms/{id}`
Get details about a specific platform.

### `POST /registry/platforms`
Register a new platform. Body should include `ssn:Platform` and related system links.

---

## Repository Service

### `GET /repository/resources`
List all RDF resources.

### `POST /repository/resources`
Create a new RDF resource. Supports LDP container creation.

### `GET /repository/resources/{id}`
Retrieve resource by URI or slug.

### `PUT /repository/resources/{id}`
Replace full RDF graph.

### `PATCH /repository/resources/{id}`
Partial RDF update.

### `DELETE /repository/resources/{id}`
Delete a resource.

---

## Workspace Service

### `GET /workspaces`
List all available workspaces.

### `GET /workspaces/{id}`
Get details of a specific workspace.

### `POST /workspaces`
Create a new workspace.

### `PATCH /workspaces/{id}`
Update workspace settings or metadata.

---

## Storage Service

### `GET /storage/stores`
List available stores.

### `GET /storage/stores/{id}`
Describe store configuration (e.g., graph, backend type).

### `POST /storage/stores`
Register a new store.

---

## Data Transfer Service

### `POST /transfer/upload`
Upload data to an object store. Includes metadata in body.

### `POST /transfer/download`
Trigger data export and retrieve a download URL.

---

## SPARQL Endpoint (Repository)

### `POST /repository/query`
Execute SPARQL SELECT or CONSTRUCT queries.

### `POST /repository/update`
Execute SPARQL UPDATE.

---

## Notes
- Most resources use IRIs as IDs; slugs or UUIDs may also be supported.
- Errors follow standard HTTP response codes and include semantic error messages where possible.
- All POST and PUT operations should provide valid JSON-LD or Turtle.

---

This API is designed for flexibility and semantic richness. Future extensions may include GraphQL overlays and streaming data subscriptions.
