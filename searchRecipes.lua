local composer = require( "composer" )
local widget = require( "widget" )
local sqlite3 = require "sqlite3"
local path = system.pathForFile( "/db/CICI", system.ResourceDirectory )
local db = sqlite3.open(path)

local scene = composer.newScene()

-- -----------------------------------------------------------------------------------
-- Code outside of the scene event functions below will only be executed ONCE unless
-- the scene is removed entirely (not recycled) via "composer.removeScene()"
-- -----------------------------------------------------------------------------------
local tableView
local ingredients = {}

local function searchRecipes()
    composer.setVariable("ingredients", ingredients)
    composer.gotoScene("listRecipesB")
end

function print_r(arr, indentLevel) --para "printar" os elementos de um array (table)
    local str = ""
    local indentStr = "#"

    if(indentLevel == nil) then
        print(print_r(arr, 0))
        return
    end

    for i = 0, indentLevel do
        indentStr = indentStr.."\t"
    end

    for index,value in pairs(arr) do
        if type(value) == "table" then
            str = str..indentStr..index..": \n"..print_r(value, (indentLevel + 1))
        else 
            str = str..indentStr..index..": "..value.."\n"
        end
    end
    return str
end 


local function onSwitchPress( event )
    local switch = event.target
    local thisRow = tableView:getRowAtIndex( switch.rowID )
    print(tableView:getRowAtIndex(switch.rowID).params.name)
    


    if switch.isOn == false then
        thisRow.params.isSwitchOn = false
        table.remove(ingredients, 1)
    else
        thisRow.params.isSwitchOn = true
        table.insert(ingredients, tableView:getRowAtIndex(switch.rowID).params.name)
    end

    -- print (thisRow.params.isSwitchOn)
  end



local function onRowRender( event )

    -- Get reference to the row group
    local row = event.row
    local params = event.row.params

    -- Cache the row "contentWidth" and "contentHeight" because the row bounds can change as children objects are added
    local rowHeight = row.contentHeight
    local rowWidth = row.contentWidth

    -- create checkbox
    local checkboxButton = widget.newSwitch(
    {
        style = "checkbox",
        id = "Checkbox",
        onPress = onSwitchPress
    }
    )
    checkboxButton.anchorX = 0
    checkboxButton.x = 0
    checkboxButton.y = rowHeight * 0.5



    --estado botao
    checkboxButton.rowID = row.id
    checkboxButton.isOn = row.params.isSwitchOn

    if ( row.params.isSwitchOn == true ) then
      checkboxButton:setState( { isOn=true } )
    else
      checkboxButton:setState( { isOn=false } )
    end

    row:insert(checkboxButton)
    --texto ingrediente

    local rowTitle = display.newText( row, params.name, 0, 0, nil, 14 )
    rowTitle:setFillColor( 0 )

    -- Align the label left and vertically centered

    rowTitle.anchorX = 0
    rowTitle.x = 40
    rowTitle.y = rowHeight * 0.5


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
sceneGroup:insert(tableView )

searchRecipesButton = display.newRect(display.contentWidth * 0.8 , display.contentHeight * 0.9, display.contentWidth * 0.3, display.contentHeight * 0.1 )
searchRecipesButton:setFillColor(0,0,1)
sceneGroup:insert(searchRecipesButton)
searchRecipesButton:addEventListener( "tap", searchRecipes )



-- Insert Recipes
  for row in db:nrows("SELECT * FROM Ingredientes") do

    -- Insert a row into the tableView
    tableView:insertRow{

      params = {
          name = row.Nome
        }

    }
end



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
