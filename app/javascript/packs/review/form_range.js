const inputPriceElem = document.getElementById('price'); // input要素
const currentPriceElem = document.getElementById('current-price'); // 埋め込む先のspan要素
                    
// 現在の値をspanに埋め込む関数
const setCurrentPrice = (val) => {
    currentPriceElem.innerText = val;
}
                    
// inputイベント時に値をセットする関数
const rangeOnChange = (e) =>{
   setCurrentPrice(e.target.value);
}
    
inputPriceElem.addEventListener('input', rangeOnChange); 
    


//kここから下は評価
const inputRateElem = document.getElementById('rate'); // input要素
const currentRateElem = document.getElementById('current-rate'); // 埋め込む先のspan要素
                    
// 現在の値をspanに埋め込む関数
const setCurrentRate = (val) => {
    currentRateElem.innerText = val;
}
                    
// inputイベント時に値をセットする関数
const RateOnChange = (e) =>{
   setCurrentRate(e.target.value);
}
    
inputRateElem.addEventListener('input', RateOnChange); 

window.addEventListener('load', function(){
    setCurrentPrice(inputPriceElem.value); // ページ読み込み時に値をセット
});
    
window.addEventListener('load', function(){
    setCurrentRate(inputRateElem.value); // ページ読み込み時に値をセット
});