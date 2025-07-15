---
uuid: 6e85870a-4b0e-4c75-83cd-5cd4c7a82648
title: New Platform Survey
published: true
---

This survey is intended to be **interactive** and **ontology-aligned**, useful for a web form or CLI questionnaire. It is broken down into logical sections, and can later be translated this into SHACL, RDFa, or form components in a UI.

---

## 🔍 **Survey: Describe a Scientific Sensor Platform (SSN:Platform)**

### 1. **General Platform Information**

* **Platform Name** (:rdfterm[dcterms:title])
* **Platform Identifier (URI)** (auto-generated or user-defined)
* **Description** (:rdfterm[dcterms:description])
* **Operator / Responsible Agent** (:rdfterm[prov:wasAssociatedWith])
* **Geographic Location**

  * Site / Facility Name
  * Latitude / Longitude
  * Elevation (optional)
  * Spatial Coverage Geometry (e.g. GeoJSON or WKT)

---

### 2. **Deployment Context**

* **Is this platform deployed?** (Yes/No)
* If yes:

  * **Deployment start date/time** (:rdfterm[prov:startedAtTime])
  * **Deployment end date/time** (:rdfterm[prov:endedAtTime]) (optional)
  * **Deployment location** (as above)
  * **Deployment Purpose / Campaign** (e.g. "Soil Carbon Monitoring 2024")

---

### 3. **Observed Phenomena / Features of Interest**

*For each:*

* **Feature of Interest** (e.g., "Soil Moisture", "Air Temperature") (:rdfterm[sosa:hasFeatureOfInterest])
* **Units of Measurement** (QUDT, OM, etc.)
* **Frequency of Observation**
* **Sampling Strategy** (random, regular, continuous)

---

### 4. **Input and Output Data**

#### Inputs:

* **Input Data Types** (e.g. config files, control signals, reference standards)
* **Input Formats** (CSV, JSON, XML, etc.)
* **Input Channels** (e.g., USB, Serial, Network)

#### Outputs:

* **Output Data Types** (e.g., time series, images, binary logs)
* **File Formats** (CSV, HDF5, TIFF, NetCDF, proprietary)
* **Output Channels** (e.g., SD card, MQTT, HTTP API)

---

### 5. **System Composition**

#### Add each :rdfterm[ssn:System] used:

For each system:

* **Name / Identifier**
* **Type** (Sensor, Actuator, Control System, etc.) (:rdfterm[rdf:type])
* **Description**
* **Manufacturer**
* **Model Number**
* **Location on Platform** (if fixed)
* **Operates continuously or triggered?**
* **Consumes Power?** If yes, estimate (voltage/current or W)

---

### 6. **Sensors**

*For each sensor (a subtype of :rdfterm[ssn:System]):*

* **Sensor Name**
* **What does it observe?** (:rdfterm[sosa:observes])
* **Output Format / Units**
* **Calibration Info (if any)**
* **Data Rate / Sampling Frequency**
* **Linked to what system/platform?** (:rdfterm[ssn:isHostedBy])

---

### 7. **Actuators**

*For each actuator (optional):*

* **Actuator Name**
* **Function / Role** (e.g. valve control, pump operation)
* **Controlled Property** (e.g., flow rate, temperature)
* **Input Type / Signal**
* **Controlled by what system?** (:rdfterm[ssn:hasSubSystem] or external agent)

---

### 8. **Networking and Control**

* **Does the platform include an onboard computer or controller?**
* If yes:

  * OS / Firmware version
  * Interfaces (Serial, USB, Wi-Fi, etc.)
  * Protocols supported (MQTT, HTTP, Modbus, etc.)
* **Remote access supported?**
* **How is data transmitted?** (Real-time, batch, offline upload)

---

### 9. **Power and Environmental**

* **Power source(s)** (battery, solar, AC, hybrid)
* **Environmental enclosure type** (IP rating if applicable)
* **Operating temperature/humidity range**
* **Other constraints** (e.g., mobile, mounted on UAV, waterproof)

---

### 10. **Maintenance and Provenance**

* **Date of last calibration**
* **Maintenance interval**
* **Last updated by** (agent/organization)
* **Additional provenance notes** (:rdfterm[prov:wasGeneratedBy], :rdfterm[prov:wasAttributedTo])

---

### 11. **Linked Data / Ontologies**

* **Do you use any standardized vocabularies?**

  * QUDT, OM, ENVO, SAREF, etc.
* **Would you like to upload ontology-aligned metadata?**
* **Associated Resources:**

  * **Datasets** (:rdfterm[dcat:Dataset])
  * **Distribution endpoints** (:rdfterm[dcat:Distribution])
  * **API URL or SPARQL endpoint**
