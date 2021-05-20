# GET A QUOTE! (IOS App)
This project is the IOS version of the web application [GET A QUOTE](https://github.com/adrienhongcs/GET_A_QUOTE). Since the IOS app consumes the same REST api service as the web app, they both interact with the same data and display the same content (look [here](https://github.com/adrienhongcs/GET_A_QUOTE) to better understand how the server is set up).

**This project uses Swift, SwiftUI, and the MVVM design pattern to build a reactive User Interface.**

## OVERVIEW
<img width="777" alt="Screen Shot 2021-05-19 at 10 53 41 PM" src="https://user-images.githubusercontent.com/64567338/118911989-17c1b080-b8f5-11eb-9085-2ccbef32bb92.png">
<p>The user is shown a random famous quote where they can click on <i>"Get Another Random Quote"</i> to be shown another quote.</p>
        
<img width="778" alt="Screen Shot 2021-05-19 at 11 11 02 PM" src="https://user-images.githubusercontent.com/64567338/118913453-81db5500-b8f7-11eb-951e-55ee4a6548be.png">
<p>The user can navigate to another tab where a list of all the quotes is displayed. When <i>"Add"</i> is clicked, a modal shows up where the user can add a quote. By clicking on <i>"Refresh"</i>, the newly created quote will now be displayed on the list.</p>

<img width="525" alt="Screen Shot 2021-05-19 at 11 23 38 PM" src="https://user-images.githubusercontent.com/64567338/118914453-42ae0380-b8f9-11eb-8fd2-4a3c93e48fb0.png">
<p>The user can swipe on any quote in the list to delete them. As mentionned previously, any changes made in the app will persist and also be reflected in the web application and the database.</p>

## POTENTIAL IMPROVEMENTS
- Add animations and transitions for a better user experience.
- Add paginations to the list of quotes as it grows overtime.
- Offer different options in sorting the list of quotes.
- Change access to RESTful API so that users can't add quotes, and develop a web scraper to use existing resources to enter famous quotes into the database

