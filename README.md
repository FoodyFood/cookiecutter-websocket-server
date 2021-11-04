# FoodyFood's Websocket Backend CookieCutter

I found myself creating the same basic folder layouts quite often.

They always featured helm, dockerfiles, some makefile and a readme.

So I decided to make myself some cookie cutters to get these rough templates thrown together quicker.

### What Does It Do

Out of the box it will create a folder structure typical of most projects

![folder-structure](docs/folder-structure.PNG)


If you type make all, it will build you a docker image locally, push it to your github container registry, and attempt to install it using a helm chart on your default cluster (kubectl config get-contexts)

![make-all](docs/make-all.PNG)


Once you install this in a cluster using the helm chart, it will function as a websocket server (using socket.io) that relays any messages it recieves.


### Using The CookieCutter

To get started, install cookiecutter
```bash
pip install cookiecutter
```

Then run
```bash
https:
cookiecutter https://github.com/foodyfood/cookiecutter-websocket-server
ssl:
cookiecutter git@github.com:foodyfood/cookiecutter-websocket-server.git
```

It will ask you 3 questions, your GitHub username, the name of your website, and the website URL.

![using-cookiecutter](docs/using-cookiecutter.PNG)


If you press 'ENTER' it will use these defaults
```bash
github_username: foodyfood
name delicious-food
website_url delicious.foodyfood.cloud
```

Finally, this will have created a project in the directory your terminal was open in
and you can build and deploy your project by typing this in the folder it created
```bash
make all
```

