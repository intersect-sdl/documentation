---
uuid: e2dab416-9f43-41d8-8cf3-d2214e0ba83c
title: "ACL: Automated Chemistry Lab"
published: true
---

The **Automated Chemistry Lab (ACL)** is a robotic platform for solid-state synthesis and high-throughput chemical analysis.

It enables **end-to-end provenance capture** for experimental workflows, aligning with the **FAIR principles** and using semantic models based on SSN, DCAT, and PROV.

---

## Platform Architecture

### Synthesis System

The synthesis system automates solid-state reactions and includes:

- **Ball mill** for precursor mixing
- **Pellet press** for compaction
- **Furnace** with programmable temperature profiles
- **Robotic arm** for sample handling

Each system is represented as an `ssn:System` or subclass, deployed via `ssn:Deployment`.

### Analytical Systems

Post-synthesis, materials are analyzed using:

- **XRD (X-ray Diffraction)** – for phase identification
- **HPLC (High-Performance Liquid Chromatography)** – for impurity profiling
- **ICP-OES (Inductively Coupled Plasma Optical Emission Spectrometry)** – for elemental composition
- **FTIR** – for bonding/functional group detection

Each instrument is modeled as an `ssn:System` capable of generating one or more `sosa:Observation`s.

---

## Feature of Interest (FoI)

The core :rdfterm[sosa:FeatureOfInterest] in ACL workflows is:

- :rdfterm[acl:SolidSample] a synthesized material composed of one or more chemical compounds, characterized by physical and chemical properties.

Additional FoIs:
- :rdfterm[acl:PrecursorMixture]: the input blend of chemicals.
- :rdfterm[acl:SynthesisBatch]: logical grouping of samples from a single recipe.

---

## Observable Properties

Observable properties include:

| Property              | Description                                | Measured by     |
|-----------------------|--------------------------------------------|-----------------|
| :rdfterm[acl:phaseComposition] | Crystal phase (e.g., perovskite structure) | XRD             |
| `acl:purity`           | Chemical purity / impurity levels         | HPLC, ICP-OES   |
| `acl:bondingState`     | Functional groups or bonding patterns     | FTIR            |
| `acl:elementalRatio`   | Molar/weight ratio of elements            | ICP-OES         |

Each is modeled using `sosa:ObservableProperty`.

---

## Workflow: Synthesize & Analyze

### Step 1: Sample Synthesis

1. Mix precursors (`acl:PrecursorMixture`)
2. Compact into pellet
3. Fire in furnace
4. Result: `acl:SolidSample`

```ttl
acl:run123 a prov:Activity ;
    prov:used acl:precursorMixture456 ;
    prov:generated acl:sample789 ;
    prov:wasAssociatedWith acl:automatedFurnace ;
    prov:startedAtTime "2025-07-10T09:00:00Z"^^xsd:dateTime .
```

### Step 2: Sample Analysis

1. Mount sample on XRD
1. Capture diffraction pattern
1. Derive acl:phaseComposition

```ttl
acl:xrdObs123 a sosa:Observation ;
    sosa:hasFeatureOfInterest acl:sample789 ;
    sosa:observedProperty acl:phaseComposition ;
    sosa:madeBySensor acl:XRDSystem ;
    sosa:resultTime "2025-07-10T12:15:00Z"^^xsd:dateTime ;
    sosa:hasResult [
        rdf:value "Orthorhombic perovskite" ;
        qudt:unit qudt:Dimensionless
    ] .
```

Other measurements (HPLC, ICP, FTIR) follow a similar pattern.

## Input & Output Definitions

| Stage    | Input                |  Output              |
| -------- | -------------------- | -------------------- |
|Synthesis | acl:PrecursorMixture | acl:SolidSample      |
|XRD       | acl:SolidSample      | acl:phaseComposition |
|HPLC      | acl:SolidSample      | acl:purity           |
|ICP-OES   | acl:SolidSample      | acl:elementalRatio   |
|FTIR      | acl:SolidSample      | acl:bondingState     |

All inputs and outputs are semantically linked via prov:used and prov:generated.

## Data Stores and File Mapping

Each file generated or used in ACL workflows is stored in a structured **data store** associated with a specific purpose and media type. These stores are implemented as **MinIO buckets**, referenced in metadata via `dcat:DataService` and `dcat:Distribution`.

### Synthesis Input

| File Type       | Description                           | Store Bucket         | Usage            |
|------------------|---------------------------------------|----------------------|------------------|
| `.json` / `.yml` | Input recipe for synthesis (e.g. molar ratios, firing profile) | `acl-synthesis-inputs` | `prov:used` by synthesis `prov:Activity` |

### XRD Analysis Outputs

| File Type     | Description                                        | Store Bucket        | Usage            |
|---------------|----------------------------------------------------|---------------------|------------------|
| `.xrdml`      | Raw instrument data (XML-based diffraction scan)   | `acl-xrd-xrdml`     | `sosa:hasResult` |
| `.xye`        | Processed intensity profile (XYE: 2θ, intensity, error) | `acl-xrd-xye`    | `sosa:hasResult` |
| `.pdf` / `.html` | Human-readable report of XRD phase analysis     | `acl-xrd-reports`   | `dct:description` or `dcat:accessURL` |

Each store is independently addressable and associated with a `dcat:DataService`, for example:

```ttl
acl:xrdRawService a dcat:DataService ;
    dct:title "XRD XDDML Store" ;
    dcat:endpointURL <https://data.example.org/minio/acl-xrd-xddml/> ;
    dcat:servesDataset acl:xrdDataset .
```

## Integration with Metadata

Each dataset entry (e.g., acl:xrdDataset123) includes:

- A dcat:Distribution per file type
- Media type (dcat:mediaType) and file format (dct:format)
- Logical connection to the prov:Activity and sosa:Observation that generated it

```ttl
acl:xrdDist123 a dcat:Distribution ;
    dcat:downloadURL <https://data.example.org/minio/acl-xrd-xye/scan789.xye> ;
    dct:format "text/plain" ;
    dcat:mediaType "application/x-xye" ;
    dcat:accessService acl:xrdXYEService .
```

## FAIR Integration

All resources (samples, systems, observations) have unique URIs
Provenance links activities to agents and tools
Metadata and data are stored in an LDP-compatible repository and described with DCAT
Observations and results are exportable as RDF in Turtle or JSON-LD

## Related Resources

ACL Platform Model (Turtle)
Synthesis Workflow Example (PROV)
XRD Dataset (DCAT + SOSA)
Full ACL Catalog
