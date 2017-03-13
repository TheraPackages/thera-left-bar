{CompositeDisposable} = require 'atom'


module.exports =
class LeftBarView
  constructor: (serializedState) ->

    # Create root element
    @element = document.createElement('div')
    @element.classList.add('left-bar-view')

    # Create message element
    message = document.createElement('div')

    li4Item = document.createElement('li')
    li4Item.classList.add('fa','fa-bar-chart','li4Left')

    message.textContent = "THE CHART OF PERFORMANCE"
    message.classList.add("shuli")

    subscriptions = new CompositeDisposable
    subscriptions.add atom.tooltips.add(message, {title: 'Need running virtual machine and look up real performance'})

    # left bar item onclick event!
    message.onclick = (id) ->
      atom.commands.dispatch(atom.views.getView(atom.workspace), "chart-d3:toggle");
      #atom.workspaceView.trigger("chart-d3:toggle")


    message.appendChild(li4Item)
    @element.appendChild(message)




  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()
    subscriptions.dispose()

  getElement: ->
    @element
