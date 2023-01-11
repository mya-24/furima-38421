const pay = () => {
  // PAY.JPテスト公開鍵
  const payjp = Payjp(process.env.PAYJP_PUBLIC_KEY);

  //elementsインスタンスを生成
  const elements = payjp.elements();

  //入力欄ごとにelementインスタンスを生成
  const numberElement = elements.create('cardNumber', {placeholder: 'カード番号(半角英数字)'} )
  const cvcElement = elements.create('cardCvc', {placeholder: 'カード背面4桁もしくは3桁の番号'} )
  const expElement = elements.create('cardExpiry', {placeholder: '例)3/23'} )

  //入力欄をDOM上に表示
  numberElement.mount('#card-number')
  cvcElement.mount('#card-cvc')
  expElement.mount('#card-exp-date')

  //フォームの要素を取得
  const formResult = document.getElementById("charge-form");

  //PAY.JPと通信が成功した場合のみトークンをフォームに埋め込む
  formResult.addEventListener("submit", (e) => {
    e.preventDefault();
    payjp.createToken(expElement).then((response) => {
      if (response.error) {
      } else {
        const token = response.id;
        const renderDom = document.getElementById("charge-form"); 
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }
      document.getElementById("charge-form").submit();
      });
    });
  };

window.addEventListener("load", pay);