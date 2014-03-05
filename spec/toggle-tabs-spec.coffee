{WorkspaceView} = require 'atom'
ToggleTabs = require '../lib/toggle-tabs'

describe "ToggleTabs", ->
  activationPromise = null

  beforeEach ->
    atom.workspaceView = new WorkspaceView

    waitsForPromise ->
      atom.packages.activatePackage("toggle-tabs")

    editor = atom.workspaceView.getActiveView().getEditor()

  describe "when the toggle-tabs:toggle event is triggered", ->
    it "shows and hides the .tab-bar", ->
      expect(atom.workspaceView.find('.tab-bar:visible').count()).toBe(1)
        atom.workspaceView.trigger 'toggle-tabs:toggle'
      expect(atom.workspaceView.find('.tab-bar:visible').count()).toBe(0)
        atom.workspaceView.trigger 'toggle-tabs:toggle'
      expect(atom.workspaceView.find('.tab-bar:visible').count()).toBe(1)
  
