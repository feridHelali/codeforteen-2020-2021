var products = [
  {label:'chocotom',price:1.2,stock:50,family:'Cookies'},
  {label:'smile',price:1.5,stock:30,family:'Cookies'},
  {label:'Sicam 1kg',price:3.3,stock:40,family:'conserve'},
  {label:'pear jam',price:2.8,stock:30,family:'conserve'},
  {label:'safia 1.5L',price:0.8,stock:60,family:'water'}
];

const labelToUpperCase= e =>{
  let {...tmp}=e; 
  tmp.label=e.label.toUpperCase();
  return tmp;
}
const familyToUpperCase= e =>{
  let {...tmp}=e; 
  tmp.family=e.family.toUpperCase();
  return tmp;
}
const stockLessThan40= e=>{
  if (e.stock<40) return true;
}


products    
  .map(labelToUpperCase)
  .map(familyToUpperCase)
  .filter(stockLessThan40)