# 4-Bit-Binary-Multiplier
Design and implementation of a 4 bit binary multiplier using TTL ICs and verilog. this project demonstrate binary multiplication and combinational circuit design using verilog HDL. also complex breadboard implementation using 7408 and 7483 ICs.
4×4 Binary Array Multiplier

Pure Combinational Hardware Architecture using TTL ICs and Verilog HDL

<p align="center">
  <b>Digital Electronics | Digital Logic Design | Verilog HDL | Hardware Implementation</b>
</p>---

1. Project Overview

The 4×4 Binary Array Multiplier is a digital combinational circuit designed to multiply two unsigned 4-bit binary numbers and generate an 8-bit binary product.

This project demonstrates two approaches to binary multiplication:

1. Physical Hardware Implementation: Using TTL logic ICs (7408 AND gates and 7483 binary adders) on a breadboard.
2. Verilog HDL Implementation: Designing the multiplier using Verilog modules and digital logic operations.

The circuit performs multiplication using partial product generation and multi-stage binary addition. It operates using combinational logic without requiring a clock signal, microcontroller, or software execution.

This project provides practical knowledge of digital arithmetic, logic gates, full adders, carry propagation, hardware design, and RTL implementation.

2. Project Objectives

- To understand the fundamentals of binary multiplication.
- To design and implement a 4×4 binary array multiplier.
- To generate partial products using AND gates.
- To perform binary addition using full adders.
- To understand carry propagation in multi-stage addition.
- To implement the multiplier using TTL ICs.
- To develop a modular Verilog HDL implementation.
- To compare physical hardware implementation with digital simulation.

3. Mathematical Background

A 4-bit unsigned binary number can represent values from 0 to 15.

Let the two input operands be:

Input A:
A = A3 A2 A1 A0

Input B:
B = B3 B2 B1 B0

The multiplication is expressed as:

P = A × B

The maximum possible product is:

15 × 15 = 225

In binary:

1111 × 1111 = 11100001

Therefore:

- Input width = 4 bits each
- Output width = 8 bits
- Minimum product = 0
- Maximum product = 225

4. Hardware Architecture

The physical multiplier is implemented using TTL logic ICs on a breadboard.

4.1 Partial Product Generation

Four IC 7408 (Quad 2-input AND gate) are used to generate sixteen partial products.

Each partial product is calculated using:

PP(i,j) = Ai AND Bj

The partial products are:

- A0B0, A1B0, A2B0, A3B0
- A0B1, A1B1, A2B1, A3B1
- A0B2, A1B2, A2B2, A3B2
- A0B3, A1B3, A2B3, A3B3

The least significant product bit is:

P0 = A0 AND B0

It is directly connected to the output.

4.2 Partial Product Addition

Three IC 7483 (4-bit binary full adders) are used for multi-stage addition of the shifted partial product rows.

The addition stages combine the partial products and propagate carry information to generate the final product bits.

Correct carry propagation is essential for obtaining the correct multiplication result.

4.3 Output Stage

The final circuit generates an 8-bit output:

P = P7 P6 P5 P4 P3 P2 P1 P0

The output can be observed using LEDs connected to the respective output bits.

5. Hardware Components

Component| Quantity| Purpose
IC 7408| 4| Partial product generation
IC 7483| 3| Binary addition
Breadboard| 1| Hardware implementation
DIP switches| As required| Binary input selection
LEDs| 8| Output indication
Connecting wires| As required| Circuit connections
Power supply| As required| Circuit operation

Hardware Note: All TTL inputs must have defined logic levels. IC power connections, input biasing, and carry connections must follow the respective datasheets and verified circuit schematic.

6. Verilog HDL Implementation

The multiplier is also implemented using Verilog HDL.

The design follows a modular approach and consists of three main modules:

6.1 Full Adder Module

The full adder accepts three inputs:

- A
- B
- Carry-In (Cin)

It produces two outputs:

- Sum
- Carry-Out (Cout)

Sum equation:

S = A XOR B XOR Cin

Carry equation:

Cout = AB + BCin + ACin

6.2 4-bit Ripple Carry Adder

Four full adders are connected in series to construct a 4-bit ripple carry adder.

The carry output of each full adder is connected to the carry input of the next stage.

This allows the addition of two 4-bit binary numbers.

6.3 4×4 Binary Multiplier Module

The main multiplier module performs the following operations:

1. Generates sixteen partial products.
2. Adds the shifted partial product rows.
3. Propagates carry information between addition stages.
4. Produces the final 8-bit multiplication result.

The implementation uses module instantiation and combinational logic.

Verilog Source File: "multiplier4bit.v"

7. Digital Simulation

The project also includes a DigitalJS simulation file:

"multiplier4bit.digitaljs"

This file contains the digital circuit simulation design.

The simulation can be used to observe the circuit's logical operation and input-output behaviour.

8. Testing and Verification

The multiplier can be tested using different combinations of 4-bit inputs.

There are:

16 × 16 = 256 possible input combinations.

Example Test Cases

Input A| Input B| Decimal Operation| Expected Output
0000| 0000| 0 × 0| 00000000
0010| 0011| 2 × 3| 00000110
0101| 0010| 5 × 2| 00001010
1010| 0011| 10 × 3| 00011110
1111| 1111| 15 × 15| 11100001

Worst-Case Test

Input A = 1111 (15)

Input B = 1111 (15)

Expected Product:

1111 × 1111 = 11100001

15 × 15 = 225

This is the maximum possible unsigned 4-bit multiplication result.

9. Hardware Implementation Photograph

The following photograph shows the physical breadboard implementation of the project.

"Breadboard Implementation" (WhatsApp Image 2026-11-19 at 2.01.57 AM.jpeg)

10. Project Files

The repository contains the following project files:

File| Description
README.md| Project documentation
multiplier4bit.v| Verilog HDL source code
multiplier4bit.digitaljs| DigitalJS simulation file
Breadboard photograph| Physical hardware implementation

11. Applications

4×4 binary multipliers are useful in understanding the fundamental concepts of digital arithmetic and computer hardware.

Some important applications include:

- Arithmetic Logic Units (ALUs)
- Digital Signal Processing (DSP)
- Computer Architecture
- Embedded Digital Systems
- VLSI Design
- Arithmetic Datapaths
- Digital Computing Systems

12. Learning Outcomes

Through this project, the following concepts are explored:

- Binary number systems
- Boolean algebra
- AND gates and logic operations
- Half adders and full adders
- Ripple carry addition
- Partial product generation
- Combinational circuit design
- TTL IC interfacing
- Verilog HDL programming
- Digital circuit simulation

13. Future Improvements

- Add a complete verified circuit schematic.
- Perform exhaustive verification of all 256 input combinations.
- Add Verilog testbench and waveform screenshots.
- Compare physical hardware results with Verilog simulation.
- Explore faster multiplier architectures such as Wallace Tree and Dadda Tree multipliers.

14. Conclusion

The 4×4 Binary Array Multiplier project demonstrates unsigned binary multiplication through physical TTL hardware and Verilog HDL implementation.

It provides practical experience in designing combinational circuits, generating partial products, performing multi-stage binary addition, understanding carry propagation, and developing digital hardware using Verilog.

The project connects theoretical concepts of Digital Electronics with practical hardware implementation and digital circuit simulation.

---

Project Domain: Electronics and Communication Engineering (ECE)

Project Type: Digital Electronics / Combinational Logic Design

Implementation: Breadboard Hardware + Verilog HDL + DigitalJS

Language: Verilog HDL
