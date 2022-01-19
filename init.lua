local S = minetest.get_translator("mtirc")
--[local guihud = dofile(minetest.get_modpath("email")  .. "/init.lua")--]

minetest.register_chatcommand("list_mail", {
	params = "",
	description = S("Open and view your mail on IRC"),
	privs = { interact=true, },
    func = function(name)
        local inbox = email.get_inbox(name)
            if #inbox > 0 then
                if minetest.get_player_by_name(name) then
                    minetest.chat_send_player(name, "You can only use this command via IRC.")
                    return
                else
                    minetest.chat_send_player(name, "You have a total of " .. #inbox .. " items in your inbox!")
                    for i = 1, #inbox do
                        local item = inbox[i]
                        minetest.chat_send_player(name, i .. ") "  .. item.date .. " --> " .. item.from .. ": " .. item.msg)
                    end
                end
            end
            if #inbox == 0 then
                if minetest.get_player_by_name(name) then
                    minetest.chat_send_player(name, "You can only use this command via IRC.")
                    return
                else
                    local item = inbox[i]
                    minetest.chat_send_player(name,"You have no mail!" )
                end
            end
        end
})

minetest.register_chatcommand("clear_mail", {
	params = "",
	description = S("Clear your mail on IRC"),
	privs = { interact=true, },
    func = function(name)
        local inbox = email.get_inbox(name)
            if #inbox > 0 then
                if minetest.get_player_by_name(name) then
                    minetest.chat_send_player(name, "You can only use this command via IRC.")
                    return
                else
                    email.clear_inbox(name)
                    minetest.chat_send_player(name, "You have cleared a total of " .. #inbox .. " items from your inbox!")
                end
            end
            if #inbox == 0 then
                if minetest.get_player_by_name(name) then
                    minetest.chat_send_player(name, "You can only use this command via IRC.")
                    return
                else
                    local item = inbox[i]
                    minetest.chat_send_player(name,"You have no mail!" )
                end
            end
    end
})