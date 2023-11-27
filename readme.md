> # Data augmentation for SSVEPs using Multi-Stimulus SAME (msSAME)

## Multi-Stimulus SAME (msSAME) based on paper [1]_.

Source aliasing matrix estimation (SAME) is a data augmentation method that can generate EEG trials with the SSVEP feature [2]. Recently, we proposed an extended version of SAME, namely multi-stimulus SAME (msSAME) [1]. 

The msSAME exploits the similarity of the aliasing matrix across frequencies to enhance the performance of SSVEP-BCI with insufficient calibration data. It is an extension of the multi-stimulus schema applied to the source aliasing matrix [3].

The proposed method was performed on two state-of-the-art SSVEP recognition methods (i.e. eTRCA [4], TDCA [5]).  We compared the classification performance under three conditions: without data augmentation, with SAME (w/SAME), and with msSAME (w/msSAME). In this repository, we provide demo code for the use of msSAME.

> [1] Luo, R., Xiao, X., Chen, E., Meng, L., Jung, T.-P., Xu, M., & Ming, D. (2023). Almost free of calibration for ssvep-based brain-computer interfaces. Journal of Neural Engineering, 20(6). https://doi.org/10.1088/1741-2552/ad0b8f 
>
> [2] Luo, R., Xu, M., Zhou, X., Xiao, X., Jung, T. P., & Ming, D. (2023, Jun). Data augmentation of ssveps using source aliasing matrix estimation for brain-computer interfaces. IEEE Trans Biomed Eng, 70(6), 1775-1785. https://doi.org/10.1109/TBME.2022.3227036 
>
> [3] Wong, C. M., Wan, F., Wang, B., Wang, Z., Nan, W., Lao, K. F., Mak, P. U., Vai, M. I., & Rosa, A. (2020, Jan 6). Learning across multi-stimulus enhances target recognition methods in ssvep-based bcis. J Neural Eng, 17(1), 016026. https://doi.org/10.1088/1741-2552/ab2373 
>
> [4] Nakanishi, M., Wang, Y., Chen, X., Wang, Y. T., Gao, X., & Jung, T. P. (2018, Jan). Enhancing detection of ssveps for a high-speed brain speller using task-related component analysis. IEEE Trans Biomed Eng, 65(1), 104-112. https://doi.org/10.1109/TBME.2017.2694818 
>
> [5] Liu, B., Chen, X., Shi, N., Wang, Y., Gao, S., & Gao, X. (2021). Improving the performance of individually calibrated ssvep-bci by task- discriminant component analysis. IEEE Trans Neural Syst Rehabil Eng, 29, 1998-2007. https://doi.org/10.1109/TNSRE.2021.3114340 

## Dataset

#### Benchmark dataset [6]_.

> [6] Wang, Y., Chen, X., Gao, X., & Gao, S. (2017, Oct). A benchmark dataset for ssvep-based brain-computer interfaces. IEEE Trans Neural Syst Rehabil Eng, 25(10), 1746-1752. https://doi.org/10.1109/TNSRE.2016.2627556 

#### BETA dataset [7]_.

> [7] Liu, B., Huang, X., Wang, Y., Chen, X., & Gao, X. (2020). Beta: A large benchmark database toward ssvep-bci application. Front Neurosci, 14, 627. https://doi.org/10.3389/fnins.2020.00627.

After downloading the dataset, we renamed S1,...S9 to S01,...S09 according to our personal habits. If you don't want to do that, you can change the variables *subject_id*.

## Results  

- #### draw_SAM_fig 

This folder shows plotting the source aliasing matrices (SAM) of different subjects at different frequencies, to explore the similarity of SAM for neighbouring frequencies. Here, we provide the SAM that has been calculated and the classes have been sorted in ascending order of frequency.

Note that the reference signals need to be modified by the pre-defined phases when calculating the SAM. 

- #### demo-msSAME-Benchmark.ipynb 

This file is used to calculate the accuracy when the time window is 0.5 s for the Benchmark dataset. The average accuracy across all subjects with different training trials (Nt) is listed as below:

Table 1. The  results for Benchmark dataset when Tw = 0.5 s

|                     | Nt=1      | Nt=2      | Nt=3      | Nt=4      | Nt=5      |
| ------------------- | --------- | --------- | --------- | --------- | --------- |
| eTRCA               | 0.100     | 0.576     | 0.699     | 0.759     | 0.793     |
| eTRCA(w/SAME)       | 0.601     | 0.740     | 0.795     | 0.822     | 0.842     |
| **eTRCA(w/msSAME)** | **0.717** | **0.779** | **0.808** | **0.824** | **0.835** |
| TDCA                | 0.168     | 0.741     | 0.808     | 0.840     | 0.857     |
| TDCA(w/SAME)        | 0.649     | 0.779     | 0.825     | 0.851     | 0.864     |
| **TDCA(w/msSAME)**  | **0.769** | **0.828** | **0.854** | **0.869** | **0.875** |

- #### demo-msSAME-BETA.ipynb 

This file is used to calculate the accuracy when the time window is 0.5 s for the BETA dataset. The average accuracy across all subjects with different training trials (Nt) is listed as below:

Table 2. The  results for BETA dataset when Tw = 0.5 s

|                     | Nt=1      | Nt=2      | Nt=3      |
| ------------------- | --------- | --------- | --------- |
| eTRCA               | 0.120     | 0.521     | 0.609     |
| eTRCA(w/SAME)       | 0.521     | 0.625     | 0.678     |
| **eTRCA(w/msSAME)** | **0.624** | **0.688** | **0.712** |
| TDCA                | 0.184     | 0.608     | 0.683     |
| TDCA(w/SAME)        | 0.526     | 0.635     | 0.696     |
| **TDCA(w/msSAME)**  | **0.672** | **0.731** | **0.758** |

The original accuracy of eTRCA and TDCA obtained by our code is similar to the results in the paper [5].

We used a device with 12 vCPUs to compute the classification results for different subjects in parallel. If you do not have such a configuration, running this code may be a bit slower.

## Other version

The msSAME method has been compatible with the open-source BCI software platform MetaBCI, which can be found on the following web page:

[MetaBCI/demos/msSAME_eTRCA.py at master · TBC-TJU/MetaBCI (github.com)](https://github.com/TBC-TJU/MetaBCI/blob/master/demos/msSAME_eTRCA.py)

[MetaBCI/demos/msSAME_TDCA.py at master · TBC-TJU/MetaBCI (github.com)](https://github.com/TBC-TJU/MetaBCI/blob/master/demos/msSAME_TDCA.py)

## Acknowledgement

Thanks to anyone who helped and encouraged me. 

## email

email: ruixin_luo@tju.edu.cn

