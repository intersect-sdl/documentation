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

* **Chemspeed Swing XL Synthesizer** – controlled via programmable input files
    * **Ball mill** for precursor mixing
    * **Pellet press** for compaction
    * **Furnace** with programmable temperature profiles

Each system is represented as an :rdfterm[ssn:System] or subclass, deployed via :rdfterm[ssn:Deployment].

### Analytical Systems

Post-synthesis, materials are analyzed using:

* **XRD (X-ray Diffraction)** – for phase identification
* **HPLC (High-Performance Liquid Chromatography)** – for impurity profiling
* **TGA-SDT650** – for thermal decomposition and mass loss profiling
* **Electrochemical Workstation** – for voltage, current, and conductivity measurements

Each instrument is modeled as an :rdfterm[ssn:System] capable of generating one or more :rdfterm[sosa:Observation]s.

### Sample Handling and Transport

* **KUKA Robotic Arm** – handles sample manipulation within stations.
* **KUKA Mobile Robot** – transports samples between synthesis and analytical stations. Each is tracked as an \:rdfterm and supports associated \:rdfterms for movement and handoff.

---

## Feature of Interest (FoI)

The core :rdfterm[sosa:FeatureOfInterest] in ACL workflows is:

* :rdfterm[acl:SolidSample]: a synthesized material composed of one or more chemical compounds, characterized by physical and chemical properties.

Additional FoIs:

* :rdfterm[acl:PrecursorMixture]: the input blend of chemicals.
* :rdfterm[acl:SynthesisBatch]: logical grouping of samples from a single recipe.

---

## Observable Properties

Observable properties include:

| Property                               | Description                                | Measured by                 |
| -------------------------------------- | ------------------------------------------ | --------------------------- |
| :rdfterm[acl:phaseComposition]         | Crystal phase (e.g., perovskite structure) | XRD                         |
| :rdfterm[acl:purity]                   | Chemical purity / impurity levels          | HPLC, ICP-OES               |
| :rdfterm[acl:bondingState]             | Functional groups or bonding patterns      | N/A                         |
| :rdfterm[acl:elementalRatio]           | Molar/weight ratio of elements             | N/A.                        |
| :rdfterm[acl:massLossProfile]          | Mass loss vs. temperature curve            | TGA-SDT650                  |
| :rdfterm[acl:electrochemicalSignature] | I-V behavior, charge/discharge properties  | Electrochemical Workstation |

Each is modeled using :rdfterm[sosa:ObservableProperty].

---

## Workflow: Synthesize & Analyze

### Step 1: Sample Synthesis

1. Mix precursors (:rdfterm[acl:PrecursorMixture])
2. Compact into pellet
3. Fire in furnace
4. Result: :rdfterm[acl:SolidSample]

```ttl
acl:run123 a prov:Activity ;
  prov:used acl:precursorMixture456 ;
  prov:generated acl:sample789 ;
  prov:wasAssociatedWith acl:automatedFurnace ;
  prov:startedAtTime "2025-07-10T09:00:00Z"^^xsd:dateTime .
```

### Step 2: Sample Analysis

1. Mount sample on XRD
2. Capture diffraction pattern
3. Derive :rdfterm[acl:phaseComposition]

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

Other measurements (HPLC, ICP-OES, FTIR, TGA) follow a similar pattern.

---

## Input & Output Definitions

| Stage     | Instrument | Input                  | Output                 |
| --------- | ---------- | ------------ | ---------------------- |
| Synthesis | Swing XL.  | :rdfterm[acl:PrecursorMixture] | :rdfterm[acl:SolidSample]      |
| Analysis  | XRD        | :rdfterm[acl:SolidSample]      | :rdfterm[acl:phaseComposition] |
|           | HPLC      | :rdfterm[acl:SolidSample]      | :rdfterm[acl:purity]           |
|           | ICP-OES   | :rdfterm[acl:SolidSample]      | :rdfterm[acl:elementalRatio]   |
|           | FTIR      | :rdfterm[acl:SolidSample]      | :rdfterm[acl:bondingState]     |
|           | TGA       | :rdfterm[acl:SolidSample]      | :rdfterm[acl:massLossProfile]  |
|           | EChem     | :rdfterm[acl:SolidSample]      | :rdfterm[acl:electrochemicalSignature] |

All inputs and outputs are semantically linked via :rdfterm[prov:used] and :rdfterm[prov:generated].

---

## Data Stores and File Mapping

Each file generated or used in ACL workflows is stored in a structured **data store** associated with a specific purpose and media type. These stores are implemented as **MinIO buckets**, referenced in metadata via :rdfterm[dcat:DataService] and :rdfterm[dcat:Distribution].

### Synthesis Input

| File Type        | Description                | Store Bucket           | Usage                                       |
| ---------------- | -------------------------- | ---------------------- | ------------------------------------------- |
| `.json` / `.yml` | Input recipe for synthesis | `acl-synthesis-inputs` | :rdfterm[prov:used] by synthesis activity |
| `.txt` / `.csv`  | Program script for Chemspeed Swing XL execution | `acl-chemspeed-programs` | :rdfterm[prov:used] by Chemspeed deployment |

### XRD Analysis Outputs

| File Type        | Description                                      | Store Bucket      | Usage                      |
| ---------------- | ------------------------------------------------ | ----------------- | -------------------------- |
| `.xrdml`         | Raw instrument data (XML-based diffraction scan) | `acl-xrd-xrdml`   | :rdfterm[sosa:hasResult] |
| `.xye`           | Processed intensity profile                      | `acl-xrd-xye`     | :rdfterm[sosa:hasResult] |
| `.pdf` / `.html` | Human-readable report of XRD analysis            | `acl-xrd-reports` | :rdfterm[dcat:accessURL] |

### TGA Analysis Outputs

| File Type        | Description                             | Store Bucket      | Usage                      |
| ---------------- | --------------------------------------- | ----------------- | -------------------------- |
| `.csv` / `.txt`  | Raw thermal profile data (mass vs temp) | `acl-tga-data`    | :rdfterm[sosa:hasResult] |
| `.pdf` / `.html` | Human-readable TGA report               | `acl-tga-reports` | :rdfterm[dcat:accessURL] |

### HPLC Analysis Outputs

| File Type        | Description                             | Store Bucket       | Usage    |
| ---------------- | --------------------------------------- | ------------------ | -------- |
| `.cdf` / `.csv`  | Raw or processed chromatogram data      | `acl-hplc-data`    | :rdfterm[sosa:hasResult] |
| `.pdf` / `.html` | Human-readable impurity analysis report | `acl-hplc-reports` | :rdfterm[dcat:accessURL] |

Each store is independently addressable and associated with a `:rdfterm[dcat:DataService]`, for example:

```ttl
acl:xrdRawService a dcat:DataService ;
  dct:title "XRD XRDML Store" ;
  dcat:endpointURL <https://data.example.org/minio/acl-xrd-xrdml/> ;
  dcat:servesDataset acl:xrdDataset .
```

---

## Integration with Metadata

Each dataset entry (e.g., :rdfterm[acl:xrdDataset123]) includes:

* A :rdfterm[dcat:Distribution] per file type
* Media type (:rdfterm[dcat:mediaType]) and file format (:rdfterm[dct:format])
* Logical connection to the :rdfterm[prov:Activity] and :rdfterm[sosa:Observation] that generated it

```ttl
acl:xrdDist123 a dcat:Distribution ;
  dcat:downloadURL <https://data.example.org/minio/acl-xrd-xye/scan789.xye> ;
  dct:format "text/plain" ;
  dcat:mediaType "application/x-xye" ;
  dcat:accessService acl:xrdXYEService .
```

---

## FAIR Integration

All resources (samples, systems, observations) have unique URIs.
Provenance links activities to agents and tools.
Metadata and data are stored in an LDP-compatible repository and described with DCAT.
Observations and results are exportable as RDF in Turtle or JSON-LD.

---

## Related Resources

* ACL Platform Model (Turtle)
* Synthesis Workflow Example (PROV)
* XRD Dataset (DCAT + SOSA)
* Full ACL Catalog
