local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()


local Window = Rayfield:CreateWindow({
   Name = "Universal Hub",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Please wait, loading Hub...",
   LoadingSubtitle = "by Gaphop",
   ShowText = "Rayfield", -- for mobile users to unhide Rayfield, change if you'd like
   Theme = "Green", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   ToggleUIKeybind = "K", -- The keybind to toggle the UI visibility (string like "K" or Enum.KeyCode)

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from emitting warnings when the script has a version mismatch with the interface.

   -- ScriptID = "sid_xxxxxxxxxxxx", -- Your Script ID from developer.sirius.menu — enables analytics, managed keys, and script hosting

   ConfigurationSaving = {
      Enabled = true,
      FolderName = "Universal_Hub", -- Create a custom folder for your hub/game
      FileName = "Universal Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include Discord.gg/. E.g. Discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the Discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Key for Universal Hub",
      Subtitle = "Key System",
      Note = "key: BlwJsytMt5cs25tZvU4NkNnZgb", -- Use this to tell the user how to get a key
      FileName = "Key", -- It is recommended to use something unique, as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"BlwJsytMt5cs25tZvU4NkNnZgb"} -- List of keys that the system will accept, can be RAW file links (pastebin, github, etc.) or simple strings ("hello", "key22")
   }
})

local Loader = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stratxgy/DH-Lua-Lock/refs/heads/main/Main.lua"))()
local Loader = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stratxgy/Roblox-Chams-Highlight/refs/heads/main/Highlight.lua"))()
local Loader = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stratxgy/Lua-TargetHud/refs/heads/main/targethud.lua"))()
local Loader = loadstring(game:HttpGet("https://raw.githubusercontent.com/Stratxgy/Lua-Speed/refs/heads/main/speed.lua"))()

local ULTab = Window:CreateTab("Universal Hub", "scroll-text")

local Section = ULTab:CreateSection("Hubs")

local Button = ULTab:CreateButton({
    Name = "Launch Infinite Yield",
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
    end,
})



local Button = ULTab:CreateButton({
    Name = "Launch YARHM",
    Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Joystickplays/psychic-octo-invention/main/source/yarhm/1.21/yarhm.lua"))()
    end,
})


local VLTab = Window:CreateTab("Visual", "eye")

local Section = VLTab:CreateSection("Visual") 

local Toggle = VLTab:CreateToggle({
   Name = "Enable FOV",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      getgenv().dhlock.showfov = Value
   end,
})


local Slider = VLTab:CreateSlider({
   Name = "FOV",
   Range = {0, 100},
   Increment = 10,
   Suffix = "POV",
   CurrentValue = 18,
   Flag = "Slider1", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      getgenv().dhlock.fov = Value
   end,
})

local Toggle = VLTab:CreateToggle({
   Name = "ESP",
   CurrentValue = false,
   Flag = "Toggle2", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      getgenv().chams.enabled = Value
   end,
})

local ColorPicker = VLTab:CreateColorPicker({
    Name = "ESP colors",
    Color = Color3.fromRGB(255,255,255),
    Flag = "ColorPicker1", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
      getgenv().chams.outlineColor = Value
    end
})

local Section = VLTab:CreateSection("Target HUD")

local Toggle = VLTab:CreateToggle({
   Name = "Target info",
   CurrentValue = false,
   Flag = "Toggle3", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      getgenv().targethud.enabled = Value
   end,
})

local Slider = VLTab:CreateSlider({
   Name = "max Distance",
   Range = {0, 100},
   Increment = 10,
   Suffix = "studs",
   CurrentValue = 18,
   Flag = "Slider2", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      getgenv().targethud.maxDistance = Value
   end,
})


local crosshairGui
local crosshairParts = {}

VLTab:CreateToggle({
    Name = "Crosshair",
    CurrentValue = false,
    Flag = "CrosshairToggle",
    Callback = function(Value)
        if Value then
            if crosshairGui then
                crosshairGui.Enabled = true
                return
            end

            local player = game.Players.LocalPlayer
            local playerGui = player:WaitForChild("PlayerGui")

            crosshairGui = Instance.new("ScreenGui")
            crosshairGui.Name = "UniversalHubCrosshair"
            crosshairGui.IgnoreGuiInset = true
            crosshairGui.ResetOnSpawn = false
            crosshairGui.Parent = playerGui

            local function CreateLine(size, pos)
                local frame = Instance.new("Frame")
                frame.AnchorPoint = Vector2.new(0.5, 0.5)
                frame.Position = pos
                frame.Size = size
                frame.BorderSizePixel = 0
                frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
                frame.Parent = crosshairGui

                table.insert(crosshairParts, frame)
            end

            -- Top
            CreateLine(
                UDim2.fromOffset(2, 12),
                UDim2.new(0.5, 0, 0.5, -10)
            )

            -- Bottom
            CreateLine(
                UDim2.fromOffset(2, 12),
                UDim2.new(0.5, 0, 0.5, 10)
            )

            -- Left
            CreateLine(
                UDim2.fromOffset(12, 2),
                UDim2.new(0.5, -10, 0.5, 0)
            )

            -- Right
            CreateLine(
                UDim2.fromOffset(12, 2),
                UDim2.new(0.5, 10, 0.5, 0)
            )

        else
            if crosshairGui then
                crosshairGui.Enabled = false
            end
        end
    end,
})

VLTab:CreateColorPicker({
    Name = "Crosshair Color",
    Color = Color3.fromRGB(255, 255, 255),
    Flag = "CrosshairColor",
    Callback = function(Value)
        for _, part in ipairs(crosshairParts) do
            if part then
                part.BackgroundColor3 = Value
            end
        end
    end,
})

local PLTab = Window:CreateTab("Player", "user")
local Section = PLTab:CreateSection("Player") -- everyone can see it

local Toggle = PLTab:CreateToggle({
   Name = "Enable Speed",
   CurrentValue = false,
   Flag = "Toggle4", -- A flag is the identifier for the configuration file; make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      getgenv().speed.enabled = Value
   end,
})

local Input = PLTab:CreateInput({
   Name = "Speed",
   CurrentValue = "18",
   PlaceholderText = "Speed",
   RemoveTextAfterFocusLost = false,
   Flag = "Input1",
   Callback = function(Text)
      getgenv().speed.speed = Text
   end,
})

local noclipConnection

local Toggle = PLTab:CreateToggle({
   Name = "Enable Noclip",
   CurrentValue = false,
   Flag = "Toggle5",
   Callback = function(Value)
      if Value then
         noclipConnection = game:GetService("RunService").Stepped:Connect(function()
            local character = game.Players.LocalPlayer.Character
            if character then
               for _, part in ipairs(character:GetDescendants()) do
                  if part:IsA("BasePart") then
                     part.CanCollide = false
                  end
               end
            end
         end)
      else
         if noclipConnection then
            noclipConnection:Disconnect()
            noclipConnection = nil
         end

         local character = game.Players.LocalPlayer.Character
         if character then
            for _, part in ipairs(character:GetDescendants()) do
               if part:IsA("BasePart") then
                  part.CanCollide = true
               end
            end
         end
      end
   end,
})

local Toggle = PLTab:CreateToggle({
   Name = "Enable Jump Power",
   CurrentValue = false,
   Flag = "JumpPowerToggle",
   Callback = function(Value)
      jumpEnabled = Value

      if Value then
         jumpConnection = RunService.RenderStepped:Connect(function()
            local character = Players.LocalPlayer.Character
            if character then
               local humanoid = character:FindFirstChild("Humanoid")
               if humanoid then
                  humanoid.UseJumpPower = true
                  humanoid.JumpPower = jumpPower
               end
            end
         end)
      else
         if jumpConnection then
            jumpConnection:Disconnect()
            jumpConnection = nil
         end

         local character = Players.LocalPlayer.Character
         if character then
            local humanoid = character:FindFirstChild("Humanoid")
            if humanoid then
               humanoid.JumpPower = 50 -- Giá trị mặc định
            end
         end
      end
   end,
})

local Input = PLTab:CreateInput({
   Name = "Jump Power",
   CurrentValue = "50",
   PlaceholderText = "Enter Jump Power",
   RemoveTextAfterFocusLost = false,
   Flag = "JumpPowerInput",
   Callback = function(Text)
      local value = tonumber(Text)

      if value then
         jumpPower = value

         if jumpEnabled then
            local character = Players.LocalPlayer.Character
            if character then
               local humanoid = character:FindFirstChild("Humanoid")
               if humanoid then
                  humanoid.UseJumpPower = true
                  humanoid.JumpPower = jumpPower
               end
            end
         end
      end
   end,
})

local Section = PLTab:CreateSection("Animations")

local Input = PLTab:CreateInput({
    Name = "Animation ID",
    CurrentValue = "",
    PlaceholderText = "Ex: 507766388",
    RemoveTextAfterFocusLost = false,
    Flag = "AnimationID",
    Callback = function(Text)
        animationId = Text
    end,
})

local Button = PLTab:CreateButton({
    Name = "Play Animation",
    Callback = function()
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:FindFirstChildOfClass("Humanoid")

        if humanoid and animationId ~= "" then
            local animator = humanoid:FindFirstChildOfClass("Animator")
            if not animator then
                animator = Instance.new("Animator")
                animator.Parent = humanoid
            end

            local animation = Instance.new("Animation")
            animation.AnimationId = "rbxassetid://" .. animationId

            local track = animator:LoadAnimation(animation)
            track:Play()
        end
    end,
})


local MCTab = Window:CreateTab("Misc", "ellipsis")
local Section = MCTab:CreateSection(" ")

local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local Button = MCTab:CreateButton({
    Name = "Rejoin",
    Callback = function()
        TeleportService:Teleport(game.PlaceId, Players.LocalPlayer)
    end,
})


















Rayfield:Notify({
   Title = "Hub Loaded!",
   Content = "The Universal Hub has been loaded successfully!",
   Duration = 6.5,
   Image = "check",
})