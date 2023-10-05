# 8-Bit_CPU_with-SAP-1_Architecture_on_FPGA

This repository contains the implementation of an 8-bit CPU with SAP-1 (Simple As Possible) architecture designed to run on an FPGA board. The project is optimized for resource efficiency and provides a versatile platform for experimenting with various instructions and applications
### Project files

**cpu.vhd:** The main CPU module that orchestrates the operation of the entire system.

**control_unit.vhd:** Implementation of the control unit responsible for instruction decoding and execution.

**mar.vhd:** Memory Address Register module.

**program_counter.vhd:** Program Counter module.

**register.vhd:** Register module for data storage.

**alu.vhd:** Arithmetic Logic Unit module for arithmetic and logical operations.

**divfreq.vhd:** Divider and Frequency Divider module.

**memory.vhd:** Memory module for program and data storage.

**top.vhd:** Top-level design module that integrates all components.


### Instruction Set ###

This current implementation on the tang nano 9 is meant to be driven with an external controller that can deliver 16 bits to the IO for the instruction.

|   OPCodes  | Meaning | Additional Cpmments |
|------------|---------|--------------------|
|   0000  | LOAD    |  4'b SRC REG A      |
|   0001  | STA / STORE  |  4'b SRC REG A => 4'b DST RAM    |
|   0010  | ADD  | 4'b SRC REG A + 4'b SRC RAM =>REG A   |
|   0011  | SUB     | 4'b SRC REG A + 4'b SRC RAM =>REG A  |
|   0100  | JMP     | 4'b SRC ADDR => 4'b RAM ADDR|
|   0110  | HLT   | Halt operations of CPU|



I will add more instructions in the future !

### Resource Usage
One of the key highlights of this project is its efficient resource utilization on the Tang Nano FPGA board. Here's an overview of the resource usage statistics:

Logic Utilization: The CPU design consumes minimal logic resources, with only 152 (113 LUTs, 27 ALUs, 2 RAM16s) out of 8640, accounting for approximately 2%.
Register Utilization: The design uses 69 registers out of 6693, which also amounts to around 2%.
Registers as Latch: 0 out of 6693 (0%)
Registers as Flip-Flops (FF): 69 out of 6693 (2%)
This efficient use of resources ensures that the CPU operates effectively on the Tang Nano board while leaving room for potential expansions and enhancements.

![image](https://github.com/Saad-emb/8-Bit_CPU_with-SAP-1_Architecture_on_FPGA/assets/123195068/ddc29422-3bc5-4838-aada-babda9425621)


These resource usage statistics demonstrate the project's commitment to optimizing hardware resources, making it an ideal choice for low-resource applications and educational purposes.

### Testing the Signal Flow of Register A (Fibonacci Result)

To ensure the proper functioning of the CPU and its ability to calculate the Fibonacci sequence, you can follow these steps to monitor the signal flow of Register A, which contains the result of the Fibonacci algorithm:

![image](https://github.com/Saad-emb/8-Bit_CPU_with-SAP-1_Architecture_on_FPGA/assets/123195068/6a39b690-f3e7-415a-8711-606eb1fb266e)

**Demo Video:** See the LEDs representing 8bit of the register  calculating Fibonacci numbers in real-time using frequency divided to see the cpu in action.

![](https://github.com/Saad-emb/-8-Bit_CPU_with-SAP-1_Architecture_on_FPGA/blob/main/image/test.gif)
