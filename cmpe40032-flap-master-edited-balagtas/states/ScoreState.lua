--[[
    ScoreState Class

    A simple state used to display the player's score before they
    transition back into the play state. Transitioned to from the
    PlayState when they collide with a Pipe.
]]

ScoreState = Class{__includes = BaseState}


--[[ 
    When a player enters the ScoreState, award them a “medal” via an image displayed along
 with the score; this can be any image or any type of medal you choose (e.g., ribbons, actual medals,
  trophies, etc.), so long as each is different and based on the points they scored that life. Choose
   3 different ones, as well as the minimum score needed for each one (though make it fair and not too
    hard to test :)). 
]]

diamond = love.graphics.newImage('diamond.png')
gold = love.graphics.newImage('gold.png')
silver = love.graphics.newImage('silver.png')
bronze = love.graphics.newImage('bronze.png')

--[[
    When we enter the score state, we expect to receive the score
    from the play state so we know what to render to the State.
]]
function ScoreState:enter(params)
    self.score = params.score
end

function ScoreState:update(dt)
    -- go back to play if enter is pressed
    if love.keyboard.wasPressed('enter') or love.keyboard.wasPressed('return') then
        gStateMachine:change('countdown')
    end
end

function ScoreState:render()
    -- simply render the score to the middle of the screen
    love.graphics.setFont(flappyFont)
    love.graphics.printf('Oof! You lost!', 0, 64, VIRTUAL_WIDTH, 'center')

    love.graphics.setFont(mediumFont)
    love.graphics.printf('Score: ' .. tostring(self.score), 0, 100, VIRTUAL_WIDTH, 'center')

    --if-else statement for the score
    
    if self.score == 0 then
        love.graphics.setFont(flappyFont)
        love.graphics. printf('YOU CAN DO BETTER!', 0, 150, VIRTUAL_WIDTH, 'center')
    elseif self.score <= 10 then 
        love.graphics.draw(bronze, 225, 120, 0, 0.10, 0.10)
    elseif self.score <= 20 then 
        love.graphics.draw(silver, 225, 120, 0, 0.10, 0.10)
    elseif self.score <= 30 then 
        love.graphics.draw(gold, 225, 120, 0, 0.10, 0.10)
    elseif self.score <= 40 then 
        love.graphics.draw(diamond, 225, 120, 0, 0.10, 0.10)
    end


    love.graphics.setFont(mediumFont)
    love.graphics.printf('Press Enter to Play Again!', 0, 200, VIRTUAL_WIDTH, 'center')

end