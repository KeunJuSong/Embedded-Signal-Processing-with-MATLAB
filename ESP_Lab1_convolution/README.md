# **Lab1 - Convolution**
## **Code**
* Convolution Function (Algorithm)
  * [convolution.m](https://github.com/KeunJuSong/Embedded-Signal-Processing-with-MATLAB/blob/master/ESP_Lab1_convolution/convolution.m)
* Practical exercise using Convolution Function
  * [exercise#1](https://github.com/KeunJuSong/Embedded-Signal-Processing-with-MATLAB/blob/master/ESP_Lab1_convolution/conv.m)
  * [exercise#2](https://github.com/KeunJuSong/Embedded-Signal-Processing-with-MATLAB/blob/master/ESP_Lab1_convolution/convolution_lab323.m)
## **Description**
### **What is Convolution?**
* Convolution is operation that represents a synthetic signal for any two signals (at the time axis).
* For reference, we address discrete signals at discrete time. 
### **Convolution Formula**
1. Convolution for Two Discrete Signals</br></br>
<img src="https://user-images.githubusercontent.com/48046183/104319439-3584a080-5524-11eb-9d8e-ca77f1bf9b3b.png" width="50%"></br>
2. Assuming that impluse signal is input about Linear Time Invariant(LTI) System, Convolution can be summarized as follows.</br></br>
<img src="https://user-images.githubusercontent.com/48046183/104320043-23efc880-5525-11eb-9f27-a82edd507579.png" width="25%"></br>
3. In real world, most systems are casual system. Therefore, now Convolution can be derived as follows.</br></br>
<img src="https://user-images.githubusercontent.com/48046183/104321086-7f6e8600-5526-11eb-9709-713003e8b07b.png" width="25%"></br>

### **Convolution Operation**
* **Sliding Method**</br>
  * Sliding Method can explain very well about convolution operation based on **Convolution Formula-3**
  * I used Sliding Method algorithm to implement Convolution in MATLAB. (See **[Sliding Method Algorithm code](https://github.com/KeunJuSong/Embedded-Signal-Processing-with-MATLAB/blob/master/ESP_Lab1_convolution/convolution.m)**)</br></br>
* Example
  ```
  h[n] = [0, 3, 2, 1, 0], n = -1, 0, 1, 2, 3
  x[n] = [0, -1, 0, 1, 2, 0], n = -2, -1, 0, 1, 2, 3 
  h[n] * x[n] = ? 
  ````
  * Sliding Method</br></br>
  <img src="https://user-images.githubusercontent.com/48046183/104326862-8e0c6b80-552d-11eb-9078-1864ececf29d.png" width="70%">

### **Convolution Property**
* **Commutative Property**</br></br>
<img src="https://user-images.githubusercontent.com/48046183/104327815-85686500-552e-11eb-8067-4dbd0e89cf9e.png" width="25%"></br>
  * In physical situation, this means that when two systems are in dependent connection, the result doesn't change even if switching the order of connection.</br></br> 
* **Associative property**</br></br>
<img src="https://user-images.githubusercontent.com/48046183/104328509-3a028680-552f-11eb-96d7-5ba2fc62624b.png" width="40%"></br>
  * In physical situation, this means that when two systems are in dependent connection, convolutional result of two systems can be replaced with result of one system.</br></br>  
* **Distributive property**</br></br>
<img src="https://user-images.githubusercontent.com/48046183/104328569-4be42980-552f-11eb-9742-cb35b13c5862.png" width="40%"></br>
  * In physical situation, this means that when two systems are in parallel connection, convolutional operation each of system can be replaced with one system.</br></br>
  
* **Shifting**</br></br>
<img src="https://user-images.githubusercontent.com/48046183/104328659-61f1ea00-552f-11eb-8dc0-17dd4eeeceaa.png" width="30%"></br>
  * In physical situation, this means that when doing time-shifting by 'n0' about input signal, same time-shifting by 'n0' occur about output signal.</br></br>
  
