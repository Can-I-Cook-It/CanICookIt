local composer = require( "composer" )
local widget = require("widget")

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------




-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------

-- create()
function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen


    --cria uma vista de scroll
    local scrollView = widget.newScrollView
{
    top = 0,
    left = 0,
    width = display.contentWidth,
    height = display.contentHeight,
    scrollWidth = display.contentWidth,
    horizontalScrollDisabled = true,
    listener = scrollListener
}

    --Imagem Fundo
    local bg = display.newImage( "background.jpg" )
    bg.x = display.contentCenterX
    bg.y = display.contentCenterY
    scrollView:insert(bg)

    --Imagem receita
    local recipeImage = display.newImageRect("db/images/1.jpg", 200,200)
    recipeImage.x = display.contentCenterX
    recipeImage.y = 135
    scrollView:insert(recipeImage)

    --Titulo Receita
    local titleOptions = {
       text = "Bacalhau à Braz",
       x = display.contentCenterX,
       y = 15,
       font = native.systemFontBold,
       fontSize = 24,
    }
    local titleBox = display.newText( titleOptions )
    titleBox:setFillColor( 0, 1, 0 )
    scrollView:insert(titleBox)

    ---Ingredientes
    local ingredientTitleBox = display.newText("Ingredientes", 80, 250, native.systemFontBold, 20 )
    scrollView:insert(ingredientTitleBox)

    local ingredientListBox =  display.newText("600g bacalhau demolhado \n 1 kg batatas", 130, 280, native.systemFont, 18 )
    scrollView:insert(ingredientListBox)

    local preparationTitleBox = display.newText("Preparação", 80, 320, native.systemFontBold, 20 )
    scrollView:insert(preparationTitleBox)

    --local preparationListBox =  display.newText("Escalde o bacalhau, tire-lhe a pele e as espinhas.", 130, 280, native.systemFont, 18 )
    --scrollView:insert(preparationListBox)


    sceneGroup:insert(scrollView)
end


-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)

    elseif ( phase == "did" ) then
        -- Code here runs when the scene is entirely on screen

    end
end


-- hide()
function scene:hide( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is on screen (but is about to go off screen)

    elseif ( phase == "did" ) then
        -- Code here runs immediately after the scene goes entirely off screen

    end
end


-- destroy()
function scene:destroy( event )

    local sceneGroup = self.view
    -- Code here runs prior to the removal of scene's view

end


-- -----------------------------------------------------------------------------------
-- Scene event function listeners
-- -----------------------------------------------------------------------------------
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
scene:addEventListener( "destroy", scene )
-- -----------------------------------------------------------------------------------

return scene
