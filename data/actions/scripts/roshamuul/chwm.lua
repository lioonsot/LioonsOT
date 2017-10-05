function onUse(cid, item, frompos, item2, topos)
if item2.itemid == 22389 then
doTransformItem(item2.uid, 22390)
doRemoveItem(item.uid, 1)
doSendMagicEffect(frompos, 7)
else
doPlayerSendCancel(cid, "You can't use this item here.")
end
return true
end