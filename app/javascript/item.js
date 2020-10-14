function calculation() {
  const priceEv = document.getElementById("item-price");
  priceEv.addEventListener('input', function(){
    let price = document.getElementById("item-price").value;
    let tax = document.getElementById("add-tax-price");
    let profit = document.getElementById("profit");
    let taxCal = parseInt(price, 10) * 10 / 100;
    let profitCal = parseInt(price, 10) - taxCal;
    tax.innerHTML = taxCal;
    profit.innerHTML = profitCal;
  })
  window.name = "";
}
window.addEventListener('load', calculation)
if (window.name != "reload")
{
  location.reload();
  window.name = "reload";
}