var TypesVente = ["Sur place", "Vente en ligne"];

Map createCheckbox(table) {
  var formCreation = {};
  for (var i = 0; i < table.length; i++) {
    formCreation[i] = false;
  }

  return formCreation;
}
