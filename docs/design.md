---
title: SDL design for the ACL
published: false
---
:::note{title="Read me"}
This is a note using the updated component.
:::

## Data Storage

Data storage in filesystem, minio, sql(ite) and mongodb.
Access should be provided 

## Data Repository

Expose assets and link them to the underlying storage and metadata.

For the ACL, multiple repositories are required:

- XRD data repository
- Synthesis process data repository
- electro chemical analysis data repository
- metadata repository

Data repositories are backed by minio in this project.

## Data Catalog

Expose Datasets (potentially composed from multiple assets).

The Data Catalog will be implemented on top of apache jena, using the w3c DCAT ontology.

<!--

We need to check with Craig on this, at the moment I do not see a need for an implementation here.

-->