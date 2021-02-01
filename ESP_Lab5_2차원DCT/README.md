# **Lab5 - 2-Dimension Discrete Cosine Transformation(DCT)**
## **Code**
* Load Image Function
  * [myfun_LoadImage.m](https://github.com/KeunJuSong/Embedded-Signal-Processing-with-MATLAB/blob/master/ESP_Lab5_2%EC%B0%A8%EC%9B%90DCT/myfun_LoadImage.m)
* Practical exercise using DCT
  * [DCT.m](https://github.com/KeunJuSong/Embedded-Signal-Processing-with-MATLAB/blob/master/ESP_Lab5_2%EC%B0%A8%EC%9B%90DCT/DCT.m)
## **Description**
### **2-D Discrete Fourier Transform**
* Image Data can be expressed in 2 dimension pixel. (Video can be expressed in 3 dimension because of time domain.)
* Forward 2-Dimension DFT</br></br>
<img src="https://user-images.githubusercontent.com/48046183/106433230-3ff6e200-64b3-11eb-92dc-ee6fecea5cdc.png" width="40%"></br>
* Inverse 2-Dimension DFT</br></br>
<img src="https://user-images.githubusercontent.com/48046183/106433310-61f06480-64b3-11eb-9cd2-6b11588a4932.png" width="40%"></br>
* Using 2-Dimension DFT, we can do image processing in spectrum.

### **Discrete Cosine Transform (DCT)**
* DCT is mainly used for Audio & Image loss compression.
* DCT is simillar with DFT, but it is only consisted of real-numbers.
* Because of Cosine even function properites, DCT can be expressed DFR of double-length  
* **Type-2 DCT**
  * Forward</br></br>
  <img src="https://user-images.githubusercontent.com/48046183/106434233-9dd7f980-64b4-11eb-9655-a0962cb43f06.png" width="35%"></br>
  <img src="https://user-images.githubusercontent.com/48046183/106434260-a4ff0780-64b4-11eb-8648-130755ea82ae.png" width="30%"></br>
  * Inverse</br></br>
  <img src="https://user-images.githubusercontent.com/48046183/106434423-de377780-64b4-11eb-9b1e-2075d9528f6c.png" width="35%"></br>
  
### **2-D Discrete Cosine Transform (2D-DCT)**
* Type-2 DCT in 2 Dimension
* Forward</br></br>
<img src="https://user-images.githubusercontent.com/48046183/106434660-340c1f80-64b5-11eb-9224-842f3561064b.png" width="55%"></br>
<img src="https://user-images.githubusercontent.com/48046183/106434722-44bc9580-64b5-11eb-8eb2-3143434520c5.png" width="25%"></br>
* Inverse</br></br>
<img src="https://user-images.githubusercontent.com/48046183/106434843-6b7acc00-64b5-11eb-9d26-1aca126d4929.png" width="55%"></br>

### **Image Compression using DCT**
* Example) Lenna image (Use Lenna [File](https://github.com/KeunJuSong/Embedded-Signal-Processing-with-MATLAB/blob/master/ESP_Lab5_2%EC%B0%A8%EC%9B%90DCT/lena.raw) in MATLAB)
  * 256x256, 8 bits resolution</br></br>
  <img src="https://user-images.githubusercontent.com/48046183/106465755-c1636a00-64dd-11eb-816e-a684b9d7f33d.png" width="40%"></br>
* 2-D DCT magnitude of Lenna image
  * 0~255 range of the value, 0 → Black 255 → White
  * Top-Left → Low frequency, Top-Right → High frequency</br></br> 
  <img src="https://user-images.githubusercontent.com/48046183/106468889-db9f4700-64e1-11eb-9031-9f3423503c49.png" width="40%"></br>
* From magnitude of Lenna image, we know that high frequency area is 0.
* **Compression Idea** : Don't need to save 0 → Setting threshold value to make 0
* **Image loss**
  * Setting proper threshold value is important to increase compression ratio at the same time. 
* Representative method : **JPEG Compression method** → See more information to understand DCT! 
