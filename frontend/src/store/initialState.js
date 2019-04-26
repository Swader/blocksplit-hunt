const initialState = {
  // grid: [
  //   [1, 2, 3],
  //   [4, 0, 5],
  //   [6, 7, 8],
  // ],
  grid: [
    [1, 2, 3,
    4, 5, 6,
    7]
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
      6: false,
      7: false,
      // 8: false,
    }
  },
  tokenInformation: {
    open: false,
    help: false,
    activeNumber: 3,
    1: {
      title: 'Out-of-Palace Experience',
      description: "Most of you probably know what the out-of-body experience is, the experience in which a person seems to perceive the world from a location outside their physical body. But what is an out-of-palace experience? Is it possible to experience the inside of the palace from... outside?",
    },
    2: {
      title: 'The Emperor\'s Stage',
      description: "Today, when someone says he is on the stage you're probably thinking about the theater, concert or a stand-up comedy. Guess what, no time for fun when you're the emperor. Gather your troops on the central square and make them listen to your words! Find the border between the palace's central square and the beautiful entrance to the emperor's apartment. That's where you'll find the key, and that's where Diocletian was holding his speeches.",
    },
    3: {
      title: 'Corner Cheers',
      description: "At the northwest part of the palace there are a bunch of cool bars where both locals and foreigners drink their morning coffee or evening drinks. The murmur you can hear there is so addictive it'll keep you coming back. There's the one bar that's a little bit different - it has the tradition, it has the story, it has the 90 degrees angle. Yeah, it sounds weird but if you find a bar 'on the corner' you'll find the key you need! Grab a drink while you're at it! Tip: ask a local how you say 'corner'.",
    },
    4: {
      title: 'Minas Tirith',
      description: "Grgur Ninski, or Greg of Nin, imposingly lifts his finger to both warn and guide you. Speak, friend, and enter. The gates are already open - it's your turn to mine this gold."
    },
    5: {
      title: 'Folks, let\'s meet',
      description: "Tick tock, tick tock, go find the clock. This clock is a little... different from those you're used to. It's ornamental, old, and has 24 points on it as opposed to 12, which makes a full circle last an entire day rather than 12 hours."
    },
    6: {
      title: 'Bajamonti Fountain',
      description: 'Citta del avvenire\' or \'The city of future\' translated from Italian, is the popular phrase told by Mr. Antonio Bajamonti, one of the most famous mayors of the city of Split. At the west end of Riva, you can find a big Square which is famous for Bajamonti\'s restaurant and bar. When you take a look from that square towards the sea, you\'ll see why he was thinking about the city of the future, a city with this fabulous view deserves to be \'the next one\'. Also, you\'ll see a dancing fountain. Not so big, not so loud, but beautiful in its own way. Go closer and make a wish, maybe there\'s a key around.'
    },
    7: {
      title: 'Beerstrophobia',
      description: 'Sitting at the dock and drinking a beer: a common image on the Matejuska dock. The key you\'re looking for is in a claustrophobic beer shop. You\'ll know it when you see it. Grab the beer, grab the key, and run back for some chest unlocking!'
    },
    // 8: {
    //   title: 'fraud',
    //   description: 'As we approach the innermost reaches of Crypto Hell, we encounter the fraudsters evildoers who deceive for their own selfish gain. The Eighth Circle reeks of excrement from all the shitcoins that have gone down the Styx. It is crowded with imposters, the souls of forgotten opportunists who claimed to be Satoshi Nakamoto, tricksters with masks offering crypto giveaways too good to be true. Travelers passing through this circle often get lost following a bad MEW address and never find their way out.',
    // },
    // 0: {
    //   title: 'treachery',
    //   description: 'The Ninth Circle is the darqest and furthest point from the Ethereal One. Strangely, everything here looks the same. Those who make it this far wonder what, if anything at all, has changed. Forget changing the world; pledge your soul to me and the blockchain will give you whatever your heart desires: more power, more wealth, more fame, more knowledge. This final circle is devoid of anything human, save for a single, familiar voice that whispers in your ear, moonrise to sunset, until the end of your days.',
    // }
  }
};

export default initialState;
