# sAPI-swift


```swift
// Create an instance of the MeshokAPI class with your API token
let api = MeshokAPI(token: "YOUR_API_TOKEN")

// Get the list of items
if let itemList = api.getItemList() {
    print(itemList)
}

// Get the list of finished items
if let finishedItemList = api.getFinishedItemList() {
    print(finishedItemList)
}

// Get the list of unsold finished items
if let unsoldFinishedItemList = api.getUnsoldFinishedItemList() {
    print(unsoldFinishedItemList)
}

// Get the list of sold finished items
if let soldFinishedItemList = api.getSoldFinishedItemList() {
    print(soldFinishedItemList)
}

// Get information about a specific item
if let itemInfo = api.getItemInfo(id: "ITEM_ID") {
    print(itemInfo)
}

// Get account information
if let accountInfo = api.getAccountInfo() {
    print(accountInfo)
}

// Get the list of common descriptions
if let commonDescriptionList = api.getCommonDescriptionList() {
    print(commonDescriptionList)
}

// Get subcategory information
if let subCategoryInfo = api.getSubCategory(id: "SUBCATEGORY_ID") {
    print(subCategoryInfo)
}

// Get category information
if let categoryInfo = api.getCategoryInfo(id: "CATEGORY_ID") {
    print(categoryInfo)
}

// Get the list of currencies
if let currencyList = api.getCurencyList() {
    print(currencyList)
}

// Get the list of countries
if let countryList = api.getCountryList() {
    print(countryList)
}

// Get the list of cities for a specific country
if let citiesList = api.getCitiesList(id: "COUNTRY_ID") {
    print(citiesList)
}

// Stop the sale of an item
if let stopSaleResponse = api.stopSale(id: "ITEM_ID") {
    print(stopSaleResponse)
}

// Relist an item
if let relistItemResponse = api.relistItem(id: "ITEM_ID") {
    print(relistItemResponse)
}

// Delete an item
if let deleteItemResponse = api.deleteItem(id: "ITEM_ID") {
    print(deleteItemResponse)
}

// List an item
let params: [String: Any] = [
    "name": "Item Title",
    "description": "Item Description",
    // Add other required parameters
]
if let listItemResponse = api.listItem(params: params) {
    print(listItemResponse)
}

// Update an item
let updateParams: [String: Any] = [
    "id": "ITEM_ID",
    "name": "Updated Item Title",
    "description": "Updated Item Description",
    // Add other parameters to update
]
if let updateItemResponse = api.updateItem(params: updateParams) {
    print(updateItemResponse)
}
```

These examples demonstrate how to use the MeshokAPI Swift library to interact with the Meshok API endpoints. You can customize the parameters based on your specific needs.
