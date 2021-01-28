# **Lab4 - Fast Fourier Transformation(FFT)**
## **Code**
* Time sharing of FFT Function (Algorithm)
  * [my_FFT1.m](https://github.com/KeunJuSong/Embedded-Signal-Processing-with-MATLAB/blob/master/ESP_Lab4_FFT/my_FFT1.m)
* Practical exercise using Time sharing of FFT Function
  * [FFT1.m](https://github.com/KeunJuSong/Embedded-Signal-Processing-with-MATLAB/blob/master/ESP_Lab4_FFT/FFT1.m)
## **Description**
### **DFT Problem & FFT**
* **DFT Problem**
  * To implement DFT Algorithm, **computation complexity is occured!**
  * N-point DFT Formula</br></br>
  <img src="https://user-images.githubusercontent.com/48046183/106000672-6fdc6900-60f2-11eb-966e-7f6343b8adc1.png" width="40%"></br>
  * Amount of computation based on N-point DFT Formula : ```N^2```
* **Fast Fourier Transform (FFT)**
  * To overcome computation complexity in N-point DFT, we need FFT!
### **Twiddle Factor**
* From N-point DFT, let's make form of **Complex Exponential Function** different.</br></br>
  <img src="https://user-images.githubusercontent.com/48046183/106144481-93b5b280-61b7-11eb-9d1c-412e48bc59d5.png" width="25%"></br>
* **Twiddle Factor** ```e^-j*(2*pi/N)``` : Unchanging value
  * ```k```,```n``` are changing value in the range of 0 to N-1</br></br>
  <img src="https://user-images.githubusercontent.com/48046183/106147073-c8773900-61ba-11eb-8b96-25dd9db83ce5.png" width="15%"></br>
  <img src="https://user-images.githubusercontent.com/48046183/106147853-b21dad00-61bb-11eb-89f5-6ef0ed97aea8.png" width="25%"></br>
  * It means dividing the circumference of the unit by N parts and rotate it clockwise.
    * Example : Twiddle Factor, N=8</br></br>
    <img src="https://user-images.githubusercontent.com/48046183/106148742-c57d4800-61bc-11eb-8389-11e197e5e3a1.png" width="30%"></br>
### **Time sharing of FFT Algorithm**
* Assume that N is 8, 8-point FFT. 
* **Rearrange Input Signal**

|**Input Order : n**|**Binary**|**Fliping bit**|**New Input Order**|
|:---:|:---:|:---:|:---:|
|0|000|000|0|
|1|001|100|4|
|2|010|010|2|
|3|011|110|6|
|4|100|001|1|
|5|101|101|5|
|6|110|011|3|
|7|111|111|7|

* **Time sharing of FFT Diagram**
* Computation Step in N-point FFT</br></br>
<img src="https://user-images.githubusercontent.com/48046183/106152862-41798f00-61c1-11eb-97a6-208911059c5d.png" width="10%"></br>
* 8-point FFT Diagram</br></br>
<img src="https://user-images.githubusercontent.com/48046183/106153051-7a196880-61c1-11eb-8cfd-436840c830ff.png" width="60%"></br>

* **Properties of Twiddle Factor**
  * **Origin symmetry**</br></br>
  <img src="https://user-images.githubusercontent.com/48046183/106153725-33783e00-61c2-11eb-93c9-ae6fc6b02c37.png" width="10%"></br>
    * Example : Origin symmetry of Twiddle Factor, N=2,4,8</br></br>
    <img src="https://user-images.githubusercontent.com/48046183/106154111-9bc71f80-61c2-11eb-8246-34135a33a6ca.png" width="35%"></br>
  * **Amount of computation in N-point FFT**</br></br> 
  <img src="https://user-images.githubusercontent.com/48046183/106155098-a46c2580-61c3-11eb-98fc-f861c39a6398.png" width="10%"></br>

### **Truncation & Zero-padding**
* FFT Algorithm requires that the length of input signal must be ```2^q```
* If not, we need to adjust it by using Truncation & Zero-padding
* Truncation
  * Delete input signal if the length is longer than N
* Zero-padding
  * Add 0 to make sure that the length going to be N if the length is shorter than N
