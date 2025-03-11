var/global/ticket_count = 0
// counts the number of tickets created
/mob/verb/create_ticket()
    set name = "Create Ticket"
    set category = "Commands"
//creates a ticket under the category 'commands' to be ofund
    var/reason = input(usr, "Enter the reason for the ticket:")
    ticket_count++
//asks the user for the reason for the ticket
    if(!reason)
        return
//if there's no reason, ticket's not created

/mob/verb/open_ticket()
    set name = "Open Ticket"
    set category = "Commands"
    //the command to open tickets
    if(!ticket_count)
        usr << "No tickets present."
        return
    
    var/list/ticket_list = list()
    for(var/i = 1 to ticket_count)
        ticket_list += "Ticket #[i]"
    //gets the list of all present tickets on hand
    var/choice = input("Select a ticket:", "Open Ticket") as null|anything in ticket_list
    if(!choice)
        return
    var/ticket_num = text2num(copytext(choice, 9))
    usr << "Opening [choice]" 
    usr.client.HttpPost(
        "https://discord.com/api/webhooks/1337600028306309242/NPZ_Py3E_d2rI17i7fbL0VHtvvjN4OZPqlRGymMtbflaEh9u11sHX-WqPNVf_LYbXNAf",
        list(
            content = "[copytext(usr.key, 1, 7) == "Guest-" ? usr.key : usr.key] has opened ticket #[ticket_num]"
        )
    )

