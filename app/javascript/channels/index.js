// Load all the channels within this directory and all subdirectories.
// Channel files must be named *_channel.js.

// const channels = require.context('.', true, /_channel\.js$/)
// channels.keys().forEach(channels)

window.addEventListener('DOMContentLoaded', () => {

  const priceInput = document.getElementById('item-price'); //価格のid
  const aa = document.getElementById('add-tax-price'); //手数料のid
  const bb = document.getElementById('profit'); //販売利益のid
  
    //③価格のフォームに入力したあとにイベントを発火
  priceInput.addEventListener("input", function() {
    // 販売価格の入力欄に入力すると動きます
    const amount = this.value;
    

    let tax = Math.ceil(amount * 0.1);
    // 販売手数料は10%としています。またMath.ceilメソッドで1円単位に切り上げています。
    // 計算結果を変数「tax」に代入
    let profit = Math.floor(amount * 0.9);
    
    
  aa.innerHTML = tax;
  bb.innerHTML = profit;

  });


});
//const aaa =  document.getElementById('item-price');

// // 販売価格が入力されたら、販売手数料と販売利益を計算してくれます
// $(function(){
//   $( document ).on( 'keyup', 'item-price', function(){ 
//     // 販売価格の入力欄に入力すると動きます
//     let amount = $( this ).val();
//     console.log(amount)
//     // 販売価格の入力欄に入力された値を変数「amount」に代入
//     let tax = Math.ceil(amount * 0.1);
//     // 販売手数料は10%としています。またMath.ceilメソッドで1円単位に切り上げています。
//     // 計算結果を変数「tax」に代入
//     let profit = Math.floor(amount * 0.9);
//     // 利益は残りの金額。Math.floorメソッドで、1円単位で切り捨てておけば「販売価格 = 販売手数料 + 販売利益」が成り立ちます。
//     // 計算結果は変数「profit」に代入。
//     $('ここに販売手数料の欄のclassもしくはid名').html(tax);
//     // htmlメソッドを使って販売手数料の欄を丸ごと書き換えます。
//     $('ここに販売利益の欄のclassもしくはid名').html(profit);
//     // 同じように販売利益の欄も書き換えます。
//   });
//  });