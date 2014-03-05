module.exports =
  activate: (state) ->
    atom.workspaceView.command "toggle-tabs:toggle", => @toggle()

  toggle: ->
    atom.workspaceView.find('.tab-bar').slideToggle(150)
