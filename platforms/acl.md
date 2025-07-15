---
uuid: e2dab416-9f43-41d8-8cf3-d2214e0ba83c
title: "ACL: Automated Chemistry Lab"
published: true
---

The **ACL platform** focuses on automated solid-state chemistry, integrating synthesis, processing, and analysis.

## Overview

### Key Features
- High-throughput material synthesis workflows.
- Robotic control of furnaces, mills, and analytical equipment.
- Sample and data tracking integrated with LIMS.

### Data & Provenance
- All experiments are described using `ssn:Platform` and :rdfterm[ssn:Deployment].
- Observations (e.g., XRD, SEM) are linked to inputs and processing steps.
- Each dataset is registered in a :rdfterm[dcat:Catalog] with provenance tracked using :rdfterm[prov:Activity].

### FAIR Compliance
- Each sample and dataset has a unique, persistent URI.
- Metadata uses standard vocabularies (DCAT, PROV-O, SSN).
- Data is linked to its generating systems and workflows.
