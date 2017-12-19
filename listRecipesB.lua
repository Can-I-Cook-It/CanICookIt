local composer = require( "composer" )
local widget = require( "widget" )
local sqlite3 = require "sqlite3"
local path = system.pathForFile( "/db/CICI", system.ResourceDirectory )
local db = sqlite3.open(path)

local scene = composer.newScene()
local ingredients = composer.getVariable( "ingredients" )

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
local tableView

function nothing()
	print("OLA")
	-- body
end

function scene:create( event )

    local sceneGroup = self.view
    -- Code here runs when the scene is first created but has not yet appeared on screen
    --Imagem Fundo
    bg = display.newImage( "background.jpg" )
    bg.x = display.contentCenterX
    bg.y = display.contentCenterY
    sceneGroup:insert(bg)

    --Listar as receitas
    tableView = widget.newTableView(
    {
        left = 0,
        top = 0,
        height = display.contentHeight,
        width = display.contentWidth,
        onRowRender = onRowRender,
        onRowTouch = onRowTouch,
        listener = tableViewListener
    }
)
sceneGroup:insert(tableView)

searchRecipesButton = display.newRect(display.contentWidth * 0.8 , display.contentHeight * 0.9, display.contentWidth * 0.3, display.contentHeight * 0.1 )
searchRecipesButton:setFillColor(0,0,1)
sceneGroup:insert(searchRecipesButton)
searchRecipesButton:addEventListener( "tap", nothing)


	table.foreach(ingredients, function(key, value)
		tableView:insertRow{
			params = {
				name = value
			}
		}
	end)

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
