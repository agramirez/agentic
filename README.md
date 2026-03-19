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
6. The user takes the practice test(s) and the agentic system (test grader, test maker, gui maker agent) adapts new tests based on their performance.  The system also generates the UIs used for the tests (this will be a simple React UI) to provide aids like timers, study aide tools, etc.
7. The user can continue taking practice tests until they are satisfied with their grasp of the material
8. Practice tests can be retaken, answers can be reviewed, and the agentic system (test helper agent) will generate information relevant to the questions (this is helpful for the questions with wrong answers)

A special use case which will not be implement in v1 of the system is the generation of ancillary training materials.  This would include items like images showing concepts and ideas in visual format, audio narration for added knowledge retention, game elements for increase engagement, and other such material.  This will be implemented in v2 of the system.

# Architecture
The App will be based on a traditional microservices architecture with Agent AI tool use to create content.

An emphasis will be placed on:

- System security
- System observavility
- System metrics
- System adaptability
- System customizability
- System modularity

# Use Cases

## Example: Illinois Driver's License Study Guide
The Illinois Driver's License Study Guide prepares a new driver for their Illinois Driver's License permit test.  Any new driver must read the study guide and take a knowledge test of 30 questions, for which they must score an 80% or greater to pass and receive their permit.