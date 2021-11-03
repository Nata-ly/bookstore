booksCategoryList = (->
  result = []
  for stdin, category  of window.books_store_config.book_categories
    result.push(category_id: category.id, category: category.category)
  result)()

Ext.define "BS.store.BooksCategory",
  extend: "Ext.data.Store"
  model: "BS.model.BooksCategory"
  data: booksCategoryList
