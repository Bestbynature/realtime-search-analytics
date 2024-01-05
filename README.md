<a name="readme-top"></a>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [📖 RealTime Search](#-about-project-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install](#install)
    - [Usage ](#usage-)
    - [Run tests ](#run-tests-)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [📝 License ](#-license-)

<!-- PROJECT DESCRIPTION -->

# 📖 [RealTime Search] <a name="about-project"></a>

**[RealTime Search](#)** is a robust Ruby on Rails project designed to provide users with seamless real-time article search capabilities. Leveraging the power of the searchkick gem, this platform harnesses Elasticsearch to index articles, enabling swift and accurate searches.

The searchkick gem offers advanced features like fuzzy search, ensuring search results remain comprehensive even with misspelled queries. Moreover, it facilitates partial search functionality, returning relevant results for queries that are partial matches to article titles.

To optimize performance and database efficiency, the platform handles search queries adeptly. While all search queries are initially logged in the database, only complete queries are permanently stored. This strategy prevents the accumulation of partial queries, avoiding the pyramid problem. The system also maintains a count of how frequently each search query is made.

At the forefront of the user experience is the curated display of the top 10 search queries on the home page. These queries are ranked based on their popularity, which is determined by the frequency of searches. To ensure freshness and relevance, these search queries are updated every 5 minutes.

Behind the scenes, the search query updates are managed via a robust background job mechanism implemented using the Sidekiq gem. Sidekiq enables the asynchronous execution of background jobs and provides built-in mechanisms for job retries upon failure. Additionally, it offers extensive configuration options, including queue latency history management, granularity settings, bucket management, and maximum queue latency history size. This setup ensures the seamless and efficient execution of search query updates while maintaining system reliability and performance.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Server Side</summary>
  <ul>
    <li>RUBY</li>
    <li>RAILS</li>
  </ul>

  <summary>Client Side</summary>
  <ul>
    <li>Sidekiq</li>
    <li>Searchkick</li>
    <li>Elasticsearch</li>
    <li>Faker</li>
    <li>Rspec</li>
    <li>Rubocop</li>
    <li>Bootstrap</li>
    <li>sqlite</li>
    <li>Docker</li>
  </ul>
  
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

- **[Elastic search]**
- **[Faker Gem]**
- **[Search kick]**
- **[Docker]**


<p align="right">(<a href="#readme-top">back to top</a>)</p>

## LIVE DEMO

Not available at the moment due to the fact that the project has time constraints and the fact that free tier of heroku has been cancelled. Given more time, Another service can be used to host the project.

However, detailed steps would be gven below showing how to run the project locally.


<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Prerequisites

In order to run this project you need:

<ul>
    <li>To have Git installed on your local machine</li>
    <li>WSL or linux operating system</li>
    <li>An editor such as Visual Studio Code linked to your wsl</li>
    <li>Ruby 3.x.x</li>
    <li>Rails 7.x.x</li>
    <li>docker desktop client</li>
  </ul>
  
<p align="right">(<a href="#readme-top">back to top</a>)</p>

### Setup ===> The steps must be followed to the letter <a name="setup"></a>
- [x] Install docker desktop client: download and install docker desktop client from [here](https://www.docker.com/products/docker-desktop)
- [x] Install WSL or linux operating system: download and install WSL or linux operating system from [here](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
- [x] Install Ruby 3.x.x: download and install Ruby 3.x.x from [here](https://www.ruby-lang.org/en/downloads/)
- [x] Install Rails 7.x.x: download and install Rails 7.x.x from [here](https://rubyonrails.org/)
- [x] Install an editor such as Visual Studio Code linked to your wsl: download and install Visual Studio Code from [here](https://code.visualstudio.com/download)
- [x] Install Git: download and install Git from [here](https://git-scm.com/downloads)

-------------------------------------------------------------------------------------
- [x] open the docker desktop client app
open Ubuntu terminal and run the following commands to start the docker container
```sh
 docker run -d -p 127.0.0.1:9200:9200 -p 127.0.0.1:9300:9300 -e "discovery.type=single-node" docker.elastic.co/elasticsearch/elasticsearch:7.17.8
```
- [x] open your browser and type "localhost:9200" to view the elasticsearch server
- [x] Clone this repository to your desired folder in wsl or linux operating system
- [x] Open the project folder in your editor (VS Code)
- [x] Run "bundle install" to install all the gems
- [x] Run "rails db:create" to create the database
- [x] Run "rails db:migrate" to migrate the database
- [x] Run "rails db:seed" to seed the database
- [x] Run "bin/dev" to start the server
- [x] Open your browser and type "localhost:3000" to view the project


  
  <p align="right">(<a href="#readme-top">back to top</a>)</p>

### Install

To install this project, run

```sh

bundle install

```


### Run tests <a name="run-tests"></a>

To run tests, run the following command:

```sh

Run "rspec" to run tests

```


```sh

Run "rubocop -A" to fix linters
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- AUTHORS -->

## 👥 Author <a name="authors"></a>
 
 
👤 **Author: Damilare**

- GitHub: [@githubhandle](https://github.com/Bestbynature)
- Twitter: [@twitterhandle](https://twitter.com/Dammybest)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/damilareismailabestbynature/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- [ ] **[A feature for updating search trend every five minutes]**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project, you may [buy me](buymeacoffee.com/Dammylare) a coffee.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to use this medium to appreciate [Microverse](https://microverse.org)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
