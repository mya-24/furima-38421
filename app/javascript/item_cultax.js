window.addEventListener('load', () =>{
  const price = document.getElementById("item-price");
  price.addEventListener("input", () => {
    const inpPrice = price.value;
    const taxPrice = Math.floor(inpPrice * 0.1);
    const sumPrice = Math.floor(inpPrice - taxPrice);
    
    posTax = document.getElementById("add-tax-price");
    posTax.innerHTML = taxPrice.toLocaleString();

    posTax = document.getElementById("profit");
    posTax.innerHTML = sumPrice.toLocaleString();

  });
});

