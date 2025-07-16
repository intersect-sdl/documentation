Example experimental workflow using a combination of:

* **SSN/SOSA** for sensors, observations, and platforms (e.g., LICOR, METER devices).
* **OBI** for processes, roles, and experimental design.
* **PROV** for tracking activities, derivations, and agents.
* **Custom terms** in `sdl:` or `bessd:` namespace for experiment-specific extensions.

---

## HIGH-LEVEL SEMANTIC FLOW

We’ll define the experiment in 6 stages:

### 1. **Initial Soil Sample Collection**

- `sosa:Sample` created from a `sosa:FeatureOfInterest` (the field or soil plot).

### 2. **Subsampling**

- Subsamples created using `prov:wasDerivedFrom` and modeled as `sosa:Sample`.

### 3. **Treatments**

- Represented as `obi:planned process` (e.g., fertilization, irrigation), applied to each subsample.

### 4. **Placement into Sample Jars**

- Each treated subsample is placed in a `sdl:SampleJar`.

### 5. **Deployment in Experimental Setup**

- The sample jars are `sosa:hostedBy` a `sosa:Platform` (e.g., chamber, tray, greenhouse).

### 6. **Continuous Observation**

- Devices from LICOR or METER record time series as `sosa:Observation`.

---

## TTL REPRESENTATION

```turtle
@prefix sosa: <http://www.w3.org/ns/sosa/> .
@prefix ssn: <http://www.w3.org/ns/ssn/> .
@prefix obi: <http://purl.obolibrary.org/obo/OBI_> .
@prefix prov: <http://www.w3.org/ns/prov#> .
@prefix dct: <http://purl.org/dc/terms/> .
@prefix sdl: <http://example.org/sdl/> .
@prefix lab: <http://example.org/lab/> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

### STAGE 1: Initial Soil Sample
lab:soilPlot1 a sosa:FeatureOfInterest ;
    rdfs:label "Field Plot 1" .

lab:sample001 a sosa:Sample ;
    sosa:isSampleOf lab:soilPlot1 ;
    prov:generatedAtTime "2025-05-20T09:00:00Z"^^xsd:dateTime ;
    dct:description "Bulk soil sample" .

### STAGE 2: Subsamples
lab:subsampleA a sosa:Sample ;
    prov:wasDerivedFrom lab:sample001 ;
    dct:description "Subsample A - untreated control" .

lab:subsampleB a sosa:Sample ;
    prov:wasDerivedFrom lab:sample001 ;
    dct:description "Subsample B - fertilizer treatment" .

### STAGE 3: Treatment Applications
lab:treatmentFertilizer a obi:0000011 ;  # planned process
    rdfs:label "Fertilizer Application" ;
    obi:has_specified_input lab:subsampleB ;
    obi:has_specified_output lab:subsampleB_Treated .

lab:subsampleB_Treated a sosa:Sample ;
    prov:wasDerivedFrom lab:subsampleB ;
    dct:description "Subsample B after fertilizer treatment" .

### STAGE 4: Placement into Jars
lab:jar1 a sdl:SampleJar ;
    sdl:contains lab:subsampleA ;
    rdfs:label "Jar for control" .

lab:jar2 a sdl:SampleJar ;
    sdl:contains lab:subsampleB_Treated ;
    rdfs:label "Jar for fertilizer-treated sample" .

### STAGE 5: Deployment
lab:tray1 a sosa:Platform ;
    rdfs:label "Measurement Tray" ;
    sosa:hosts lab:jar1, lab:jar2 .

### STAGE 6: Continuous Observation
lab:meterDevice1 a sosa:Sensor ;
    rdfs:label "METER TEROS 12" ;
    sosa:observes sdl:SoilMoisture, sdl:Temperature .

lab:obs1 a sosa:Observation ;
    sosa:madeBySensor lab:meterDevice1 ;
    sosa:observedProperty sdl:SoilMoisture ;
    sosa:hasFeatureOfInterest lab:subsampleA ;
    sosa:resultTime "2025-05-21T08:00:00Z"^^xsd:dateTime ;
    sosa:hasResult [ sosa:hasSimpleResult "18.2"^^xsd:float ] .

lab:obs2 a sosa:Observation ;
    sosa:madeBySensor lab:meterDevice1 ;
    sosa:observedProperty sdl:SoilMoisture ;
    sosa:hasFeatureOfInterest lab:subsampleB_Treated ;
    sosa:resultTime "2025-05-21T08:00:00Z"^^xsd:dateTime ;
    sosa:hasResult [ sosa:hasSimpleResult "22.5"^^xsd:float ] .
```

---

## BESSD ONTOLOGY EXTENSIONS

```turtle
sdl:SampleJar a rdfs:Class ;
    rdfs:subClassOf sosa:Platform ;
    rdfs:label "Sample Jar" .

sdl:contains a rdf:Property ;
    rdfs:domain sdl:SampleJar ;
    rdfs:range sosa:Sample ;
    rdfs:label "contains sample" .

sdl:SoilMoisture a sosa:ObservableProperty ;
    rdfs:label "Soil Moisture" .

sdl:Temperature a sosa:ObservableProperty ;
    rdfs:label "Temperature" .
```
