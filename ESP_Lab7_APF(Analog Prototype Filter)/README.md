# **Lab7 - Analog Prototype Filter(APF) (Preparing...)**
## **Code**
*
*
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
  * 
* Chebyshev Type-2 Filter
* Elliptic Filter

<img src="" width="35%"></br>
<img src="" width="35%"></br>
<img src="" width="35%"></br>
<img src="" width="35%"></br>
<img src="" width="35%"></br>
<img src="" width="35%"></br>
<img src="" width="35%"></br>
<img src="" width="35%"></br>

 
