# agentic
A repo to showcase my capabilities in Agentic LLM design with an Erlang/Rust/LLama/PostgreSQL tech stack.

# The App
This system will dynamically generate practice tests, and their associated UIs, for any given corpuse of 
knowledge.  

The general use case is as follows;

1. A user creates an account in the system
2. A user uploads corpus of knowledge (e.g. pdf documents, word docs, txt files, etc.)
3. The corpus of knowledge is parsed and stored in a PostgreSQL vector store
4. The agentic system (test maker agent, gui maker agent) generate set of tests based on the material
5. The user approves the tests
6. The user takes the practice test(s) and the agentic system (test grader, test maker, gui maker agent) adapts new tests based on their performance.  The system also generates the UIs used for the tests to provide aids like timers, study aide tools, etc.
7. The user can continue taking practice tests until they are satisfied with their grasp of the material
8. Practice tests can be retaken, answers can be reviewed, and the agentic system (test helper agent) will generate information relevant to the questions (this is helpful for the questions with wrong answers)

A special use case which will not be implement in v1 of the system is the generation of ancillary training materials.  This would include items like images showing concepts and ideas in visual format, audio narration for added knowledge retention, game elements for increase engagement, and other such material.  This will be implemented in v2 of the system.

# Architecture
The App will be based on a traditional microservices architecture with Agent AI tool use to create content.

An emphasis will be placed on:

- System scalability
- System security
- System observavility
- System development

## Scalability

The idea is to use the inherent capabilities of the [Erlang](https://www.erlang.org/) to allow for near unlimitted scalability.

Given that [Erlang](https://www.erlang.org/) has been developed, curated, and enhanced for over 30 years to work in a distributed, scalable, robust manner.  Given that it's functional programming roots give it execellent extensibility, modularity, and ease of use.

Then, this platform along with it's ability to work with low level languages such as C will give us extreme performance PLUS all of the features previously mentioned.  

> NOTE: Rust will be used as a wrapper around the C/C++ libaries of the llama.cpp project because of it's memory safety capabilities.  This will create a slight performance penalty, but it will be trivial compared to usage of the Ollama server API or any of the commercial LLM APIs.  In addition, if Global Scale performance is necessary, the Rust wrapper can be substitutted with C/C++ using the CompCert compiler and Rocq theorem prover to ensure safety...however, that excersize is outside of the scope of this project at this time.

## Security
We will ensure software correctness by leveraging [Rust](https://rust-lang.org/), [Erlang](https://www.erlang.org/), [Rocq](https://rocq-prover.org/)/[TLA+](https://lamport.azurewebsites.net/tla/high-level-view.html).  In addition, we will also use the [RISC Zero/zkVM framework](https://dev.risczero.com/api/zkvm/) and [OpenSSF](https://openssf.org/) to attest software provinance for all code in the system.  Finally, we will follow the [US DoD STIG guidelines](https://www.cyber.mil/stigs/) and OWASP project tools to ensure a robust and secure code and infrastructure.

## Observability 
For observability we will leverage the [OpenTelemetry](https://opentelemetry.io/) standard and use the [Grafana](https://grafana.com/oss/grafana/?plcmt=oss-nav)/[Loki](https://grafana.com/oss/loki/?plcmt=oss-nav)/[Alloy](https://grafana.com/oss/alloy-opentelemetry-collector/?plcmt=oss-nav) tech stack for visualizations and monitoring.  This will provide visibility from our infrastructure all the way up to our test results and user engagement metrics.

A large part of the system will be geared towards producing evidenced based changes to the UI, test elements/questions, and other product features by leveraging the [Evidential Framework](https://docs.evidential.dev/). 

## Development
The large ecosystem of [VSCode](https://code.visualstudio.com/) tools and extensions will be used for the development, testing, and deployment of the system.  For task and project management we will use [OpenProject](https://www.openproject.org/) and CI/CD pipelines using [Gitea](https://about.gitea.com/).

> Note: I could use the GitHub/GitLab project management/tracking.  But, since this is an excersize in creating a fully enclosed, secure, and independent system with all open source tools...well...I'm going all out and hosting everything myself :P

Documentation will be handled by automatic tools such as [rebar3](https://www.rebar3.org/docs/getting-started/)/[edoc](https://www.erlang.org/doc/apps/edoc/chapter.html) and [cargo](https://crates.io/)/rustdoc for low level API documentation.  However, architectural and high level documentation will be developed using the [Archimate framework](https://www.opengroup.org/archimate-forum/archimate-overview) and [UML](https://www.omg.org/uml/)/[PlantUML](https://plantuml.com/).

Given the robustness and flexibility of the [Erlang Common Test framework](https://www.erlang.org/doc/apps/common_test/introduction.html), we will use this framework for all our unit tests.  In order to test UI elements we might also use [Selenium](https://www.selenium.dev/). 

# Use Cases

## Example: Illinois Driver's License Study Guide
The Illinois Driver's License Study Guide prepares a new driver for their Illinois Driver's License permit test.  Any new driver must read the study guide and take a knowledge test of 30 questions, for which they must score an 80% or greater to pass and receive their permit.