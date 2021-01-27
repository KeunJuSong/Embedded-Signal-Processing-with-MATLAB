# **Lab3 - Discrete Fourier Transformation(DFT)**
## **Code**
* DFT Function (Algorithm)
  * [my_DFT.m](https://github.com/KeunJuSong/Embedded-Signal-Processing-with-MATLAB/blob/master/ESP_Lab3_DFT/my_DFT.m)
* Practical exercises using DFT Function
  * [exercise#1](https://github.com/KeunJuSong/Embedded-Signal-Processing-with-MATLAB/blob/master/ESP_Lab3_DFT/DFT.m)
  * [exercise#2](https://github.com/KeunJuSong/Embedded-Signal-Processing-with-MATLAB/blob/master/ESP_Lab3_DFT/DFT_1.m)
## **Description**
### **Fourier Frequency Analysis**
* Analyzing various frequency features about signal that represented in time domain
* Signal Classification in time domain based on Continuity & Periodicity

|  |continuous-time|discrete-time|
|------|---|---|
|periodic|continuous-period signal ```x_p(t)```|discrete-period signal ```x_p[n]```|
|aperiodic|continous-aperiod signal ```x(t)```|discrete-aperiod signal ```x[n]```|

* **Fourier Frequency Analysis about 4 signals in time domain**
  * ```x_p(t)``` : Continuous-Time Fourier Series (CTFS)</br></br>
  <img src="https://user-images.githubusercontent.com/48046183/105996405-9f3ca700-60ed-11eb-87a2-c33e6e6717fb.png" width="35%"></br>
  * ```x(t)``` : Continuous-Time Fourier Transform (CTFT)</br></br>
  <img src="https://user-images.githubusercontent.com/48046183/105996654-fe9ab700-60ed-11eb-9d91-76772b907374.png" width="40%"></br>
  * ```x_p[n]``` : Discrete-Time Fourier Series (DTFS)</br></br>
  <img src="https://user-images.githubusercontent.com/48046183/105996881-4588ac80-60ee-11eb-9311-9017a28a9341.png" width="35%"></br>
  * ```x[n]``` : Discrete-Time Fourier Transform (DTFT)</br></br>
  <img src="https://user-images.githubusercontent.com/48046183/105997106-8f719280-60ee-11eb-8d76-e9c2d5e2e531.png" width="40%"></br>
 
### **DTFT Problem & DFT**
* **IDEA : Why We Sampling the continuous signal to make the discrete signal?** 
* In pratical, it's hard to handle the continuous information. So we consider digital system which is suitable for discrete information.
* **DTFT Problem**
  * With an idea above, DTFT have the infeasibility of implementation **beacuse it's output signal is continuous**.</br></br>
  <img src="https://user-images.githubusercontent.com/48046183/105999058-9c8f8100-60f0-11eb-8fc0-38dfd7c0b70a.png" width="40%"></br>
* **Discrete Fourier Transform (DFT)**
  * To overcome infeasibility of implementation, use **Sampling the continuous spectrum in frequency domain**.
  * Divide N-points in any values about ```[0,2*pi]```, DTFT</br></br>
    <img src="https://user-images.githubusercontent.com/48046183/106000523-3efc3400-60f2-11eb-9d0e-c347b8b01b15.png" width="40%"></br>
  * **Definition of N-point DFT**</br></br>
    <img src="https://user-images.githubusercontent.com/48046183/106000672-6fdc6900-60f2-11eb-966e-7f6343b8adc1.png" width="40%"></br>
  
