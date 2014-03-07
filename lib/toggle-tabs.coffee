tabsVisible = true
module.exports =
  configDefaults:
    rememberState: false

  activate: (state) ->
    if atom.config.get('toggle-tabs.rememberState')
      tabsVisible = state.toggleTabState

    atom.workspaceView.ready ->
      atom.workspaceView.find('.tab-bar').toggle(tabsVisible)

    atom.workspaceView.command "toggle-tabs:toggle", => @toggle()

    # atom.config.observe 'toggle-tabs.hideTabs', =>
    #   tabsShouldBeHidden = atom.config.get('toggle-tabs.hideTabs')
    #   if tabsShouldBeHidden
    #     atom.workspaceView.find('.tab-bar').hide(150)
    #     toggleTabState = false
    #   else
    #     atom.workspaceView.find('.tab-bar').show(150)
    #     toggleTabState = true

  serialize: ->
    {toggleTabState: tabsVisible}

  toggle: ->
    tabsVisible = !tabsVisible
    atom.workspaceView.find('.tab-bar').slideToggle(150)
