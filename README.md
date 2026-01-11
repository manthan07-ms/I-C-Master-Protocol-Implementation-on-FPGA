# I-C-Master-Protocol-Implementation-on-FPGA

📌 Project Overview

This project implements an I²C master protocol on FPGA using Verilog HDL.
The design supports start and stop condition generation, serial address and data transmission, and ACK/NACK detection, controlled using a finite state machine (FSM).

The functionality of the I²C controller is verified by interfacing the FPGA with an MPU6050 (6-axis IMU) sensor.

⚙️ Features

✅ I²C master protocol implementation

✅ Start and Stop condition generation

✅ Serial clock (SCL) generation

✅ Bidirectional SDA line control

✅ ACK/NACK detection

✅ FSM-based protocol control

✅ Hardware verification using MPU6050 sensor

🧠 Working Principle

The FPGA generates the I²C clock (SCL) internally.

A Start condition is generated on the SDA line.

The slave address of the MPU6050 is transmitted.

The controller waits for ACK from the sensor.

Data bytes are transmitted over SDA.

ACK/NACK responses are monitored.

A Stop condition is generated to terminate communication.

🧩 State Machine Description
State	Description
IDLE	Waits for start command
START	Generates I²C start condition
SEND	Transmits address/data bits
READ_ACK	Reads acknowledgment from MPU6050
STOP	Generates I²C stop condition
🔌 Hardware Interfacing

Sensor Used: MPU6050 (I²C interface)

SDA ↔ FPGA SDA

SCL ↔ FPGA SCL

Verified ACK responses from the sensor during address and data transmission

🧪 Testing & Verification

Implemented on FPGA hardware

Interfaced with MPU6050 sensor

Verified correct ACK/NACK behavior

Confirmed successful I²C communication timing

🛠️ Tools & Technologies

Verilog HDL

Quartus II

ModelSim

FPGA Development Board (DE2 / Cyclone)

MPU6050 IMU Sensor

📂 File Structure
├── I2C_protocol.v
├── README.md

🚀 Applications

FPGA-based sensor interfacing

I²C protocol learning and validation

IMU data communication systems

RTL and FSM design practice


✍️ Author

Manthan Sabalpara
Electronics & Communication Engineering
FPGA | Verilog | Digital Design

📜 License

This project is open-source and intended for educational use.
