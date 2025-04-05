# Apache Kafka Learning Plan

A phase-by-phase guide to learning Kafka for building distributed, event-driven systems. Perfect for backend devs handling large data streams or microservice communication.

---

## Resources

- [Apache Kafka Docs](https://kafka.apache.org/documentation/)
- [Confluent Platform](https://docs.confluent.io/platform/current/)
- [Kafka with Python (Faust, kafka-python)](https://github.com/dpkp/kafka-python)

---

## Tips for Success

- Learn Kafka CLI + Docker setup first
- Master the "topic" and "consumer group" mental model
- Use logs, metrics, and observability from day 1

---

## Phase-by-Phase Learning

### Phase 1: Kafka Core Concepts (Week 1)
- **Topics:** Broker, topics, partitions, producers, consumers
- **Projects:**
  - CLI-based topic producer/consumer
  - Pub-sub system via console
  - Log printer using Kafka CLI
- **Post:** "Started learning Kafka — producing and consuming my first topic via CLI 🚀"

---

### Phase 2: Producers & Consumers in Code (Week 2)
- **Topics:** kafka-python or confluent-kafka
- **Projects:**
  - Python producer script
  - Async consumer reading from multiple topics
  - JSON log streamer
- **Post:** "Built a Kafka event stream in Python — consumers & producers running asynchronously 🔄"

---

### Phase 3: Data Pipelines & Stream Processing (Weeks 3–4)
- **Topics:** Stream processing, windowing, key-value messages
- **Projects:**
  - Kafka-based order processing system
  - Real-time sentiment analyzer
  - Metrics aggregator using topics
