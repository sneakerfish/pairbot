# pairbot

This is an attempt to monitor pairing sessions.  People in a channel that this bot belongs to may pair with other
people in the channel by nickname.  Once in a pair, any user may mention that the pair is working on a specific thing,
like a ticket id or meeting.   Pairing has a direction.  That is, if a pairs with b and then c pairs with b the pair has
three members.  If a then pairs with e, then there are two pairs with two members each.  Once paired, either member
can change the work topic any time.  Any channel member can ask for the status of all pairs.

##.Dependencies

* [cinch](https://github.com/cinchrb/cinch)
* [cinch-test](https://rubygems.org/gems/cinch-test)
