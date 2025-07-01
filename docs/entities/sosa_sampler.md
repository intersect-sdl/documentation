---
uuid: b2b5744e-6cb9-4878-baff-16cfd9db0115
title: Entity Detail — sosa:Sampler
author: SDL Team
tags:
  - SOSA
  - RDF Class
  - Sampler
  - Entity Detail
version: 1.0
published: true
---

The `sosa:Sampler` class represents a device, software, or agent capable of executing a `sosa:Sampling` activity to produce a `sosa:Sample`. In SDL, samplers can be field tools, instruments, automated systems, or even human agents configured to collect samples.

---

## 🔎 Definition

**URI**: `http://www.w3.org/ns/sosa/Sampler`

> A `sosa:Sampler` is used by or implements a `sosa:Sampling` to produce `sosa:Sample` instances.

---

## 📐 Usage in SDL

In SDL, `sosa:Sampler` is used to:

* Identify equipment or processes involved in collecting samples
* Link a `sosa:Sampling` activity to its executing agent or system
* Enable modeling of automated sampling workflows or manual collection procedures

Samplers help trace the origin of samples and support reproducibility.

---

## 🔄 Properties

| Property               | Description                                                      | Optional |
| ---------------------- | ---------------------------------------------------------------- | -------- |
| `dcterms:identifier`   | Unique ID for the sampler                                        | Yes      |
| `dcterms:title`        | Human-readable name or label                                     | Yes      |
| `dcterms:description`  | Description of what the sampler does or how it functions         | Yes      |
| `sosa:madeSampling`    | Link to `sosa:Sampling` events this sampler executed             | Yes      |
| `sosa:hosts`           | If hosted on a `sosa:Platform`                                   | Yes      |
| `prov:wasAttributedTo` | Associated agent or system responsible for operating the sampler | Yes      |

---

## 🧠 Composition

Samplers can be physical instruments or logical software agents. They are usually connected to sampling workflows via `sosa:madeSampling`.

```turtle
ex:sampler1 a sosa:Sampler ;
  dcterms:title "Hand-held Soil Auger" ;
  sosa:madeSampling ex:samplingEvent1 .

ex:samplingEvent1 a sosa:Sampling ;
  prov:generated ex:sampleA .
```

---

## 🧪 Example — Software Sampler

```turtle
ex:autoSamplerApp a sosa:Sampler , prov:SoftwareAgent ;
  dcterms:title "Automated Gas Sampler Controller" ;
  sosa:madeSampling ex:sampleRoutine42 .
```

---

## 🗂 Related Classes

* `sosa:Sampling` — action executed by a sampler
* `sosa:Sample` — outcome of a sampling
* `sosa:Platform` — may host a sampler
* `prov:Agent` — responsible person or software

---

## 📘 See Also

* [`sosa:Sampler`](https://www.w3.org/TR/vocab-ssn/#SOSASampler)
* [`sosa:Sampling`](https://www.w3.org/TR/vocab-ssn/#SOSASampling)
* [`prov:Agent`](https://www.w3.org/TR/prov-o/#Agent)

> `sosa:Sampler` enables SDL to document the agents and instruments behind every sample — providing a vital link for traceability, method repeatability, and quality assurance.
