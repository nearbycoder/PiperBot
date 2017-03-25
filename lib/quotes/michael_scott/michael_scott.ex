defmodule MichaelScott do

  def fetch_random_michael_quote do
    Task.async(fn -> fetch() end)
    |> Task.await
  end

  defp fetch do
    [
      "It's simply beyond words. It's incalcucable.",
      "Abraham Lincoln once said that \"If you're a racist, I will attack you with the North\" and these are the principles I carry with me in the workplace.",
      "I guess the atmosphere that I've tried to create here is that I'm a friend first and a boss second, and probably an entertainer third.",
      "I am Michael, and I am part English, Irish, German, and Scottish, sort of a virtual United Nations.",
      "I learned improve from the greats, like Drew Carey and Ryan Styles.",
      "I think if I was allergic to dairy I'd kill myself.",
      "A lot of the people here don't get trophies very often, like Meridith or Kevin. I mean who's gonna give Kevin an award, Dunkin' Donuts?",
      "Toby is in HR, which technically means he works for corporate, so he's really not a part of our family. Also, he's divorced, so he's really not a part of his family.",
      "Would I rather be feared or loved? Um... Easy, both. I want people to be afraid of how much they love me.",
      "Christmas is awesome. First of all you got to spend time with people you love. Secondly, you can get drunk and no-one can say anything. Third you give presents. What's better than giving presents? And fourth, getting presents. So four things. Not bad for one day. It's really the greatest day of all time.",
      "This is our receptionist, Pam. If you think she's cute now, you should have seen her a couple years ago.",
      "No, I'm not going to tell them about the downsizing. If a patient has cancer, you don't tell them.",
      "That is a perfectly good mini Christmas tree. We are going to sell that to charity because that is what Christmas is all about.",
      "Happy birthday, Jesus. Sorry your party is so lame!",
      "You people are jerks. Imagine if you had left Stevie Wonder on the floor of that bathroom instead of me.",
      "I don't understand. You want to see other people? Only other people.",
      "Wow, all these charts and graphs. Someone's been doing their homework... looks like USA Today.",
      "Jan is cold. If she was sitting across from you on a train, and she wasn't moving, you might think she was dead.",
      "A gentleman does not kiss and tell. And neither do I.",
      "What is with the guy jumping overboard? If he had just waited and heard what I had to say, he would be motivated right now, and not all wet.",
      "Were not going to pay for a bathing suit.",
      "Leader. Ship. The word 'ship' is hidden in side the word 'leadership,' as its... derivation.",
      "In an office when you are ranking people manager outranks captain. On a boat, who knows? It's nebulose.",
      "Captain Jack's a fart face.",
      "Sometimes you have to take a break from being the kind of boss that's always trying to teach people things. Sometimes you just have to be the boss of dancing.",
      "Where was my Oprah moment?",
      "Pam, Im public speaking. Stop public interrupting me! Actually, this would be good practice for your wedding toast.",
      "I hope this gave you a little taste of what life is like here at Dunder Mifflin Scranton. What its like to walk in Oscars shoes or try on Phyllis pants.",
      "This presentation is Desert Storm and as soon as its done we will not have to deal with those Iraqis anymore.",
      "Scranton is great but New York is like Scranton on acid. Noon speedno, on steroids.",
      "This is the world famous Rockefeller Center. Founded of course by Theodore Rockefeller. This is the skating rink and I think the Rangers practice there sometimes.",
      "Great places to eat. We have Bubba Gump ShrimpRed Lobster down there. You know? This is the heart of civilization. Right here.",
      "Here it is, heart of New York City, Time Square. Named for the good times you have when you arein it. Most people, when they come to New York, they go straight to the Empire State Building. Thats very touristy. I come here.",
      "This is a business trip. I would have to be a raving lunatic to try to talk to her about what happened between us. Her words, not mine. She sent me an email this morning. Butit is Valentines Day. New York. City of love.",
      "Now you may look around and see two groups here. White collar, blue collar. But I dont see it that way. You know why not? Because I am collar-blind.",
      "So whats the 411? Any updates on the P situation?",
      "Jim and I are great friends. We hang out a tonmostly at work.",
      "Yeah I am fussy! Aspirins not gonna do a damn thing! Im sitting here with a bloody stump of a foot.",
      "I bumped my elbow against the wall and now my elbow has a protruberance. No one wants to pick me up?!?!",
      "So Phyllis is basically saying Hey Michael, I know you did a lot to help the office this year, but I only care about you and oven mitts-worth. I gave Ryan an iPod!",
      "I want people to cut loose. I want people making out in closets. I want people hanging from the ceilingslampshades on the headI want it to be a Playboy Mansion party.",
      "It was a tough year. I had to fire somebody this year."
    ]
    |> Enum.random
  end
end