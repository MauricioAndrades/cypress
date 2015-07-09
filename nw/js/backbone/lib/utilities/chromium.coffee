@App.module "Utilities", (Utilities, App, Backbone, Marionette, $, _) ->

  windows = {}

  API =
    startChromium: (src) ->
      if win = windows.chromium
        win.close(true)

      if not src
        throw new Error("Missing src for tests to run. Cannot start Chromium.")

      windows.chromium = App.request "gui:open", src, {
        show: false
        position: "center"
        width: 1024
        width: 768
        title: "Running Tests"
      }

  App.commands.setHandler "start:chromium:run", (src) ->
    API.startChromium(src)