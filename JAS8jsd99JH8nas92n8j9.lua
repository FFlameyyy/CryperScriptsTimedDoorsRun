nk = false
while true do
    if game.Workspace.CurrentRooms["0"].StarterElevator.DoorHitbox.DoorMove.Playing == true then
        local screenGui = Instance.new("ScreenGui")
        screenGui.Parent = game.CoreGui
        local countdownLabel = Instance.new("TextLabel")
        countdownLabel.Position = UDim2.new(1, -100, 1, -50)
        countdownLabel.Size = UDim2.new(0, 100, 0, 50)
        countdownLabel.TextColor3 = Color3.new(1, 1, 1)
        countdownLabel.TextScaled = true
        countdownLabel.BackgroundTransparency = 1
        countdownLabel.Parent = screenGui
        local countdownTime = TimeInSeconds
        while countdownTime > 0 do
            countdownTime = countdownTime - 1
            local minutes = math.floor(countdownTime / 60)
            local seconds = countdownTime % 60
            if seconds < 10 then
                seconds = "0" .. seconds
            end
            countdownLabel.Text = minutes .. ":" .. seconds
            wait(1)
        end
        local sparkCoroutine = coroutine.create(function()
            while true do
                if game.Workspace.CurrentRooms["100"].FigureSetup.SparkPart.Sound.Playing == true then
                    nk = true
                    countdownTime = 0
                    countdownLabel.TextColor3 = Color3.new(0, 1, 0)
                    break
                end
                wait()
            end
        end)
        coroutine.resume(sparkCoroutine)
        while coroutine.status(sparkCoroutine) ~= "dead" do
            wait()
        end
        if nk == false then
            game.Players.LocalPlayer.Character.Humanoid.Health = 0
        end
    end
    wait()
end
