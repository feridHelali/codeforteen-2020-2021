global={};

// validation helpers functions
global.helpers = function() {
  function isLessThan(str, size) {
    return str.length > size
      ? ""
      : `Size Error: ${str.length} doit etre > ${size}`;
  }

  function isGreaterThan(str, size) {
    return str.length < size
      ? ""
      : `Size Error : ${str.length} doit etre < ${size}`;
  }

  function isEmail(email) {
    return !(
      email.indexOf("@") <= 0 || email.lastIndexOf("@") !== email.indexOf("@")
    )
      ? ""
      : `Mismatch Error : @ est absente`;
  }

   function isNumber(str) {
    return !isNaN(str) ? "" : "Type Error: doit etre numérique";
  }

 function isContainingDot(str) {
    return str.indexOf(".") > -1
      ? ""
      : `Mismatch Error : ce champ ne contient pas . `;
  }

function isContainingSemiColumn(str) {
    return str.indexOf(";") > -1
      ? ``
      : `Mismatch Error :ce champ le contient avoir  ; `;
  }

  return ({
    isLessThan:isLessThan,
    isGreaterThan:isGreaterThan,
    isEmail:isEmail,
    isNumber:isNumber,
    isContainingDot:isContainingDot,
    isContainingSemiColumn:isContainingSemiColumn 
  })
};
