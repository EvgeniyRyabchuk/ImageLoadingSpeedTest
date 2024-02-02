
import numpy as np
import cv2
import sys
import image_similarity_measures
from image_similarity_measures.quality_metrics import fsim as ism_fsim, sre as ism_sre
from sewar.full_ref import mse, rmse, psnr, uqi, ssim, ergas, scc, rase, sam, ssim, vifp, psnrb, rmse_sw, msssim 

args = sys.argv

path1=args[1]
path2=args[2]

in_img1 = cv2.imread(path1)
in_img2 = cv2.imread(path2)

# in_img1 = cv2.imread('../shared/images/nature_tiny_ver_1.png')
# in_img2 = cv2.imread('./result/res_webp_1.png')

ism_out_fsim = ism_fsim(in_img1, in_img2) 
ism_out_sre = ism_sre(in_img1, in_img2) 



ssim_arr = str(ssim(in_img1,in_img2)).split(",")
ssim_parsed = ssim_arr[0].replace("(", "");

print(ssim_parsed, psnr(in_img1,in_img2), mse(in_img1,in_img2), rmse(in_img1,in_img2),
      uqi(in_img1,in_img2), ergas(in_img1,in_img2), scc(in_img1,in_img2), rase(in_img1,in_img2),
      sam(in_img1,in_img2), vifp(in_img1,in_img2), psnrb(in_img1,in_img2),
      ism_out_fsim, ism_out_sre 
)



# print("Package 2 Merics: sewar")
# print("SSIM: ", ssim(in_img1,in_img2)) 
# print("PSNR: ", psnr(in_img1,in_img2))
# print("MSE: ", mse(in_img1,in_img2))
# print("RMSE: ", rmse(in_img1,in_img2)) 
# print("UQI: ", uqi(in_img1,in_img2))
# print("ERGAS: ", ergas(in_img1,in_img2))
# print("SCC: ", scc(in_img1,in_img2))
# print("RASE: ", rase(in_img1,in_img2))
# print("SAM: ", sam(in_img1,in_img2))
# print("VIFP: ", vifp(in_img1,in_img2))
# print("psnrb: ", psnrb(in_img1,in_img2))
# print("rmse_sw: ", rmse_sw(in_img1,in_img2))
# print("msssim: ", msssim(in_img1,in_img2))

# print("=======================================")


# print("Package 1 Merics: image_similarity_measures")


# print("fsim: ", ism_out_fsim) 
# print("sre: ", ism_out_sre) 



# psnr = cv2.PSNR(in_img1,in_img2)
# print("psnr: ", psnr)
