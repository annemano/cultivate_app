## Introduction
This is an MVP of a gratitude journal app called Cultivate. It was built over 9 days at Le Wagon coding bootcamp (spring 2021) with a team of 4 (@jean-colombel, @danielsilverman, Luis Batista and myself).

## Highlights
Some of the main work I've done on the app:
- Co-responsible for the back-end of the app (database, MVC, routes, etc.)
- Created a multi-step form wizard to enable a better user experience with the guided entry: had to create its own model and controller in order to make use of ActionText, and styled it with Javascript to make the feature more interactive
- Implemented custom Youtube and Spotify media embed in Trix Editor, which required their own models, views and controllers + JS functions, and integrated a doodling option inspired by Philipp Rohe's [CodePen](https://codepen.io/BananaCoding/pen/mdrGjpL)
- Implemented the necessary actions to enable entry sharing in communities
- Built the front-end for the homepage (mood options) and ensured the mood selection is persisted across the app so it can be connected to an entry
- Managed the backlog on Trello

## Improvements Needed
Now that we have graduated the bootcamp, I'd like to make the following improvements:
- Make it responsive (was built only with mobile view in mind)
- Implement pundit to manage authorizations across the app, especially in the communities
- Improve the search option when creating a new Community
- Possibility to filter posts


(Rails app generated with [lewagon/rails-templates](https://github.com/lewagon/rails-templates), created by the [Le Wagon coding bootcamp](https://www.lewagon.com) team.)
