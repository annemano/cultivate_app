questions = [
# "What was the best part of the day?",
# "When did I feel grateful today?",
# "What made me smile today",
# "What made me laugh out loud today?",
# "Who helped me today?",
# "Who was kind to me today?",
# "What insight did I gain today?",
# "What did I learn today?",
# "How am I better today than I was yesterday?",
# "What did I read or listen to today that added value to my life?",
# "How did technology make my life easier today?",
# "What activity did I most enjoy today?",
# "What was the most delicious thing I ate today?",
# "What did I enjoy listening to today?",
"What made me think, “That smells good!” today?",
# "What was pleasant to the touch today?",
"What beauty did I see today?",
# "What was one small victory I had today?",
# "What simple pleasure did I enjoy today?",
# "What act of kindness did I witness today?",
# "What did I create today?",
# "What skills did I use today?",
# "What strengths did I apply today?",
# "What weakness was I able to keep in check today?",
# "How was I able to help others today?",
# "How did I move an important goal forward today?",
# "How was my body an ally today?",
# "Who was I happy to meet with, chat with, or run into today?",
# "What compliment did I receive today?",
# "How did I feel appreciated today?",
# "Who showed me affection today?",
# "What positive emotions did I experience today?",
# "What negative thoughts, beliefs, or emotions was I able to release today?",
# "What opportunity presented itself today?",
# "What obstacle did I overcome today?",
# "What problem was I able to resolve today?",
# "What negative was I able to turn into a positive today?",
# "What’s the silver lining to something that went wrong today?",
# "What made me feel hopeful today?",
# "How was I awesome today?",
# "What positive habits did I engage in today?",
# "What negative habits was I able to avoid today?",
# "When did I feel love today?",
# "When was I at peace today?",
# "What did I do today that was fun?",
# "What was something playful I did today?",
# "How did I show myself compassion today?",
# "What positive things did I notice about my surroundings today?",
# "What made me appreciate my city, state (province), or country today?",
# "When did I feel a sense of abundance today?",
"How did I feel connected to others today?"
# "What is one positive thing I can say about today’s weather?",
# "What made me feel energized today?",
# "What made me happy to be alive today?"
]

# Destroy everything existing
Question.destroy_all
User.destroy_all
Entry.destroy_all
Community.destroy_all
CommunityMember.destroy_all
CommunityRequest.destroy_all
Message.destroy_all

#Create questions
questions.each do |question|
  Question.create!(
  content: question )
end

#Create Users
luis = User.create!(email: "luis@luis.com", password: "123456")
daniel = User.create!(email: "daniel@daniel.com", password: "123456")
annema = User.create!(email: "Anne-Marie@am.com", password: "123456")
jean = User.create!(email: "jean@jean.com", password: "123456")

# Create Daniel's and Luis's communities
dan_community = Community.create!(name: 'Gratitude Safe Space')
CommunityMember.create!(user: daniel, community: dan_community, owner: true)
luis_community = Community.create!(name: 'Luis & Daniel')
CommunityMember.create!(user: luis, community: luis_community, owner: true)

# Add Anne-Marie and Jean to Daniel's community
CommunityMember.create!(user: annema, community: dan_community)
CommunityMember.create!(user: jean, community: dan_community)

# Add messages to Daniel's community

Message.create!(content: 'This week is ROUGH at work, and it’s only Wednesday.',
    user: daniel,
    community: dan_community)
Message.create!(content: 'Ugh, I hear you. Want to share? ',
    user: annema,
    community: dan_community)
Message.create!(content: 'I think I just need a breather, I’m all in my head and I’m struggling to focus.',
    user: daniel,
    community: dan_community)
Message.create!(content: 'I’m about to go on a walk with Anne-Marie, come join!',
    user: jean,
    community: dan_community)
Message.create!(content: 'Yes! It’s beautiful outside!',
    user: annema,
    community: dan_community)
Message.create!(content: 'That might be just what I need..',
    user: daniel,
    community: dan_community)
Message.create!(content: 'Actually, yes that would be perfect, I’ll head over to yours and I’ll come with.',
    user: daniel,
    community: dan_community)
Message.create!(content: 'Perfect, see you soon, I’m looking forward to catching up while we walk.',
    user: jean,
    community: dan_community)
Message.create!(content: 'Thanks for thinking of this Jean, I was stuck but I’m already feeling a little better.',
    user: daniel,
    community: dan_community)

# Add community request for Daniel to Luis's community
CommunityRequest.create!(user: daniel, community: luis_community)

#Create 10 entries for Daniel

entry1 = Entry.create!(content: 'I had a tough morning today; I didn’t want to get out of bed.  I started question ‘why is the point of anything’ and the moment that happen Sparky, my dog, jumped on the bed.  He started licking me and just excited we are awake & alive together!!!  It gave me a little bit of meaning to my life.... I make him happy, safe and comfortable and in return he does the same in my time of need. https://static01.nyt.com/images/2018/03/14/well/dog-bed3/dog-bed3-articleLarge.jpg?quality=75&auto=webp&disable=upscale',
    user: daniel,
    mood: 2)
entry1.update(created_at: DateTime.new(2021,5,25))
entry2 = Entry.create!(content: 'It is so weird wanting to visit my hometown of Austin, Texas.  I thought I out grew it, that changed was needed in my life... but it made me realize that this amazing city will always be a part of me.  It is a beautiful jar which holds my family, friends and the best breakfast tacos in the world!!  I did not out grew Texas, it just grew enough in meto take with me anywhere in the world. https://media.nomadicmatt.com/2020/austinthings1.jpg ',
    user: daniel,
    mood: 2)
entry2.update(created_at: DateTime.new(2021,5,26))
entry3 = Entry.create!(content: 'Le Wagon coding bootcamp is coming to an end, and a new chapter is about to begin in my life.  At first, I came in thinking ‘I am a backend programmer.... It is my calling!!’ but now I am realizing I like the front part of development; design, Figma, the clients’ point-of-view, etc.  It is my strength, and Le Wagon taught me how important it is to the wholegrand development of software. https://miro.medium.com/max/12000/1*TUIoExeY_tZs4g79yHyqMg.jpeg ',
    user: daniel,
    mood: 3)
entry3.update(created_at: DateTime.new(2021,5,27))
entry4 = Entry.create!(content: 'Stuck is a weird feeling.  I am always on the move between cleaning, errands, school and with my partner.... I felt I ran around in a circle today, clocking 50-60 km, but made no actual self-progress.  I have to remind myself though ‘I know more today than of yesterday’ and ‘progress is about inches, not miles.... And I made a foot today!’  I done a lot in the last 9 weeks, it’s training for me to run that sprint to the next chapter in my life.',
    user: daniel,
    mood: 1)
entry4.update(created_at: DateTime.new(2021,5,28))
entry5 = Entry.create!(content: 'Breathe is life, and life in this world starts at first breathe... I have to remind myself to breathe. Today I almost had a panic attack and felt so overwhelmed. Luckily I had my favorite view to guide my breathe until I regain control of my life. https://www.youtube.com/watch?v=nmFUDkj1Aq0 ',
    user: daniel,
    mood: 5)
entry5.update(created_at: DateTime.new(2021,5,29))
entry6 = Entry.create!(content: 'I went for a run for the first time in forever today! It was not easy. I know that in the long run (pun intended) this is going to be best for me, but finding the motivation is hard. I did manage to take a nice picture of the sunrise:
https://unsplash.com/photos/61R_hvAup9w

While listening to this song:
https://open.spotify.com/track/7bzSMx7A6MjrHvk9MrH7yT?si=3ecbfe041d8e426e
',
    user: daniel,
    mood: 2)
entry6.update(created_at: DateTime.new(2021,5,30))
entry7 = Entry.create!(content: 'Still having issues with insomnia - I think I need a better bedtime routine to ease my body into sleep. Yesterday I tried some yoga - it was not a miracle but I didn’t hate it either. I’ll try it again tonight.
https://youtu.be/v7SN-d4qXx0
',
    user: daniel,
    mood: 6)
entry7.update(created_at: DateTime.new(2021,5,31))
entry8 = Entry.create!(content: 'Not a great day today, but I can’t manage to figure out why. It’s frustrating. I know I have to learn how to live with these feelings and accept them, but it’s hard. I’ll order some sushi and watch Netflix, give my brain a break.',
    user: daniel,
    mood: 4)
entry8.update(created_at: DateTime.new(2021,6,1))
entry9 = Entry.create!(content: 'I did not sleep well last night and I was feeling a bit groggy the whole morning. But then my coworker Luis showed up and gave me a nice iced latte. I am grateful for having such a caring colleague.
https://unsplash.com/photos/dB3-p5Nr-KA
I also have to keep an eye on Luis, I think he’s not feeling well lately. I should return the gesture.
',
    user: daniel,
    mood: 3)
entry9.update(created_at: DateTime.new(2021,6,2))
entry10 = Entry.create!(content: 'This morning I was walking to work and this song came up in a random Spotify playlist I was listening to. It put me in a really good mood for some reason, and I had it play on repeat all day!
https://open.spotify.com/track/3nenAZ6zH1Aaj4kpDtHotn?si=37280c0a9d73427c
',
    user: daniel,
    mood: 2)
entry10.update(created_at: DateTime.new(2021,6,3))
