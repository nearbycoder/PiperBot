defmodule DwightSchrute do

  def fetch_random_dwight_quote do
    Task.async(fn -> fetch() end)
    |> Task.await
  end

  defp fetch do
    [
      "There are 3 things you never turn your back on: bears, men you have wronged, and a dominant male turkey during mating season.",
      "Before I do anything I ask myself, ‘Would an idiot do that?’ and if the answer is yes, I do not do that thing.",
      "Powerpoints are the peacocks of the business world; all show, no meat.",
      "In an ideal world I would have all ten fingers on my left hand and the right one would just be left for punching.",
      "Those who can’t farm, farm celery.",
      "A real man swallows his vomit when a lady is present.",
      "No, don’t call me a hero. Do you know who the real heroes are? The guys who wake up every morning and go into their normal jobs, and get a distress call from the Commissioner and take off their glasses and change into capes and fly around fighting crime. Those are the real heroes.",
      "I love catching people in the act. That’s why I always whip open doors.",
      "Reject a woman, and she will never let it go. One of the many defects of their kind. Also, weak arms.",
      "Learn your rules. You better learn your rules. If you don’t, you’ll be eaten in your sleep. *crunch*",
      "Dolphins get a lot of good publicity for the drowning swimmers they push back to shore, but what you don’t hear about is the many people they push farther out to sea! Dolphins aren’t smart. They just like pushing things.",
      "The principle is sound. To avoid illness, expose yourself to germs, enabling your immune system to develop antibodies. I don’t know why everyone doesn’t do this… Maybe they have something against living forever.",
      "I never smile if I can help it, Showing one’s teeth is a submission signal in primates. Someone smiles at me, all I see is a chimpanzee begging for it’s life.",
      "R’ is the most menacing sound in the English language. That’s why it’s called ‘murder’ and not ‘mukduk.’",
      "The hand that reaches from the grave to grip your throat is the strong hand you want on the wheel.",
      "Why tip someone for a job I’m capable of doing myself? I can deliver food. I can drive a taxi. I can, and do, cut my own hair. I did however, tip my urologist, because I am unable to pulverize my own kidney stones.",
      "Women are like wolves. If you want one you must trap it. Snare it. Tame it. Feed it.",
      "People say, ‘oh it’s dangerous to keep weapons in the home, or the workplace.’ Well I say, it’s better to be hurt by someone you know, accidentally, than by a stranger, on purpose.”",
      "There are a huge number of yeast infections in this county. Probably because we’re downriver from that old bread factory.",
      "I saw Wedding Crashers accidentally. I bought a ticket for “Grizzly Man” and went into the wrong theater. After an hour, I figured I was in the wrong theater, but I kept waiting. Cause that’s the thing about bear attacks… they come when you least expect it.",
      "Nostalgia is truly one of the great human weaknesses. Second only to the neck.",
      "I wish I could menstruate. If I could menstruate, I wouldn’t have to deal with idiotic calendars anymore. I’d just be able to count down from my previous cycle. Plus I’d be more in tune with the moon and the tides.",
      "The eyes are the groin of the head.",
      "Bread is the paper of the food industry. You write your sandwich on it.",
      "When I die, I want to be frozen. And if they have to freeze me in pieces, so be it. I will wake up stronger than ever, because I will have used that time, to figure out exactly why I died. And what moves I could have used to defend myself better now that I know what hold he had me in.",
      "Why are all these people here? There are too many people on this earth. We need a new plague.",
      "D.W.I.G.H.T – Determined, Worker, Intense, Good worker, Hard worker, Terrific."
    ]
    |> Enum.random
  end
end