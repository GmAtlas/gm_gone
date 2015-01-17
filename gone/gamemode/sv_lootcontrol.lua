Table = {}
function SavePosition(ply,cmd,arg)
table.insert(Table,ply:GetPos())
end
concommand.Add("LootInsert",SavePosition)
