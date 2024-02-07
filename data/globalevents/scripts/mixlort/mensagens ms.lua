MENSAGEM = {
"Aviso: Não se esqueça de baixar o nosso client atualizado em nosso site: pokenumb.ddns.net",
"Aviso: Siga o PokeMS nas redes sociais para ficar por dentro das atualizações e novidades! Todas no site: pokenumb.ddns.net",
}

MENSAGEM1 = {
"Aviso: Use '!money' para juntar seu dinheiro!",
"Aviso: Use '!comandos' para ver alguns comandos disponíveis no servidor.",
"Aviso: Tire suas dúvidas no Canal Help, acessado via CTRL + O.",
"Aviso: Se quer protestar, reclamar ou conversar use o game-chat, o help só deve ser usado para tirar dúvidas sobre o jogo.",
"Aviso: A nossa equipe não se responsabiliza por roubos entre jogadores. Então sempre tome cuidado!",
"Aviso: Para ativar o AutoLoot é simples, digite !autoloot on.",
-- "Aviso: Use !house para ver os comandos de house!",
"Aviso: Use '!partyexp' para ver sua exp em party!",
"Aviso: Lembrando que isso é uma versão beta para testarmos o game, achar bug e corrigi-los. Haverá um reset no lançamento da Oficial!",
}

MENSAGEM2 = {
"Diversão garantida: Está gostando do servidor? Que tal chamar seus amigos para jogar junto com você?",
"Jogar o PokeMS com amigos é bem mais legal! Que tal chamar todos seus amigos para conhecer esse novo MMORPG de Pokemon?!",
}

MENSAGEM3 = {
"Faça uma doação e nos ajude a continuar trazendo diversão para vocês. Site: pokenumb.ddns.net",
"Incrivel não? Essa sensação de jogar o PokeNumb MMORPG não tem igual, que tal doar uma quantia para o jogo se manter online por muito tempo?",
}

MENSAGEM4 = {
"Aviso: Sistema de pontos online em desenvolvimento.",
}

MENSAGEM5 = {
"Curta nossa página do facebook: www.facebook.com/NewPokeNumb",
}

MENSAGEM6 = {
"Ajuda: Para mudar a direção de seu pokémon durante a batalha utilize o Order ou digite os seguintes comandos, 't1, t2, t3, t4'!",
}

function onThink(interval, lastExecution)

Mixlort = math.random(1,6)
local i = 0
local q = 0
local w = 0
local e = 0
local r = 0
local t = 0
local m = 0

if Mixlort == 1 then
local message = MENSAGEM[(i % #MENSAGEM) + 1]
doBroadcastMessageMs(message)
i = i + 1
return true

elseif Mixlort == 2 then
local message = MENSAGEM2[(q % #MENSAGEM2) + 1]
doBroadcastMessageWorld(message)
q = q + 1
return true

elseif Mixlort == 3 then
local message = MENSAGEM3[(w % #MENSAGEM3) + 1]
doBroadcastMessageXp(message)
w = w + 1
return true

-- elseif Mixlort == 4 then
-- local message = MENSAGEM4[(e % #MENSAGEM4) + 1]
-- doBroadcastMessageDeltaball(message)
-- e = e + 1
-- return true

elseif Mixlort == 4 then
local message = MENSAGEM5[(r % #MENSAGEM5) + 1]
doBroadcastMessageFacebook(message)
r = r + 1
return true

elseif Mixlort == 5 then
local message = MENSAGEM6[(t % #MENSAGEM6) + 1]
doBroadcastMessageMewtwo(message)
t = t + 1
return true

elseif Mixlort == 6 then
local message = MENSAGEM1[(m % #MENSAGEM1) + 1]
doBroadcastMessageMegaphone(message)
m = m + 1
return true

end

return true
end