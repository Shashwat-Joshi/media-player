List musicNames = [
  "A Great Big World, Christina Aguilera - Say Something",
  "Chet Faker - Talk Is Cheap",
  "Childish Gambino - Feels Like Summer",
  "Chris Isaac - Wicked Game (ft. Seren)(Chillion Remix)",
  "Coldplay - The Scientist",
  "Conor Maynard - Can't Say No",
  "Elephant Heart - The Digital",
  "Lana Del Rey - Summertime Sadness",
  "Lena - Don't Lie To Me",
  "Lena - Skinny Bitch",
  "Lena - Wild & Free",
  "Machine Gun Kelly - Let You Go",
  "Major Lazer & DJ Snake - Lean On (feat. MØ)",
  "Paolo Nutini - Candy",
  "Paolo Nutini - Iron Sky",
  "Paolo Nutini - Scream",
  "Snakehips, MØ - Redbone",
  "The Chainsmokers - Sick Boy",
  "Twinjabi - Rani Recognize"
];

List<String> name = [
  "A Great Big World",
  "Talk Is Cheap",
  "Feels Like Summer",
  "Wicked Game (ft. Seren)",
  "The Scientist",
  "Can't Say No",
  "The Digital",
  "Summertime Sadness",
  "Don't Lie To Me",
  "Skinny Bitch",
  "Wild & Free",
  "Let You Go",
  "Lean On (feat. MØ)",
  "Candy",
  "Iron Sky",
  "Scream",
  "Redbone",
  "Sick Boy",
  "Rani Recognize"
];

musicUrl(int i) {
  return "https://music123.s3.ap-south-1.amazonaws.com/${musicNames[i]}.mp3";
}
