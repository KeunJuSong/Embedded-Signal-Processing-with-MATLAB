# **Lab2 - Sampling & Reconstruction**
## **Code**
* Length N - Impulse Train Function (Algorithm)
  * [impulse_train2.m](https://github.com/KeunJuSong/Embedded-Signal-Processing-with-MATLAB/blob/master/ESP_Lab2_Sampling/impulse_train2.m)
* Spectrum Function
  * [myfun_SA.m](https://github.com/KeunJuSong/Embedded-Signal-Processing-with-MATLAB/blob/master/ESP_Lab2_Sampling/myfun_SA.m)
* Practical exercise using Impulse Train & Specturm Function
  * [exercise#1](https://github.com/KeunJuSong/Embedded-Signal-Processing-with-MATLAB/blob/master/ESP_Lab2_Sampling/sampling.m)
## **What is Sampling?**</br>
* Sampling is one step of process that converting continuous time signal to discrete time signal.</br>
* Sampling process is look like a switch circuit that switching off in every ```n*Ts, (n = 0, 1, 2, ...)``` </br></br>
<img src="https://user-images.githubusercontent.com/48046183/104455150-37189c00-55ea-11eb-8019-244cdda6ced3.png" width="40%"></br>
<img src="https://user-images.githubusercontent.com/48046183/104455324-76df8380-55ea-11eb-8d70-b12421c07af4.png" width="40%"></br></br>
* From ```x_s(t) = x(n*Ts)```, ```Ts``` is called **Sampling Period** that is constant values.
* So, ```x_s(t)``` can be described that only ```n``` values can affected. ```x_s(t) = x[n]``` </br> 
Finally, we can say that ```x[n]``` is **Discrete-Time Signal** that output to all of the above processes. 
 
## **Modeling process of Sampling**
* Sampling continuous-time signal ```x(t)``` is same as multiplication of ```x(t)``` and impulse train, ```p(t)```</br></br>
**Implementing Impulse Train in MATLAB is the main part of this Lab.** (See **[Impulse Train Code](https://github.com/KeunJuSong/Embedded-Signal-Processing-with-MATLAB/blob/master/ESP_Lab2_Sampling/impluse_train2.m)**)</br></br>
<img src="https://user-images.githubusercontent.com/48046183/104459919-c45eef00-55f0-11eb-8fdb-7a88c4049023.png" width="25%"></br></br>
* ```p(t)``` is continuous-period function, so it can be expressed as follow using continuous time Fourier series(CTFS):</br></br>
<img src="https://user-images.githubusercontent.com/48046183/104460401-68489a80-55f1-11eb-8ee2-cfa8f87bac8a.png" width="40%"></br>
<img src="https://user-images.githubusercontent.com/48046183/104460590-a3e36480-55f1-11eb-9ef0-d9b6016a7d58.png" width="25%"></br></br>
* Back to square one, the multiplication of  ```x(t)``` and ```p(t)``` can be expressed as follow:</br></br>
<img src="https://user-images.githubusercontent.com/48046183/104461182-54516880-55f2-11eb-9774-804b6d684a09.png" width="30%"></br></br>
* See in frequency domain using Fourier Transformation.</br></br>
<img src="https://user-images.githubusercontent.com/48046183/104461345-94185000-55f2-11eb-92f8-404d7424d0bc.png" width="35%"></br>
<img src="https://user-images.githubusercontent.com/48046183/104461582-e35e8080-55f2-11eb-9e8b-69f4e65ec8e0.png" width="55%"></br></br>

## **Nyquist Sampling Frequency**
* Comparison between Sampling signal spectrum and origin signal spectrum</br></br>
<img src="https://user-images.githubusercontent.com/48046183/104464071-e1e28780-55f5-11eb-8e93-ffe9c46f81f2.png" width="60%"></br></br>
* Interval each of specturm in samping signal is ```Ws - 2*B```</br>
If ```Ws - 2*B``` is smaller than 0, then specturms are overlaped each other and cause a distorted signal.</br> 
This situation is called **Aliasing**.
* For anti-aliasing, sampling frequency is required as follow:</br></br>
<img src="https://user-images.githubusercontent.com/48046183/104465332-494d0700-55f7-11eb-8094-e20edb817db5.png" width="15%"></br></br>
```Ws``` is called **Nyquist frequency** if it meets this condition. 

## **Reconstruction using LPF**
* Best way to reconstruct sampling signal to origin is Low-Pass Filter(LPF).</br></br> 
<img src="https://user-images.githubusercontent.com/48046183/104466259-5dddcf00-55f8-11eb-9de2-de602e19ee99.png" width="60%"></br></br>
* But if aliasing is occured, reconstruction doesn't well even if using LPF.</br></br>
<img src="https://user-images.githubusercontent.com/48046183/104466627-c9c03780-55f8-11eb-8121-8119e6118e2f.png" width="60%"></br>
