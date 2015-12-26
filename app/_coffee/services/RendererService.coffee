#######################################################
#
# App Service
#
#######################################################

module.exports = [
  "$rootScope",
  ($rootScope)->

    class RendererService

      items: []

      constructor: ()->
        console.log "#### INIT RendererService"
        @init()

      init: ()=>
        interactive = true
        @stage = new PIXI.Stage(0x000000, interactive)
        @stage = new PIXI.Stage(0xFFFFFF, interactive)
        @renderer = PIXI.autoDetectRenderer(
          window.innerWidth * window.devicePixelRatio
          window.innerHeight * window.devicePixelRatio
          null
          true
        )
        document.querySelector(".canvas-container").appendChild @renderer.view
        requestAnimationFrame @animate


      animate: ()=>
        for item in @items
          item?.update()
        @renderer.render @stage
        requestAnimationFrame @animate

      register: ( item )=>
        @items.push item
        @stage.addChild item

      unregister: ( item )=>
        idx = @items.indexOf item
        if idx >= 0
          items.splice idx, 1

    window.RendererService = new RendererService()
]