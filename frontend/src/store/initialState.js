const initialState = {
  // grid: [
  //   [1, 2, 3],
  //   [4, 0, 5],
  //   [6, 7, 8],
  // ],
  grid: [
    [1, 2, 3,
    4, 5]
  ],
  solved: false,
  canInteract: false,
  web3: {},
  user: {
    address: undefined,
    balance: undefined,
    tokens: {
      0: true,
      1: false,
      2: false,
      3: false,
      4: false,
      5: false,
      // 6: false,
      // 7: false,
      // 8: false,
    }
  },
  tokenInformation: {
    open: false,
    help: false,
    activeNumber: 3,
    1: {
      title: 'The Battle Axe',
      description: "The Zrinskis were a proud noble family that once ruled over Čakovec and helped shape the course of not only the town's history, but also the history of entire Europe. Nikola Šubić Zrinski was a particularly famous Zrinski, famous enough to be become the main character of Ivan von Zajc's internationally acclaimed opera and the star of many Croatian and Hungarian folk songs: he and his army fought to defend the Hungarian fortress of Sziget against a full-scale invasion of Ottoman forces led by the mighty Suleiman the Great. Although Sziget fell and Nikola perished in the battle, the Ottoman armies suffered such losses that they decided to retreat and abort their march towards Vienna. As you might have already noticed, the Zrinski family is nowadays a staple of Čakovec. Statues, symbols, and even graffiti that depict the members of the Zrinski family can be seen all over town. To find The Battle Axe token, you must look for the aforementioned historical hero in an area surrounded by trees, somewhere along the way from the Castle to the center of the town. He proudly stands there in solitude, silently waiting and clutching his battle axe. Some soothsayers claim that his axe appears somewhat undersized, but, hey, who are we to judge?",
    },
    2: {
      title: 'The Feathered Overseer',
      description: "While wandering around Čakovec, you might encounter a number of animals. Some of them, like dogs, cats, sparrows, and pigeons, will surely appear quite alive and real, while others, like, for example, a horse and a dragon, might appear immobile and made of some solid material like stone, metal of wood. Yeah, you guessed it – The Feathered Overseer token can only be found if you disregard the living animals and direct your attention towards the stationary ones. With majestic feathery wings spread wide, he is perched on top of his post, where he endures even the hardest of storms. He will remain there for centuries to come – to guard his master's weapon and oversee the city.",
    },
    3: {
      title: 'The Resurrector',
      description: "The baroque church in the very center of Čakovec is called The Church of St. Nicholas. Its tower was built in the 18th century, and the tolling of its giant bells can be heard all over town. Right now, you might be thinking \"LOL, they're sending me to the church to find a token named The Ressurector. That's pretty obvious\", right? Well, you're wrong. The Resurrector token is located somewhere in the vicinity of the church, but when and if you manage to find it, the pun will get even sweeter – the artifact to which it is strapped can, quite literally, bring you back from the dead!",
    },
    4: {
      title: 'The Frog Rose',
      description: "One particular monument, located somewhere close to the center of Čakovec, has been the subject of an intense debate, and one particular question related to this monument has been bothering the citizens of Čakovec for a few decades: \"Is this a rose or a frog?!\" If it is a rose, then the crystal spheres on its surface can be interpreted only as drops of dew. However, if it is a frog, then the crystals can be seen as sinister eyes looking in several directions. In any way, the monument hides the Frog Rose Token. The monument shouldn't be too hard to find. If you manage to find it, before collecting the token and moving on, please look at the concrete structure from all angles and help us resolve the burning question: is this a rose or a frog?"
    },
    5: {
      title: 'Major Tom',
      description: "You probably already known that Major Tom is a fictional astronaut who appears as the main protagonist of a number of songs written and sung by his famous creator, one of the most influential musicians of the 20th century. \"Well,\" you might ask yourself, \"is there any connection between Major Tom or his creator and the town of Čakovec?\" Apparently, there is. The creator of Major Tom played an awesome concert in Zagreb on September 5 of 1990. On that same day, a few hours before appearing on stage at the Maksimir Stadium, he allegedly visited the town of Čakovec and drank a few drinks with the locals. Unfortunately, nobody can verify this claim – as far as we know, there are no photos that would prove it, and we have to remember the wise ancient saying: pics or it didn't happen! Still, whether the creator of Major Tom did or didn't visit Čakovec is irrelevant – his possibly mythical visit turned into a prominent tale of the town's lore. To find the Major Tom token, you must find the place where some locals created a sort of a memorial to commemorate the late creator of the famous musical astronaut. The token will be somewhere in its close vicinity."
    },
    // 6: {
    //   title: 'heresy',
    //   description: 'Deniers, idolators, non-believers all burn with the same scheme-y glow in the Sixth Circle of Crypto Hell. The heretics fill this circle with fear, uncertainty, and doubt, preying on the dreams of frail souls too weak to ignore their falsehoods. They lived their lives with too many opinions and not enough skin in the game, and what greater punishment than more of the same without end? Forever they toil on the sidelines, texting you at 3 a.m., “Is now a good time to buy?” never to receive a response.'
    // },
    // 7: {
    //   title: 'violence',
    //   description: 'Hell hath no regulators: the Seventh Circle of Crypto Hell punishes the violent among us who cause reckless harm to others, themselves, and the almighty blockchain. Algorithmic skeletons of crypto lending bots bury the poor with insurmountable debt. Daemons of malicious nodes exploit weak contract code and drain them of blood. For their transgressions against nature, evil contracts are pointed at one another, cutting the other into pieces by re-entry attack again and again, without rest.'
    // },
    // 8: {
    //   title: 'fraud',
    //   description: 'As we approach the innermost reaches of Crypto Hell, we encounter the fraudsters evildoers who deceive for their own selfish gain. The Eighth Circle reeks of excrement from all the shitcoins that have gone down the Styx. It is crowded with imposters, the souls of forgotten opportunists who claimed to be Satoshi Nakamoto, tricksters with masks offering crypto giveaways too good to be true. Travelers passing through this circle often get lost following a bad MEW address and never find their way out.',
    // },
    // 0: {
    //   title: 'treachery',
    //   description: 'The Ninth Circle is the darqest and furthest point from the Ethereal One. Strangely, everything here looks the same. Those who make it this far wonder what, if anything at all, has changed. Forget changing the world; pledge your soul to me and the blockchain will give you whatever your heart desires: more power, more wealth, more fame, more knowledge. This final circle is devoid of anything human, save for a single, familiar voice that whispers in your ear, moonrise to sunset, until the end of your days.',
    // }
  }
}

export default initialState;
