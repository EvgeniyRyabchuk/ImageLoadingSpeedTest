
#!/bin/bash

START=$(($(date +%s%N)/1000000))
# avifenc -c aom -y 420 --min 0 --max 63 -s 5 -j 4 -a end-usage=q -a tune=ssim -a cq-level=10 ./IMG_20210912_131119.png ./IMG_20210912_131119_AVIF.avif
a=$($1)
END=$(($(date +%s%N)/1000000)) 
RES_AVIF_ENC_TIME=$(($END-$START))
echo $RES_AVIF_ENC_TIME 
