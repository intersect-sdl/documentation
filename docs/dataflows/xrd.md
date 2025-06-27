---
uuid: c57edecd-7da9-47b6-8f52-87d601bd78a8
title: Data flow for XRD Data
published: false
---

## Dataflow for XRD data

1. XRD File gets written into directory
1. Monitoring Agent picks new file and uploads to XRD repository
1. Storage Service emmits event for new XRD File
1. Repository Service starts new ingestion task