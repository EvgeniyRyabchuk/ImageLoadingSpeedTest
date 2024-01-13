

"./images/nature_tiny_ver_1.png"
"./images/nature_small_ver_1.png"
"./images/travel_small_hor_1.png"
"./images/text_ver_1.png"
"./images/animal_sq_1.png"
"./images/food_ver_1.png"
"./images/people_nature_1_ver.png"
"./images/nature_hor_2.png"

const imageCount = 7;

const pathGenerator = (count, text, ext, basename) => {
    const paths = []; 
    for(let i = count; i > 0; i--) {
        paths.push(`${basename}/res_${text}_${i}.${ext}`)
    }
    return paths; 
}

const imageTypes = [
    {
        name: 'jpeg2000',
        text: "jpeg",
        ext: 'jpg'
    },
    {
        name: 'libjpegturbo',
        text: "jpeg_turbo",
        ext: 'jpg'
    },
    {
        name: 'mozjpeg',
        text: "jpegMOZ", 
        ext: 'jpg'
    },
    {
        name: 'guetzli',
        text: "jpegGUETZLI",
        ext: 'jpg'
    },
    {
        name: 'webp',
        text: "webp",
        ext: 'webp'
    },
    {
        name: 'avif',
        text: "avif",
        ext: 'avif',
    },
    {
        name: 'flif',
        text: "flif",
        ext: 'flif'
    },
    {
        name: 'jpegxl',
        text: "jxl",
        ext: 'jxl'
    },
    {
        name: 'bpg',
        text: "bpg",
        ext: 'bpg'
    }
];


const imageType = imageTypes.find(it => it.name === selectedType); 

const imagePahtList = pathGenerator(imageCount, imageType.text, imageType.ext, "../images");

console.log(imagePahtList);

const imageContainer = document.querySelector('.image_container');

// if(imageType.ext === "bpg") || imageType.ext === "flif" || imageType.ext === "jxl") {
//     for(let path of imagePahtList) {
//         imageContainer.innerHTML += 
//         `<img src=\"${path}\">`
//     }
// }

for(let path of imagePahtList) {
    if(imageType.ext === "bpg" || imageType.ext === "jxl" || imageType.ext === "jpg") {
        imageContainer.innerHTML += `<img src=\"${path}\">`; 
    } else if(imageType.ext === "flif") {
        imageContainer.innerHTML += `<canvas data-polyflif-src=\"${path}\"></canvas>`; 
    }
    else if(imageType.ext === "avif" || imageType.ext === "webp") {
        const pngPath = path.replace(`.${imageType.ext}`, "")+".png"
        console.log(pngPath); 
        const htmlText =  
        "<picture>"+
            `<source srcset=\"${path}\" type=\"image/${imageType.ext}\">`+
            `<img src=\"${pngPath}\">`+ 
        "</picture>"
        imageContainer.innerHTML += htmlText; 
    }
      
    // for(let path of imagePahtList) {
    //     const imageTag = document.createElement("img");
    //     imageTag.setAttribute("src", path); 
    //     imageContainer.appendChild(imageTag); 
    // } 
}




console.log(imageContainer);



console.log("Time until DOMready: ", Date.now()-timerStart);

window.onload = function () {
    console.log("Time until everything loaded: ", Date.now()-timerStart);
};