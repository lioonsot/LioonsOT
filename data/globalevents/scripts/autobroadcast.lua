-- 

function onThink(interval, lastExecution)
	local messages = {
		"[COMANDOS] !buyhouse - Apenas com uso de Tibia Coins.",
		"[BUGS] use o comando !report Ex.: !report SQM BUGADO !\nA cada Report válido de BUG's você recebera Tibia Coins!"
	}

    Game.broadcastMessage(messages[math.random(#messages)], MESSAGE_EVENT_ADVANCE) 
    return true
end

