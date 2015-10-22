// Set up the name of the app ['name'] and the icon to be displayed ['icon']
const Map app = const {'pages': appPages};

// Set up the list of pages to be displayed, as a map
// ['name', 'icon', {'isDefault'}]
const List<Map> appPages = const [
  const {'name': 'one', 'isDefault': true},
  const {'name': 'two'},
  const {'name': 'tree'}];