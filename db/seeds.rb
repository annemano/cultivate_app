questions = ["What was the best part of the day?",
"When did I feel grateful today?",
"What made me smile today",
"What made me laugh out loud today?",
"Who helped me today?",
"Who was kind to me today?",
"What insight did I gain today?",
"What did I learn today?",
"How am I better today than I was yesterday?",
"What did I read or listen to today that added value to my life?",
"How did technology make my life easier today?",
"What activity did I most enjoy today?",
"What was the most delicious thing I ate today?",
"What did I enjoy listening to today?",
"What made me think, “That smells good!” today?",
"What was pleasant to the touch today?",
"What beauty did I see today?",
"What was one small victory I had today?",
"What simple pleasure did I enjoy today?",
"What act of kindness did I witness today?",
"What did I create today?",
"What skills did I use today?",
"What strengths did I apply today?",
"What weakness was I able to keep in check today?",
"How was I able to help others today?",
"How did I move an important goal forward today?",
"How was my body an ally today?",
"Who was I happy to meet with, chat with, or run into today?",
"What compliment did I receive today?",
"How did I feel appreciated today?",
"Who showed me affection today?",
"What positive emotions did I experience today?",
"What negative thoughts, beliefs, or emotions was I able to release today?",
"What opportunity presented itself today?",
"What obstacle did I overcome today?",
"What problem was I able to resolve today?",
"What negative was I able to turn into a positive today?",
"What’s the silver lining to something that went wrong today?",
"What made me feel hopeful today?",
"How was I awesome today?",
"What positive habits did I engage in today?",
"What negative habits was I able to avoid today?",
"When did I feel love today?",
"When was I at peace today?",
"What did I do today that was fun?",
"What was something playful I did today?",
"How did I show myself compassion today?",
"What positive things did I notice about my surroundings today?",
"What made me appreciate my city, state (province), or country today?",
"When did I feel a sense of abundance today?",
"How did I feel connected to others today?",
"What is one positive thing I can say about today’s weather?",
"What made me feel energized today?",
"What made me happy to be alive today?"]

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
12.times do
  Message.create!(content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
    user: [daniel, jean, annema].sample,
    community: dan_community)
end

# Add community request for Daniel to Luis's community
CommunityRequest.create!(user: daniel, community: luis_community)

#Create 12 entries for Daniel
12.times do
  Entry.create!(content: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
    user: daniel,
    mood: rand(1..6))
end
