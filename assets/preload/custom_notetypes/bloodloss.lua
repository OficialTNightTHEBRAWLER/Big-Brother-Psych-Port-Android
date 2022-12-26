local bloodlost = 11
function onCreate()
	runTimer('blood',2,1)

	makeLuaSprite('1','bloodloss/1',-79.24607329842929,0)
	addLuaSprite('1',true)
	scaleObject('1',0.7539267015706806,0.7539267015706806)
	setObjectCamera('1','other')
	setProperty('1.visible',false)

	makeLuaSprite('2','bloodloss/2',-79.24607329842929,0)
	addLuaSprite('2',true)
	scaleObject('2',0.7539267015706806,0.7539267015706806)
	setObjectCamera('2','other')
	setProperty('2.visible',false)

	makeLuaSprite('3','bloodloss/3',-79.24607329842929,0)
	addLuaSprite('3',true)
	scaleObject('3',0.7539267015706806,0.7539267015706806)
	setObjectCamera('3','other')
	setProperty('3.visible',false)

	makeLuaSprite('4','bloodloss/4',-79.24607329842929,0)
	addLuaSprite('4',true)
	scaleObject('4',0.7539267015706806,0.7539267015706806)
	setObjectCamera('4','other')
	setProperty('4.visible',false)

	makeLuaSprite('5','bloodloss/5',-79.24607329842929,0)
	addLuaSprite('5',true)
	scaleObject('5',0.7539267015706806,0.7539267015706806)
	setObjectCamera('5','other')
	setProperty('5.visible',false)

	makeLuaSprite('6','bloodloss/6',-79.24607329842929,0)
	addLuaSprite('6',true)
	scaleObject('6',0.7539267015706806,0.7539267015706806)
	setObjectCamera('6','other')
	setProperty('6.visible',false)

	makeLuaSprite('7','bloodloss/7',-79.24607329842929,0)
	addLuaSprite('7',true)
	scaleObject('7',0.7539267015706806,0.7539267015706806)
	setObjectCamera('7','other')
	setProperty('7.visible',false)

	makeLuaSprite('8','bloodloss/8',-79.24607329842929,0)
	addLuaSprite('8',true)
	scaleObject('8',0.7539267015706806,0.7539267015706806)
	setObjectCamera('8','other')
	setProperty('8.visible',false)

	makeLuaSprite('9','bloodloss/9',-79.24607329842929,0)
	addLuaSprite('9',true)
	scaleObject('9',0.7539267015706806,0.7539267015706806)
	setObjectCamera('9','other')
	setProperty('9.visible',false)

	makeLuaSprite('10','bloodloss/10',-79.24607329842929,0)
	addLuaSprite('10',true)
	scaleObject('10',0.7539267015706806,0.7539267015706806)
	setObjectCamera('10','other')
	setProperty('10.visible',false)

	makeLuaText('subtitles','',500,screenWidth*0.3,screenHeight*0.8)
	addLuaText('subtitles')
	setTextAlignment('subtitles','center')
	setTextSize('subtitles',50)
	setScrollFactor('subtitles',0,0)
	setObjectCamera('subtitles','camOther')
	setTextColor('subtitles','fc0303')

	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'bloodloss' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'note assets/bloodNote'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'note assets/blood')
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.023'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '0.0475'); --Default value is: 0.0475, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', true);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
			end
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'bloodloss' then
	end
end

-- Called after the note miss calculations
-- Player missed a note by letting it go offscreen
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'bloodloss' then
		bloodlost = bloodlost - 1
	end
end
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'blood' then
		bloodlost = bloodlost + 1
		runTimer('blood',2,1)
	end
end
function onUpdate(elapsed)
	setTextString('subtitles','blood:'.. bloodlost)
	if bloodlost > 11 then
		bloodlost = 11
	end
	if bloodlost < 1 then
		setProperty('health',-1)
	end
	if bloodlost == 1 then
		setProperty('1.visible',true)
		setProperty('2.visible',false)
	end
	if bloodlost == 2 then
		setProperty('2.visible',true)
		setProperty('1.visible',false)
		setProperty('3.visible',false)
	end
	if bloodlost == 3 then
		setProperty('3.visible',true)
		setProperty('2.visible',false)
		setProperty('4.visible',false)
	end
	if bloodlost == 4 then
		setProperty('4.visible',true)
		setProperty('3.visible',false)
		setProperty('5.visible',false)
	end
	if bloodlost == 5 then
		setProperty('5.visible',true)
		setProperty('4.visible',false)
		setProperty('6.visible',false)
	end
	if bloodlost == 6 then
		setProperty('6.visible',true)
		setProperty('5.visible',false)
		setProperty('7.visible',false)
	end
	if bloodlost == 7 then
		setProperty('6.visible',true)
		setProperty('3.visible',false)
		setProperty('8.visible',false)
	end
	if bloodlost == 8 then
		setProperty('8.visible',true)
		setProperty('7.visible',false)
		setProperty('9.visible',false)
	end
	if bloodlost == 9 then
		setProperty('9.visible',true)
		setProperty('8.visible',false)
		setProperty('10.visible',false)
	end
	if bloodlost == 10 then
		setProperty('10.visible',true)
		setProperty('9.visible',false)
	end
	if bloodlost == 11 then
		setProperty('10.visible',false)
	end
end