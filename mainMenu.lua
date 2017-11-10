local composer = require( "composer" )
 
local scene = composer.newScene()
 
-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
 local titleImage
 local listRecipesButton 
 local searchRecipesButton
 local bg

 local function listRecipes()
    composer.gotoScene( "listRecipes" )
 end

  local function searchRecipes()
    composer.gotoScene( "searchRecipes" )
 end


 
-- -----------------------------------------------------------------------------------
-- Scene event functions
-- -----------------------------------------------------------------------------------
 
-- create()
function scene:create( event )
 
    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    
    --Imagem Fundo
    bg = display.newImage( "background.jpg" )
    bg.x = display.contentCenterX
    bg.y = display.contentCenterY

    sceneGroup:insert(bg)

    --Nome, meter imagem
    titleImage = display.newText("Can I Cook It?", display.contentCenterX, 0,  native.systemFont, 50)
    sceneGroup:insert(titleImage)

    --Butao Listar Receitas

    listRecipesButton = display.newRect(display.contentWidth * 0.2, display.contentHeight * 0.9, display.contentWidth * 0.3, display.contentHeight * 0.1 )
    listRecipesButton:setFillColor(1,0,0)
    sceneGroup:insert(listRecipesButton)
    listRecipesButton:addEventListener( "tap", listRecipes )

    --Butao pesquisar Receitas

    searchRecipesButton = display.newRect(display.contentWidth * 0.8 , display.contentHeight * 0.9, display.contentWidth * 0.3, display.contentHeight * 0.1 )
    searchRecipesButton:setFillColor(0,0,1)
    sceneGroup:insert(searchRecipesButton)
    searchRecipesButton:addEventListener( "tap", searchRecipes )

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