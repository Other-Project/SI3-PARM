# P-ARM

<p align=center>
  <span>Project realized by <a href="https://github.com/AlbanFALCOZ">Alban Falcoz</a>, <a href="https://github.com/06Games">Evan Galli</a> and <a href="https://github.com/theoLassauniere">Théo Lassauniere</a> as part of the <b>Architecture</b> course.</span>
</p>

## The project

We aimed to model a simplified ARM Cortex M0 processor using the Logisim Evolution software, with the ultimate objective of making this processor functional by executing C code compiled into assembly.

Our processor is made up of 3 main components: 

**The Arithmetic Logic Unit (ALU)**  
The ALU is responsible for performing calculations within the processor. It takes (among other things) two 32-bit operands and a specified operation as input and outputs the result of the calculation along with flags. These flags indicate various states following a calculation, such as negative result, zero result, carry, or overflow, which are used in conditional branching. The two input operands are provided by the register bank.

**The Register Bank**  
The register bank serves as the processor's internal memory. As its name suggests, it's made up of several registers. In our project, there are 8 ranging from R0 to R7 reserved for general use.

**The controller**  
The controller plays the role of orchestra conductor within the processor. It is responsible for decoding instructions received by the processor. These instructions are forwarded by the instruction decoder to the corresponding submodule.
* Data Processing: Performs arithmetic operations between two registers and writes the result to a register.
* Shift, Add, Subtract, Move Block: Performs shifting, addition, subtraction, and comparison operations between a register and an immediate value. This block also has the ability to store an immediate value into a register.
* Stack Pointer: In our setup, it is stored in a register directly located within the controller. It stores the memory address where the stack starts. Typically, the Stack Pointer is decremented by the amount of memory needed. Once its usage is finished, it is incremented to return to the initial value. These operations are carried out using the SP Address block, which allows adding or subtracting an immediate value from the Stack Pointer's value.
* Load/Store Block: Facilitates data transfers between registers and memory. This block requires more than one cycle to perform certain operations as memory data is returned only in the next cycle.
* The Flags APSR block stores flags for potential use in the next cycle.
* The controller also manages the Program Counter, which determines the address of the next instruction. By default, it is incremented by 1 with each clock stroke.
* Conditional Branching: Interferes with the default behavior of the Program Counter. If the condition encoded in the instruction is verified by the flags received from the Flags APSR block, it executes a certain jump in the instruction execution. The immediate value passed as a parameter helps determine this offset from the current instruction address.

## Organization

To carry out this project, we divided up the various tasks as follows: 
* during the first week, [Evan](https://github.com/06Games) and [Alban](https://github.com/AlbanFALCOZ) were in charge of building the ALU, while [Théo](https://github.com/theoLassauniere) worked on the operation of the register bank.
* The controller was built during the 2nd and 3rd weeks, by the whole group.
* In the 4th week, Théo worked on the data path, while Evan and Alban created the assembler.
* In week 5, we ironed out the final problems with the assembler, enabling us to run compiled c code in the CPU.
* And finally, in the last session, we added various features to take the project a step further.

## Highlights

* The processor is covered by over 44,000 test vectors, which we were able to generate using a [program we wrote ourselves](src/GenerateTestVector).
* It possible to run C code on our processor
* We added various inputs/outputs, such as buzzers and sliders
* We've implemented support for indirect addressing, enabling the use of pointers and arrays


## Preview

https://github.com/Other-Project/SI3-PARM/assets/24252743/d611dcfc-694c-487e-835d-0c9fc8e66a3a
