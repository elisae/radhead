Radhead
=======

### Intro
Back back back in the days I had a little "business", making logos, flyers, websites and stuff, mostly for friends and family. I never worked really hard on it, but I was (and still am, for that matter) flirting with the idea of making it into a second pillar that actually generates some income. In the light of this, and also because I needed *something* to show for internship applications, I started creating a **portfolio** – my very first own web project, I think.

### Disclaimer
Haven't touched it since, what, 2015? – but it's still being hosted somewhere and you're welcome to take a look: [radhead.de](http://radhead.de/ "TechCrunch Article").   
As stated on the welcome screen, it is not considered finished; both in terms of the page itself (structure, usability, and so on) and the content.

### Features
Mainly, it features **photographs** and some other **graphic stuff** that I made. I used to be especially proud of the Instagram integration, but since they [shut down their API](https://techcrunch.com/2015/11/17/just-instagram/ "TechCrunch Article") a while ago, it doesn't work any more.  

Additionally, and that's the part I'm still relatively confident with, you can find my JavaScript implementation of the game **_Mastermind_** over there. Not sure if the algorithm is the best, the drag'n'drop doesn't work on touch screens, but I think it's pretty, and fun :)  
*[Next step is to add some AI to it.]*

#### Structure
If I recall correctly, I had the **images** stored on the same server, but all meta data in a database – loading both **dynamically** from a simple **API**.  
For convenience, I had also built myself a little **upload-area** that allowed me to enter the meta data together with the image itself in a web form. Thumbnails were created automatically by the **PHP backend**, too.  
The rest is not that special: **static hosting**, *Bootstrap*, *Lightbox* (super retro, I know) and a category filtered image grid.