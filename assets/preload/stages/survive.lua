function onCreate()
	makeLuaSprite('bg','survive/bg',-330,-150)
	addLuaSprite('bg',false)
	setScrollFactor('bg',0,0)

	makeLuaSprite('buildings','survive/buildings',-725,-220)
	addLuaSprite('buildings',false)
	scaleObject('buildings',1.2,1.2)
	setScrollFactor('buildings',0.3,0.3)

	makeLuaSprite('lights','survive/lights',-725,-220)
	addLuaSprite('lights',false)
	scaleObject('lights',1.2,1.2)
	setScrollFactor('lights',0.3,0.3)

	makeLuaSprite('lamppost','survive/lamppost',-850,-200)
	addLuaSprite('lamppost',false)
	scaleObject('lamppost',1.1,1.1)

	makeLuaSprite('rooftop','survive/rooftop',-730,-165)
	addLuaSprite('rooftop',false)
	scaleObject('rooftop',1.1,1.1)

	makeLuaSprite('splatter','survive/splatter',-430,0)
	addLuaSprite('splatter',false)
end
function onBeatHit()
	if curBeat % 4 == 0 then
		doTweenAlpha('lights1','lights',1,0.1,'linear')
	end
end
function onTweenCompleted(tag, loops, loopsLeft)
	if tag == 'lights1' then
		doTweenAlpha('lights2','lights',0.1,0.5,'linear')
	end
end