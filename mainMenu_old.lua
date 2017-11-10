local composer = require( "composer" )
local widget = require "widget"
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
 
end
 
 
-- show()
function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then
        -- Code here runs when the scene is still off screen (but is about to come on screen)
        --Botao listar receitas
        local listRecipes = function (event )
        if event.phase == "ended" then
        print( "You pressed and released the "..event.target.id.." button!" )
        composer.gotoScene( "listRecipes", { effect = "fade", time = 300 } )
    end
end

local listRecipes=widget.newButton{
        --The id can be used to tell you what button was pressed in your button event
        id = "listRecipes",
        --This is the text label to put on the button
        label = "Listar Receitas",
        --This is the start x coordinate of the Top Left Corner
        left=50,
        --This is the start y coordinate of the Top Left Corner
        top=150,
        --Emboss can be true or false, tells it to make the label look embossed/inset
        emboss=true,
        --The border around the outside of the button
        strokeWidth=4,
        --How round to make the corners
        cornerRadius=8,
    --this tells it what function to call when you press the button
    onEvent = listRecipes
}
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