local OpcodeDialog = 80
local Actions = {
  open = 1,
  closed = 2
}

function doSendDialogNpc(cid, npc, msg, opc)
  if ( not opc ) then
    opc = ''
  end
  doSendPlayerExtendedOpcode(cid, OpcodeDialog, table.serialize({ action = Actions.open, data = { npcId = npc, message = msg, options = opc } })) 
end

function doSendDialogNpcClose(cid)
  doSendPlayerExtendedOpcode(cid, OpcodeDialog, table.serialize({ action = Actions.closed }))
end

function InicialNpc(cid, npc, message, options)
  if not(options) then
    options = ''
  end
  doSendPlayerExtendedOpcode(cid, 177, getCreatureName(npc)..'@'..message..'@'..options) 
end
