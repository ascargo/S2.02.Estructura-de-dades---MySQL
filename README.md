# S2.02.Estructura-de-dades---MySQL
Description
We will model several entity-relationship diagrams.

Level 1
Exercise 1 – Optician
An optician, called “Cul d’Ampolla,” wants to digitalize the management of clients and the sale of eyeglasses.

First, the optician wants to know the supplier of each pair of eyeglasses. Specifically, for each supplier, they want to know: the name, address (street, number, floor, door, city, postal code, and country), phone, fax, and tax ID (NIF).

The optician's purchasing policy is that glasses from a particular brand are bought from a single supplier (to get better prices), but a supplier can offer glasses from multiple brands. For each pair of glasses, they want to store: the brand, the prescription of each lens, the type of frame (rimless, plastic, or metal), the color of the frame, the color of each lens, and the price.

For clients, the following data should be stored: name, postal address, phone number, email, and registration date.
When a new client arrives, store the client who recommended the establishment (if someone did).
The system must indicate which employee sold each pair of glasses. Define a time period for sales.

Exercise 2 – Pizzeria
You’ve been hired to design a website that allows customers to order food online for home delivery.

Take into account the following indications to model the project’s database:

For each client, store a unique identifier, name, surname(s), address, postal code, city, province, and phone number.
A person can place many orders, but each order can only be placed by one person.
For each order, store a unique identifier, date/time, whether the order is for delivery or pickup, the quantity of each type of product selected, and the total price.

An order can consist of one or several products.

Products can be pizzas, burgers, or drinks. For each product, store a unique identifier, name, description, image, and price.

For pizzas, there are various categories that may change names throughout the year. A pizza can only belong to one category, but a category can contain many pizzas.

For each category, store a unique identifier and name.
An order is handled by one store, and a store can handle many orders.
For each store, store a unique identifier, address, postal code, city, and province.

Many employees can work at a store, but each employee can only work at one store. For each employee, store a unique identifier, name, surname(s), tax ID (NIF), and phone number.
Specify whether they work as a cook or a delivery person. For delivery orders, it's important to store who delivered the order and the date/time of the delivery.

Level 2
Exercise 1 – YouTube
We’ll try to create a simple model of how a database for a simplified version of YouTube might look.

For each user, store a unique identifier, email, password, username, date of birth, gender, country, and postal code.

A user uploads videos. For each video, store a unique identifier, a title, a description, size, video file name, video duration, a thumbnail, number of views, number of likes, and number of dislikes.

A video can have three different states: public, unlisted, or private. A video can have many tags. Each tag is identified by a unique ID and a tag name.
Store which user uploaded the video and the date/time it was uploaded.

A user can create a channel. A channel has a unique identifier, a name, a description, and a creation date.

A user can subscribe to other users' channels.
A user can give a like or dislike to a video only once.
You must keep track of which users liked or disliked a specific video and the date/time it occurred.

A user can create playlists with their favorite videos. Each playlist has a unique identifier, a name, a creation date, and a visibility status (public or private).

A user can write comments on a specific video. Each comment has a unique identifier, the text of the comment, and the date/time it was made.

A user can mark a comment as liked or disliked. You must track which users marked a comment as liked/disliked and the date/time it happened.

Level 3
Exercise 1 – Spotify
We’ll try to create a simple model of the necessary database for Spotify.

There are two types of users: free and premium. For each user, store a unique identifier, email, password, username, date of birth, gender, country, and postal code.

Premium users have subscriptions. The data needed for each subscription is: start date, renewal date, and a payment method (credit card or PayPal).

For credit cards, store the card number, expiration month and year, and the security code.
For PayPal users, store their PayPal username.
Track all the payments a premium user has made during their subscription. For each payment, store the date, a unique order number, and the total amount.

A user can create many playlists. For each playlist, store: a title, the number of songs it contains, a unique identifier, and a creation date.

When a user deletes a playlist, it is not removed from the system—it is marked as deleted. This allows the user to recover it later if deleted by mistake. You must also store the date it was marked as deleted.

There are two types of playlists: active and deleted.
An active playlist can be shared with other users, meaning others can add songs to it.
For a shared playlist, it is necessary to know which user added each song and on what date.

A song can only belong to one album.
An album can contain many songs.
An album is published by a single artist.
An artist can publish many albums.
For each song, store a unique identifier, a title, duration, and the number of times it has been played.

For each album, store a unique identifier, title, year of release, and a cover image.
For each artist, store a unique identifier, name, and an image of the artist.

A user can follow many artists. An artist can be related to other artists with similar music.
This allows Spotify to show related artists to users.

Also track which albums and songs are marked as favorites by a user. A user can mark many albums and many songs as favorites.

NOTE:
Once the databases are created, we will populate the tables with test data to verify that the relationships are correct.

Requirements
To verify your design is correct, perform the following queries and check that they return accurate results:

Optician:

List the total purchases made by a client.

List the different glasses sold by an employee during a year.

List the different suppliers that provided glasses successfully sold by the optician.

Pizzeria:

List how many “Drink” products have been sold in a specific city.

List how many orders have been processed by a specific employee.

Objectives
Learn how to model SQL databases.

Duration: 4 days
Submission:
Create a repository on github.com called mysql-estructura containing the solution. For each database, the following must be uploaded:

A Relational Model showing the database design. You may use draw.io, dbdiagram.io, MySQL Workbench, or any tool that allows you to draw and export the structure as a PNG or JPG (to upload to the repository). We particularly recommend genmymodel.com.

A .sql script for creating and loading the database.
