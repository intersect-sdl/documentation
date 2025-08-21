---
id: b2b5744e-6cb9-4878-baff-16cfd9db0115
title: sosa:Sampler
author: SDL Team
tags:
  - SOSA
  - RDF Class
  - Sampler
  - Entity Detail
version: 1.0
published: true
---

The :rdfterm[sosa:Sampler] class represents a device, software, or agent capable of executing a :rdfterm[sosa:Sampling] activity to produce a :rdfterm[sosa:Sample]. In SDL, samplers can be field tools, instruments, automated systems, or even human agents configured to collect samples.

---

## Definition

**URI**: `http://www.w3.org/ns/sosa/Sampler`

> A :rdfterm[sosa:Sampler] is used by or implements a :rdfterm[sosa:Sampling] to produce :rdfterm[sosa:Sample] instances.

---

## Usage in SDL

In SDL, :rdfterm[sosa:Sampler] is used to:

* Identify equipment or processes involved in collecting samples
* Link a :rdfterm[sosa:Sampling] activity to its executing agent or system
* Enable modeling of automated sampling workflows or manual collection procedures

Samplers help trace the origin of samples and support reproducibility.

---

## Properties

| Property               | Description                                                      | Optional |
| ---------------------- | ---------------------------------------------------------------- | -------- |
| :rdfterm[dcterms:identifier]   | Unique ID for the sampler                                        | Yes      |
| :rdfterm[dcterms:title]        | Human-readable name or label                                     | Yes      |
| :rdfterm[dcterms:description]  | Description of what the sampler does or how it functions         | Yes      |
| `sosa:madeSampling`    | Link to :rdfterm[sosa:Sampling] events this sampler executed             | Yes      |
| :rdfterm[sosa:hosts]           | If hosted on a :rdfterm[sosa:Platform]                                   | Yes      |
| :rdfterm[prov:wasAttributedTo] | Associated agent or system responsible for operating the sampler | Yes      |

---

## Composition

Samplers can be physical instruments or logical software agents. They are usually connected to sampling workflows via `sosa:madeSampling`.

```turtle
ex:sampler1 a sosa:Sampler ;
  dcterms:title "Hand-held Soil Auger" ;
  sosa:madeSampling ex:samplingEvent1 .

ex:samplingEvent1 a sosa:Sampling ;
  prov:generated ex:sampleA .
```

---

## Example — Software Sampler

```turtle
ex:autoSamplerApp a sosa:Sampler , prov:SoftwareAgent ;
  dcterms:title "Automated Gas Sampler Controller" ;
  sosa:madeSampling ex:sampleRoutine42 .
```

---

## Related Classes

* :rdfterm[sosa:Sampling] — action executed by a sampler
* :rdfterm[sosa:Sample] — outcome of a sampling
* :rdfterm[sosa:Platform] — may host a sampler
* :rdfterm[prov:Agent] — responsible person or software

---

## See Also

* [:rdfterm[sosa:Sampler]](https://www.w3.org/TR/vocab-ssn/#SOSASampler)
* [:rdfterm[sosa:Sampling]](https://www.w3.org/TR/vocab-ssn/#SOSASampling)
* [:rdfterm[prov:Agent]](https://www.w3.org/TR/prov-o/#Agent)

> :rdfterm[sosa:Sampler] enables SDL to document the agents and instruments behind every sample — providing a vital link for traceability, method repeatability, and quality assurance.
