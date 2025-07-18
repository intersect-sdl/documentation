---
uuid: 295d3d07-e22c-4d43-9403-a778e46f90ad
title: Storage Service Overview
published: true
authors:
    - Swen Boehm
    - SDL Team
draft: true
---

The **Storage Service** is responsible for managing and describing the different types of data stores used throughout the SDL ecosystem. It provides:

- A catalog of available stores (`dcat:DataService`)
- Descriptions of the individual stores and their structure
- Mappings between stores and datasets (`dcat:Dataset`, `dcat:Distribution`)
- Support for various modalities including file-based, stream-based, graph, and tabular storage systems

## Store Types

SDL supports the following types of stores:

- **Object Storage** (e.g., MinIO, S3) for raw files and reports
- **Streaming Data Services** (e.g., MQTT, Kafka, NATS) for real-time data feeds
- **Graph Databases** (e.g., Blazegraph, GraphDB) for RDF/Linked Data
- **Tabular Databases** (e.g., PostgreSQL, SQLite) for structured datasets

## Examples

### File-Based Store: ACL XRD Files
```ttl
acl:xrdRawService a dcat:DataService ;
  dct:title "XRD XRDML Store" ;
  dcat:endpointURL <https://data.example.org/minio/acl-xrd-xrdml/> ;
  dcat:servesDataset acl:xrdDataset .
```

### Metadata Link to Distribution
```ttl
acl:xrdDist123 a dcat:Distribution ;
  dcat:downloadURL <https://data.example.org/minio/acl-xrd-xye/scan789.xye> ;
  dct:format "text/plain" ;
  dcat:mediaType "application/x-xye" ;
  dcat:accessService acl:xrdRawService .
```

### Streaming Data Service (MQTT or Kafka)
```ttl
acl:sensorStream a dcat:DataService ;
  dct:title "ACL MQTT Stream for Gas Sensors" ;
  dcat:endpointURL <mqtt://data.example.org/topic/acl/sensors/gas> ;
  dcat:servesDataset acl:gasSensorReadings .
```

### Graph Store: RDF Storage in Blazegraph
```ttl
acl:graphStore a dcat:DataService ;
  dct:title "ACL Knowledge Graph Store" ;
  dcat:endpointURL <https://data.example.org/blazegraph/namespace/acl> ;
  dcat:servesDataset acl:graphDataset .
```

### SQL-Based Data Store
```ttl
acl:chemistryDBService a dcat:DataService ;
  dct:title "ACL Chemistry PostgreSQL Service" ;
  dcat:endpointURL <https://data.example.org/sql/acl_chemistry> ;
  dcat:servesDataset acl:reactionDB .
```

## Related Resources

- `acl:xrdDataset`, `acl:graphDataset`, `acl:reactionDB` — datasets that use different store types
- Platform metadata: see `acl-platform.ttl`
- Procedure and observation linking in `acl-systems.ttl`

## RDF Term Reference Table

| Prefix   | Term                   | Full IRI                                               | Description                                   |
|----------|------------------------|---------------------------------------------------------|-----------------------------------------------|
| `dcat`   | `dcat:DataService`     | <http://www.w3.org/ns/dcat#DataService>                | Describes a service that provides data access |
| `dcat`   | `dcat:Distribution`    | <http://www.w3.org/ns/dcat#Distribution>               | Represents a concrete form of a dataset       |
| `dcat`   | `dcat:endpointURL`     | <http://www.w3.org/ns/dcat#endpointURL>                | URL where data can be accessed                |
| `dcat`   | `dcat:servesDataset`   | <http://www.w3.org/ns/dcat#servesDataset>              | Links service to dataset                      |
| `dct`    | `dct:title`            | <http://purl.org/dc/terms/title>                       | Human-readable title                          |
| `dct`    | `dct:description`      | <http://purl.org/dc/terms/description>                 | Human-readable description                    |
| `dct`    | `dct:format`           | <http://purl.org/dc/terms/format>                      | Format of a file                              |
| `dcat`   | `dcat:mediaType`       | <http://www.w3.org/ns/dcat#mediaType>                  | Media type (e.g., MIME) of a distribution     |
| `dcat`   | `dcat:accessService`   | <http://www.w3.org/ns/dcat#accessService>              | Connects a distribution to its access service |
