local _A = {
	afktimeout = 600
}

function _A:checkidle(me, since)
	if os.time() - since >= self.afktimeout then
		me:fullClear()
		me:send('We haven\'t noticed any actions in ' .. self.afktimeout .. ' second(s)\r\n')
		me:send('So we consider you are Away From Keyboard')
		me:close()
	end
end

function _A:install(me)
	tasker:newTask(function()
		while not me:isBroken() do
			coroutine.yield()

			self:checkidle(me, me:getlastkeyreceived())
		end
	end)
end

return _A