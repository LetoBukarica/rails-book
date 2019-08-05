App.products = App.cable.subscriptions.create "ProductsChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    document.getElementsByTagName("main")[0].innerHTML = data.html
    console.log ("PRODUCT "+ data.product_id)
    document.getElementById('product_' + data.product_id).className = 'product-highlight'
