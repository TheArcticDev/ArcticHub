for i,v in pairs(game.Players:GetChildren()) do 
  local screengui = Instance.new("ScreenGui", v.PlayerGui)
  local videoframe = Instance.new("VideoFrame", screengui)
  videoframe.Visible = true
  videoframe.Size = UDim2.new(1,0,1,0)
  videoframe.Transparency = 0
  videoframe.Video = getsynasset("/VotteqHub/Music/video.webm")
  videoframe:Play()
end
