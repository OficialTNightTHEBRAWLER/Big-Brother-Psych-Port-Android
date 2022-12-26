function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'warn' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'note assets/warnNote'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'hitHealth', '0.023'); --Default value is: 0.023, health gained on hit
			setPropertyFromGroup('unspawnNotes', i, 'missHealth', '500'); --Default value is: 0.0475, health lost on miss
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', false);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has no penalties
			end
		end
	end
	--debugPrint('Script started!')
end
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'warn' then
		characterPlayAnim('dad','gunshot',true)
		setProperty('dad.specialAnim', true)
		cameraShake('camGame', 0.01, 0.2)
		if noteData == 0 then
			characterPlayAnim('boyfriend', 'singRIGHT', true)
			setProperty('boyfriend.specialAnim', true)
		end
		if noteData == 1 then
			characterPlayAnim('boyfriend', 'singUP', true)
			setProperty('boyfriend.specialAnim', true)
		end
		if noteData == 2 then
			characterPlayAnim('boyfriend', 'singDOWN', true)
			setProperty('boyfriend.specialAnim', true)
		end
		if noteData == 3 then
			characterPlayAnim('boyfriend', 'singLEFT', true)
			setProperty('boyfriend.specialAnim', true)
		end
	end
end
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'warn' then
		characterPlayAnim('dad','gunshot',true)
		setProperty('dad.specialAnim', true)
		cameraShake('camGame', 0.01, 0.2)
	end
end