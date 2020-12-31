const inputElem = document.getElementById('parking-number'); // input要素
const currentValueElem = document.getElementById('current-value'); // 埋め込む先のspan要素
                    
// 現在の値をspanに埋め込む関数
const setCurrentValue = (val) => {
    currentValueElem.innerText = val;
}
                    
// inputイベント時に値をセットする関数
const rangeOnChange = (e) =>{
    setCurrentValue(e.target.value);
}
    
inputElem.addEventListener('input', rangeOnChange); 
    
window.onload = () => {
    setCurrentValue(inputElem.value); // ページ読み込み時に値をセット
}
