# **Lab7 - Analog Prototype Filter(APF)**
## **Code**
* Practical exercise
  * [APF.m](https://github.com/KeunJuSong/Embedded-Signal-Processing-with-MATLAB/blob/master/ESP_Lab7_APF(Analog%20Prototype%20Filter)/APF.m)
  * [APF_1.m](https://github.com/KeunJuSong/Embedded-Signal-Processing-with-MATLAB/blob/master/ESP_Lab7_APF(Analog%20Prototype%20Filter)/APF_1.m)
## **Description**
### **Process of the digital filter design**
* The way to design the digital filter : **Convert Analog Filter to Digital Filter**
  * Can easily apply the design theory of Analog Filter
  * Therefore it can be designed filter specifications selectively</br>
* Design the Digital Filter or Analog Filter : **Solving Transfer Function**
  * Analog Filter : Use electronic circuit components based on the transfer function
  * Digital Filter : Use CPU or digital devices based on the transfer function</br>
* **Problems : Designing Digital Filter from Analog Filter**
  * How we can design the Analog Filter well?
  * How we can design the Digital Filter from Analog Filter?</br>
* **The process of Digital Filter Design**</br></br>
<img src="https://user-images.githubusercontent.com/48046183/107872757-d386d480-6eef-11eb-9699-751bf30f94b5.png" width="35%"></br>
  * **Specification**
    * Based on the frequency response (with tunning **cut-off freq**, **degree of reduction in stopband**, **phase distortion**)
      * **LPF(Low Pass Filter)**
      * **BPF(Band Pass Filter)**
      * **HPF(High Pass Filter)**
      * **BSF(Band Stop Filter)**
  * **Select Analog Prototype Filter**
    * Analog Prototype Filter
      * For test with tunning parameters
  * **Design Analog LPF using Prototype**
    * All prototype filters are designed in LPF (Default)
  * **Frequency Transformation if needed**
    * To design another filter, not LPF, use frequency transformation to change filter specification
    * LPF → BPF, HPF, BSF
  * **Discretization**
    * Convert transfer function of Analog Filter(with following above 4 steps) ```H(s)``` to Digital Filter ```H_d(z)```
    * The result of this step is **IIR(Infinite Impulse Response) Filter**
  * **Windowing**
    * Make FIR(Finite Impulse Filter) Filter by cutting finite length(Windowing) in IIR

### **Types of Analog Prototype Filter**
* Butterworth Filter (Maximally flat filter)
  * Flat frequency response in passband & stopband
  * Large transition region between passband and stopband to have flat property
* Chebyshev Type-1 Filter
  * Allow ripple in passband to decrease transition region
  * Decrease more transition region when allow more ripple, but it can have distorted signal in passband (Trade-Off)  
* Chebyshev Type-2 Filter
  * Allow ripple in stopband to decrease transition region
  * Decrease more transition region when allow more ripple, but it can have distorted signal in stopband (Trade-Off)
* Elliptic Filter
  * Convergence filter with Chebyshev Type-1 & 2
  * Allow ripple in passband & stopband, so it have most decreased transition region
* Example : 5th-order(pole) system LPF, cut-off freq = 1 rad/sec</br></br>
<img src="https://user-images.githubusercontent.com/48046183/107879124-5b81d400-6f1a-11eb-8684-58c87c7294aa.png" width="35%"></br>

### **Butterworth Filter**
* Most simple filter in Analog Prototype Filter
* Tunning parameter is only one, pole (Order of system)
* Butterworth Filter - 'N'th-order system</br></br>
<img src="https://user-images.githubusercontent.com/48046183/107879227-f8dd0800-6f1a-11eb-91bb-5224fec184ae.png" width="35%"></br>
  * Magnitude of Frequency Response, tunning parameter N</br></br>
  <img src="https://user-images.githubusercontent.com/48046183/107879256-23c75c00-6f1b-11eb-98ee-182bb6580213.png" width="20%"></br>
  * Cut-off frequency (3dB frequency)
    * Prototype LPF cut-off frequency is always 1 rad/sec, which is half(1/2) power of frequency response 
    * Proof
      * Magnitude of Frequency Response</br></br>
      <img src="https://user-images.githubusercontent.com/48046183/107880123-4314b800-6f20-11eb-82fb-8da402d754ab.png" width="25%"></br>
      * Power of Frequenct Response</br></br>
      <img src="https://user-images.githubusercontent.com/48046183/107880159-68092b00-6f20-11eb-8271-20f0cb81d10c.png" width="15%"></br>
      * Convert unit, Power → dB</br></br>
      <img src="https://user-images.githubusercontent.com/48046183/107880273-1d3be300-6f21-11eb-8500-e2616b3f0487.png" width="30%"></br>
  * Stopband frequency
    * Set position which is generally less than 40dB or 50dB
    * <img src="https://user-images.githubusercontent.com/48046183/107880531-b0c1e380-6f22-11eb-8c72-35eb2a421ec3.png" width="35%"></br>
    * <img src="https://user-images.githubusercontent.com/48046183/107880523-90922480-6f22-11eb-83dd-b75eb57e1211.png" width="35%"></br>
  * Transition Region
    * Length of transition region - System complexity : Trade-Off property
    * Length of transition region</br></br>
    <img src="https://user-images.githubusercontent.com/48046183/107880796-7bb69080-6f24-11eb-9fcd-01a7e975e8fc.png" width="20%"></br>
  * System order with transition region  & filter specification ```P_s```</br></br>
  <img src="https://user-images.githubusercontent.com/48046183/107880989-832a6980-6f25-11eb-82de-ffb93d22a926.png" width="20%"></br>

### **Frequency Transformation**
* Change cut-off frequency or LPF to BPF, HPF, BSF
  * LPF ```w_1``` → LPF ```w_2```</br>
  <img src="https://user-images.githubusercontent.com/48046183/107881178-81ad7100-6f26-11eb-8879-1467c9241048.png" width="20%"></br>
  * LPF ```w_1```→ HPF ```w_2```</br>
  <img src="https://user-images.githubusercontent.com/48046183/107881206-b6212d00-6f26-11eb-9936-6a3c5ea890c5.png" width="20%"></br>  
  * LPF ```w_c```→ BPF ```[w_1, w_2]```</br>
  <img src="https://user-images.githubusercontent.com/48046183/107881268-f54f7e00-6f26-11eb-9eb2-c075ef4620e3.png" width="20%"></br>
  * LPF ```w_c```→ BSF ```[w_1, w_2]```</br>
  <img src="https://user-images.githubusercontent.com/48046183/107881287-144e1000-6f27-11eb-99a2-4a449f040617.png" width="20%"></br>
