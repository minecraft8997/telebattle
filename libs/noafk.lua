local _A = {}

afktimeout_mins = 1

function _A:install(me)
    tasker:newTask(function()
        while not me:isBroken() do
			coroutine.yield()

            if os.time() - me.lastkeyreceived >= afktimeout_mins * 60 then
                me:fullClear()
                me:send('We haven\'t noticed any actions in ' .. afktimeout_mins .. ' minute(s)\r\n')
                me:send('So we consider you are Away From Keyboard')
                me:close()
            end
		end
    end)
end

return _A