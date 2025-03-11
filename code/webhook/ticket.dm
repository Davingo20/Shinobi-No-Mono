var ticket_count = 0;
// counts the number of tickets created
verb/create_ticket()
    set name = "Create Ticket"
    set category = "Commands"
//creates a ticket under the category 'commands' to be ofund
    var/reason = input(usr, "Enter the reason for the ticket:")
    ticket_count++
//asks the user for the reason for the ticket
    if(!reason)
        return
//if there's no reason, ticket's not created
