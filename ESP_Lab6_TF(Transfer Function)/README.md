# **Lab6 - Transfer Function**
## **Code**
* Practical exercise
  * [TF.m](https://github.com/KeunJuSong/Embedded-Signal-Processing-with-MATLAB/blob/master/ESP_Lab6_TF(Transfer%20Function)/TF.m)
## **Description**
### **Continuous LTI System**
* Continuous System, ```S{}```</br></br>
<img src="https://user-images.githubusercontent.com/48046183/106763298-058b7180-667a-11eb-85ed-406ad028d6b7.png" width="35%"></br>
* Output signal, ```y(t)```</br></br>
<img src="https://user-images.githubusercontent.com/48046183/106763554-4c796700-667a-11eb-8efb-85bec12ca19d.png" width="15%"></br>
* Input/Output signal if ```S{}``` is LTI System - convolutional operation with **Impulse Response**, h(t)</br></br>
<img src="https://user-images.githubusercontent.com/48046183/106764117-d4f80780-667a-11eb-9ee7-e929b87e23a0.png" width="25%"></br>
<img src="https://user-images.githubusercontent.com/48046183/106764268-fa851100-667a-11eb-9811-99b96d93e9c5.png" width="15%"></br>
* Input/Output signal if ```S{}``` is casual LTI System</br></br>
<img src="https://user-images.githubusercontent.com/48046183/106764685-5e0f3e80-667b-11eb-8c67-a3efc1fd096c.png" width="35%"></br>
* Input/Output signal in frequency domain - **Frequency Response**</br></br>
<img src="https://user-images.githubusercontent.com/48046183/106764922-9f9fe980-667b-11eb-9b4f-906651ecfd45.png" width="20%"></br>
<img src="https://user-images.githubusercontent.com/48046183/106765091-c9591080-667b-11eb-9860-96a6212d7bba.png" width="15%"></br>
* Problem of Fourier Transform
  * Transform is not possible in any kind of signal, x(t) because of mathematical limitations
* **Laplace Transform**
  * Alternative method from Fourier Transform problem
  * Can transform any kind of signal, x(t)</br></br>
  <img src="https://user-images.githubusercontent.com/48046183/106765964-b8f56580-667c-11eb-81e4-b689ee45876b.png" width="20%"></br>
  <img src="https://user-images.githubusercontent.com/48046183/106766024-cad70880-667c-11eb-8342-4dc64b0e3677.png" width="20%"></br>
* Any LTI System can be expressed in ```Y(s) = H(s)X(s)```
  * ```H(s)``` - **Transfer Function**
* Function Relationship in Continuous System</br></br>
<img src="https://user-images.githubusercontent.com/48046183/106766634-649eb580-667d-11eb-912c-6df6ab4a4ce1.png" width="35%"></br>

### **Discrete LTI System**
* Simillar with Continuous LTI System case!
* Discrete System, ```S{}```</br></br>
<img src="https://user-images.githubusercontent.com/48046183/106766965-bcd5b780-667d-11eb-9f3d-e22bd43c7264.png" width="35%"></br>
* Input/Output signal if ```S{}``` is LTI System - convolutional operation with **Impulse Response**, h(t)</br></br>
<img src="https://user-images.githubusercontent.com/48046183/106767161-ee4e8300-667d-11eb-983d-07c68fffb7c9.png" width="25%"></br>
<img src="https://user-images.githubusercontent.com/48046183/106767330-18a04080-667e-11eb-8aa0-5d7251cfd8cd.png" width="15%"></br>
* Input/Output signal if ```S{}``` is casual LTI System</br></br>
<img src="https://user-images.githubusercontent.com/48046183/106767451-3a012c80-667e-11eb-9ef8-e010f1507f9b.png" width="30%"></br>
* Input/Output signal in frequency domain - **Frequency Response**</br></br>
<img src="https://user-images.githubusercontent.com/48046183/106767590-5f8e3600-667e-11eb-859a-9259fd61092b.png" width="20%"></br>
* **Z Transform**
  * Same properties of Laplace Transform</br></br>
  <img src="https://user-images.githubusercontent.com/48046183/106767923-bc89ec00-667e-11eb-9b22-ab6e32bf2cf3.png" width="20%"></br>
* ```Y(z) = H(z)X(z)```, ```H(z)``` is called **Transfer Function** in Discrete LTI System
* Function Relationship in Discrete System</br></br>
<img src="https://user-images.githubusercontent.com/48046183/106768253-14285780-667f-11eb-96c0-d68e45bd55c5.png" width="35%"></br>

### **Pole-Zero Plot**
#### **Continuous System**
* Change ```Y(s) = H(s)X(s)```</br></br>
<img src="https://user-images.githubusercontent.com/48046183/106769210-0cb57e00-6680-11eb-91cf-3b5a385a1e54.png" width="20%"></br>
* ```B(s)```, ```A(s)``` are result of reduction of a fraction</br></br>
<img src="https://user-images.githubusercontent.com/48046183/106769646-864d6c00-6680-11eb-88e3-1d3717affdd7.png" width="35%"></br>
* This form is Denominator 'N'th-order Polynomial & Numerator 'M'th-order Polynomial, so this system is 'N'th-order system
* ```p_1, p_2, ... , p_N``` - **Pole**
* ```z_1, z_2, ... , z_M``` - **Zero**
* Pole & Zero are both complex, so they can be expressed in complex plane
  * Pole is marked like 'x'
  * Zero is marked like 'o'
  * This graph is called **Pole-Zero Plot**
* Example of Pole-Zero Plot
  * Assume 3th-order system</br></br>
  <img src="https://user-images.githubusercontent.com/48046183/106771209-1213c800-6682-11eb-8c9f-c322f81aa785.png" width="45%"></br>
  <img src="https://user-images.githubusercontent.com/48046183/106771283-25269800-6682-11eb-8fc6-a9674b78c8cd.png" width="25%"></br>
  <img src="https://user-images.githubusercontent.com/48046183/106771472-53a47300-6682-11eb-93a4-d9342b22cdab.png" width="35%"></br>
#### **Discrete System**
* Simillar with Continuous System case!
* Change ```Y(z) = H(z)X(z)```</br></br>
<img src="https://user-images.githubusercontent.com/48046183/106771952-e3e2b800-6682-11eb-935a-e55fcab30f42.png" width="20%"></br>
* ```B(z)```, ```A(z)``` are result of reduction of a fraction</br></br>
<img src="https://user-images.githubusercontent.com/48046183/106772036-f3620100-6682-11eb-946a-3076e059a1f1.png" width="35%"></br>
* ```p_1, p_2, ... , p_N``` - **Pole**
* ```z_1, z_2, ... , z_M``` - **Zero**
* Example of Pole-Zero Plot
  * Assume some discrete system</br></br>
  <img src="https://user-images.githubusercontent.com/48046183/106772233-24dacc80-6683-11eb-9d50-2b5e3cb5be8d.png" width="20%"></br>
  <img src="https://user-images.githubusercontent.com/48046183/106772350-4340c800-6683-11eb-86f9-3de3c6bfccfb.png" width="20%"></br>
  <img src="https://user-images.githubusercontent.com/48046183/106772427-5784c500-6683-11eb-80f9-19b2fecad390.png" width="20%"></br>
  <img src="https://user-images.githubusercontent.com/48046183/106772525-71bea300-6683-11eb-8456-f150a7f4128c.png" width="30%"></br>

### **Pole-Zero Plot - Stability**
* Pole-Zero Plot intuitively shows stability of the system
* What does it mean that system is stable?
  * Idea: When restricted magnitude of input is in the system, then output of the system is must be restriced magnitude
  * This idea is called **BIBO(Bounded-Input Bounded-Output)** Stability
* Stability in LTI System, Impulse Response properties
  * Impulse Response is must be converged to 0</br></br>
  <img src="https://user-images.githubusercontent.com/48046183/106845881-32c63700-66ef-11eb-8dd8-2378d66ed53f.png" width="15%"></br>
* **Charts of System Stability in Pole-Zero Polt**
  * **Continuous System**</br>
  
  |**Condition**|**Stability**|
  |:---:|:---:|
  |All poles are positioned in the left plane|Stable|
  |More than 1 pole is positioned in y-axis, with the rest is still positioned in the left plane|Marginally Stable|
  |More than 1 pole is positioned in the right plane|Unstable|
  
  * **Discrete System**</br>
  
  |**Condition**|**Stability**|
  |:---:|:---:|
  |All poles are positioned in the unit cricle|Stable|
  |More than 1 pole is positioned in a circumference of the unit cricle, with the rest is still positioned in the unit cricle|Marginally Stable|
  |More than 1 pole is positioned out of the unit cricle|Unstable|
* Condition of these chart is related with **Laplace Inverse & Z-Inverse**!  

### **Pole-Zero Plot - Frequency Response**
#### **Continuous System**
* Magnitude Spectrum using frequency response from transfer function of continuous system</br></br>
<img src="https://user-images.githubusercontent.com/48046183/106916364-6d10f200-674a-11eb-972f-bcbb4e226a64.png" width="35%"></br>
* **Denominator means that distance multiplication between some point in y-axis of s-plane and each pole**
* **Numerator means that distance multiplication between some point in y-axis of s-plane and each zero**</br></br>
<img src="https://user-images.githubusercontent.com/48046183/106917406-941bf380-674b-11eb-9e0e-a6125597231c.png" width="35%"></br>
* **The magnitude of freqency response**</br></br>
<img src="https://user-images.githubusercontent.com/48046183/106917777-f07f1300-674b-11eb-876c-a498c28b84da.png" width="40%"></br>

#### **Discrete System**
* Simillar with Continuous System
* Magnitude Spectrum using frequency response from transfer function of discrete system</br></br>
<img src="https://user-images.githubusercontent.com/48046183/106918342-756a2c80-674c-11eb-956d-2cbb896b104f.png" width="35%"></br>
* **Denominator means that distance multiplication between some point in circumference of the unit cricle and each pole**
* **Numerator means that distance multiplication between some point in circumference of the unit cricle and each zero**
  * Most small distance value
    * Pole : when some point in circumference equals the angle of each pole
    * Zero : when some point in circumference equals the angle of each zero</br></br>
    <img src="https://user-images.githubusercontent.com/48046183/106918736-d0038880-674c-11eb-94bb-ca002553a7c0.png" width="35%"></br>
* **The magnitude of freqency response**</br></br>
<img src="https://user-images.githubusercontent.com/48046183/106920138-21604780-674e-11eb-9929-5a229a574cbd.png" width="40%"></br>
