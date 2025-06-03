import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favorites_provider.dart';
import 'cart_model.dart';


class CategoryBooksPage extends StatefulWidget {
  final String category;

  const CategoryBooksPage({super.key, required this.category});

  @override
  State<CategoryBooksPage> createState() => _CategoryBooksPageState();
}

class _CategoryBooksPageState extends State<CategoryBooksPage> {
  String searchQuery = '';

  // You can now manually define each book's title, author, price, and local image
  final Map<String, List<Map<String, String>>> booksByCategory = {
    "Science Fiction": [
      {
        "title": "The Martian",
        "author": "Andy Weir",
        "price": "12.99",
        "image": "img/book1.JPG",
         "description": "Astronaut Mark Watney is stranded alone on Mars after a storm forces his crew to leave, thinking he's dead. With no way to contact Earth and limited supplies, survival seems impossible. But relying on his engineering skills and determination, Mark fights to stay alive, tackling each life-threatening challenge with ingenuity and grit."
        
      },
      {
        "title": "Station Eleven",
        "author": "Emily St. John Mandel",
        "price": "11.99",
        "image": "img/book2.JPG",
         "description":"After a devastating pandemic collapses civilization, a group of survivors struggles to preserve art and humanity. The story weaves between past and present, following an actor’s troupe and the legacy of a famous actor. It’s a haunting, lyrical reflection on memory, loss, and survival."
      },
      {
        "title": "Nineteen Eighty-Four",
        "author": "George Orwell",
        "price": "14.50",
        "image": "img/book3.JPG",
        "description":"In a dystopian world ruled by a totalitarian regime, Big Brother watches every move. Winston Smith dares to question the oppressive system, risking everything for truth and freedom. Orwell's chilling vision explores surveillance, censorship, and control."
      },
      {
        "title": "Dune",
        "author": "Frank Herbert",
        "price": "13.50",
        "image": "img/book4.JPG",
        "description":"On the desert planet Arrakis, young Paul Atreides becomes the center of a battle over the precious spice, melange. As politics, prophecy, and power collide, he rises as a messianic figure. Dune is a sweeping epic of ecology, religion, and destiny."
      },
      {
        "title": "The Hunger Games",
        "author": "Suzanne Collins",
        "price": "13.50",
        "image": "img/book5.JPG",
         "description":"In a brutal future society, Katniss Everdeen volunteers to fight in a televised death match to save her sister. As she becomes a reluctant symbol of rebellion, she must navigate violence, manipulation, and survival. The story critiques power, spectacle, and resistance."
      },
      {
        "title": "The Three-Body Problem",
        "author": " Liu Cixin",
        "price": "14.50",
        "image": "img/book6.JPG",
        "description":"Scientists begin dying under mysterious circumstances, linked to a secret virtual game and alien contact. As Earth faces a cosmic threat, humanity must confront its own divisions and potential. It’s a mind-bending sci-fi epic that blends physics, philosophy, and first contact."
      },
       {
        "title": "Frankenstein",
        "author": " Mary Shelley",
        "price": "15.50",
        "image": "img/book7.JPG",
         "description":"Victor Frankenstein creates a living being from dead matter, only to recoil from his own creation. The creature, intelligent and shunned, seeks understanding and vengeance. Shelley’s novel explores ambition, isolation, and the consequences of playing god."
      },

      {
        "title": "Blindsight",
        "author": "Peter Watts",
        "price": "11.50",
        "image": "img/book8.JPG",
         "description":"A team of specialists is sent to investigate a mysterious alien signal near the edge of the solar system. Among them is a vampire and a man with half a brain, navigating a chilling first contact. Blindsight is a hard sci-fi exploration of consciousness, identity, and what it means to be human."
      },
      {
        "title": "The Calculating Stars",
        "author": "Mary Robinette Kowal",
        "price": "15.50",
        "image": "img/book9.JPG",
         "description":"After a meteorite strike accelerates climate change, humanity races to colonize space. Elma York, a brilliant mathematician and pilot, fights sexism to become one of the first lady astronauts. It's a hopeful alternate history that blends science, resilience, and social progress."
      },
       {
        "title": "Ready Player One",
        "author": "Ernest Cline",
        "price": "16.50",
        "image": "img/book10.JPG",
         "description":"In a dystopian future, people escape reality through a virtual world called the OASIS. Teenager Wade Watts joins a high-stakes quest to solve a puzzle left by the game’s creator. Packed with pop culture and action, it’s a nostalgic adventure about identity, technology, and resistance."
      },
       {
        "title": "The Forever War",
        "author": "Joe Haldeman",
        "price": "13.50",
        "image": "img/book11.JPG",
         "description":"Soldier William Mandella fights in a centuries-long war against alien forces, experiencing extreme time dilation. As decades pass in moments, he returns to a vastly changed Earth. It’s a powerful critique of war, alienation, and the costs of service."
      },
      {
        "title": "Brave New World",
        "author": "Aldous Huxley",
        "price": "16.50",
        "image": "img/book12.JPG",
         "description":"In a future society obsessed with control and pleasure, individuality is suppressed in favor of social stability. When a savage from outside the system enters the civilized world, everything is questioned. Huxley’s classic dystopia explores conformity, technology, and the loss of humanity."
      },
      {
        "title": "The Fifth Season",
        "author": "N. K. Jemisin",
        "price": "16.50",
        "image": "img/book13.JPG",
         "description":"In a world plagued by apocalyptic geological disasters, powerful individuals called orogenes are both feared and exploited. Essun, an orogene mother, searches for her daughter while society collapses around her. It’s a gripping, genre-defying tale of oppression, resilience, and survival."
      },
      {
        "title": "Exhalation",
        "author": "Ted Chiang",
        "price": "14.50",
        "image": "img/book14.JPG",
         "description":"This collection of thought-provoking stories explores time, free will, consciousness, and the limits of human understanding. Each tale blends emotional depth with scientific curiosity. Chiang’s writing is introspective, elegant, and deeply philosophical."
      },
      {
        "title": "2001: A Space Odyssey",
        "author": "Arthur C. Clarke",
        "price": "17.50",
        "image": "img/book15.JPG",
         "description":"The series follows humanity’s journey through space, spurred by the discovery of a mysterious monolith. As explorers venture deeper into the cosmos, they encounter alien intelligence and face profound questions about existence. Clarke blends hard science fiction with philosophical exploration, asking what it means to be human in an infinite universe."
      },
      // Add up to 15 books like this
    ],

    "Self-Help": [
      {
        "title": "Atomic Habits",
        "author": "James Clear",
        "price": "11.99",
        "image": "img/book16.JPG",
        "description":"Atomic Habits by James Clear shows how tiny changes can lead to big results. It offers practical tips to build good habits and break bad ones. The focus is on creating systems for lasting improvement."


      },
      {
        "title": "7 Habits of Highly Effective People",
        "author": "Stephen R. Covey",
        "price": "12.99",
        "image": "img/book17.JPG",
        "description":"The 7 Habits of Highly Effective People by Stephen R. Covey is a self-help classic focused on personal and professional growth. It outlines key habits like being proactive and prioritizing what matters most. The book promotes values-based living for long-term success."
      },
       {
        "title": "How to Win Friends & Influence People",
        "author": "Dale Carnegie",
        "price": "12.99",
        "image": "img/book18.JPG",
        "description":"How to Win Friends & Influence People by Dale Carnegie teaches timeless principles for better communication and relationships. It emphasizes empathy, active listening, and genuine appreciation. The book helps readers gain influence through kindness and respect."
      },
      {
        "title": "The Four Agreements",
        "author": "Don Miguel Ruiz",
        "price": "13.99",
        "image": "img/book19.JPG",
        "description":"A practical guide rooted in ancient Toltec wisdom, this book offers four simple yet powerful agreements to live by. It encourages honesty, self-awareness, and emotional freedom. The message promotes inner peace and personal growth through mindful choices."
      },
      {
        "title": "Man's Search for Meaning",
        "author": "Viktor Frankl",
        "price": "12.99",
        "image": "img/book20.JPG",
         "description":"This profound memoir explores life in Nazi concentration camps through the eyes of a psychiatrist. It reveals how finding purpose can help endure even the darkest suffering. The core message is that meaning, not comfort, drives human fulfillment."
      },
      {
        "title": "Rich Dad Poor Dad",
        "author": " Robert T. Kiyosaki and Sharon Lechter.",
        "price": "13.99",
        "image": "img/book21.JPG",
         "description":"This book contrasts two mindsets about money through the stories of two father figures. It teaches financial literacy, investing, and building wealth outside traditional paths. The focus is on thinking differently to achieve financial independence."
      },
      {
        "title": "The Let Them Theory",
        "author": " Mel Robbins",
        "price": "24.99",
        "image": "img/book22.JPG",
         "description":"This mindset encourages letting people do what they want without trying to control or correct them. It promotes peace by accepting that others' actions reflect their choices, not your worth. The theory is about setting boundaries and focusing on your own energy."
      },
      {
        "title": "The Power of Now",
        "author": "Eckhart Tolle",
        "price": "22.99",
        "image": "img/book23.JPG",
         "description":"This spiritual guide teaches the importance of living fully in the present moment. It helps readers break free from overthinking and ego-driven patterns. The core message is that true peace and happiness exist only in the now."
      },
       {
        "title": "Think and Grow Rich",
        "author": "Napoleon Hill and Rosa Lee Beeland",
        "price": "21.99",
        "image": "img/book24.JPG",
         "description":"This classic explores how mindset and belief shape financial and personal success. It combines desire, faith, and persistence as keys to achieving goals. The book emphasizes that success starts with focused thoughts and a clear purpose."
      },
      {
        "title": "The Magic of Thinking Big",
        "author": "David Schwartz",
        "price": "21.99",
        "image": "img/book62.JPG",
        "description":"This book teaches that thinking bigger leads to greater success and confidence. It encourages bold goals and positive attitudes to overcome fear and doubt. The core idea is that mindset shapes your achievements."
      },
      {
        "title": "Big Magic",
        "author": "Elizabeth Gilbert",
        "price": "18.99",
        "image": "img/book25.JPG",
         "description":"This book inspires embracing creativity without fear or perfectionism. It encourages curiosity, courage, and joy in the creative process. The message is to live a more creative and fulfilling life by unlocking your true potential."
      },
       {
        "title": "The Alchemist",
        "author": "Paulo Coelho",
        "price": "14.99",
        "image": "img/book26.JPG",
         "description":"A young shepherd embarks on a journey to find his personal legend and fulfill his dreams. Along the way, he learns about listening to his heart and recognizing signs from the universe. The story highlights the importance of following your passion and trusting the journey."
      },
       {
        "title": "The 48 Laws of Power",
        "author": " Robert Greene",
        "price": "15.99",
        "image": "img/book27.JPG",
        "description":"This book reveals strategies used throughout history to gain and maintain power. It teaches lessons on influence, manipulation, and social dynamics. The focus is on understanding power to protect yourself and achieve your goals."
      },
      {
        "title": "Who Moved My Cheese?",
        "author": "Dr. Spencer Johnson",
        "price": "15.99",
        "image": "img/book28.JPG",
         "description":"A simple story about dealing with change and uncertainty in life and work. It teaches the importance of adapting quickly and staying flexible. The message is to let go of fear and embrace new opportunities."
      },
       {
        "title": "Just One Thing",
        "author": "Dr Michael Mosley",
        "price": "16.99",
        "image": "img/book29.JPG",
        "description":"This book explores how focusing on a single, positive habit can transform your life. It emphasizes simplicity and consistency over overwhelming changes. The key idea is that small, focused actions lead to lasting improvement."
      },
       {
        "title": "Outlive",
        "author": "Peter Attia",
        "price": "13.99",
        "image": "img/book30.JPG",
        "description":"This book explores the science of longevity and how to live a healthier, longer life. It offers practical advice on nutrition, exercise, and mindset to boost lifespan and vitality. The core message is that smart lifestyle choices can help us outlive diseases and age gracefully."
      },
     {
        "title": "Daring Greatly",
        "author": " Brené Brown",
        "price": "12.99",
        "image": "img/book31.JPG",
         "description":"This book encourages embracing vulnerability as a strength rather than a weakness. It shows how courage and openness lead to deeper connections and personal growth. The message is that daring greatly helps us live more authentic and fulfilling lives."
      },
      // Add more...
    ],

    "Fantasy": [
      {
        "title": "Harry Potter",
        "author": "J.K. Rowling",
        "price": "15.99",
        "image": "img/book32.JPG",
         "description":"A young wizard discovers his magical heritage and attends a school of magic. He faces challenges, friendship, and dark forces threatening the wizarding world. The series celebrates bravery, loyalty, and the power of love."
      },
      {
        "title": "The Hobbit",
        "author": "J.R.R. Tolkien",
        "price": "13.99",
        "image": "img/book33.JPG",
        "description":"A humble hobbit embarks on an adventurous quest to help reclaim a lost kingdom. Along the way, he faces dragons, trolls, and unexpected dangers. The story highlights courage, friendship, and the journey of self-discovery."
      },
      {
    "title": "A Game of Thrones",
    "author": "George R.R. Martin",
    "price": "17.99",
    "image": "img/book34.JPG",
     "description":"Noble families vie for control of a vast kingdom filled with political intrigue and danger. Amidst betrayal and war, ancient threats begin to rise beyond the borders. The story weaves power struggles with loyalty, honor, and survival."
        },
         {
    "title": "The Name of the Wind",
    "author": "Patrick Rothfuss",
    "price": "14.50",
    "image": "img/book35.JPG",
    "description":"A gifted young man recounts his journey from hardship to becoming a legendary magician. The story blends magic, mystery, and music in a richly detailed world. It explores the power of stories and the quest for knowledge."
        },
        {
    "title": "Mistborn: The Final Empire",
    "author": "Brandon Sanderson",
    "price": "13.99",
    "image": "img/book36.JPG",
     "description":"In a world ruled by an immortal tyrant, a young street thief discovers she has powerful magical abilities. She joins a rebel group to overthrow the oppressive regime. The story blends magic, rebellion, and unexpected heroism."
          },
          {
    "title": "Eragon",
    "author": "Christopher Paolini",
    "price": "11.75",
    "image": "img/book37.JPG",
     "description":"A young farm boy discovers a mysterious dragon egg that changes his destiny. He learns magic and battles dark forces threatening his world. The story explores courage, friendship, and the fight between good and evil."
  },
  {
    "title": "The Way of Kings",
    "author": "Brandon Sanderson",
    "price": "16.99",
    "image": "img/book38.JPG",
     "description":"In a war-torn world, heroes rise to face ancient powers and unravel deep mysteries. The story weaves epic battles, honor, and complex characters struggling with destiny. It explores leadership, sacrifice, and the pursuit of truth."
  },
  {
    "title": "The Lies of Locke Lamora",
    "author": "Scott Lynch",
    "price": "13.25",
    "image": "img/book39.JPG",
    "description":"A clever thief leads a group of con artists in a city full of crime and deception. They pull off daring heists while navigating dangerous rival gangs. The story combines wit, intrigue, and unexpected twists."
  },
  {
    "title": "Throne of Glass",
    "author": "Sarah J. Maas",
    "price": "12.89",
    "image": "img/book40.JPG",
    "description":"A skilled assassin is offered freedom if she competes to become the king’s champion. She faces deadly trials, political plots, and dark magic. The story blends action, mystery, and a fight for survival."
  },
  {
    "title": "The Priory of the Orange Tree",
    "author": "Samantha Shannon",
    "price": "18.50",
    "image": "img/book41.JPG",
    "description":"In a world threatened by ancient dragons, a divided kingdom must unite to survive. Powerful women—warriors, mages, and queens—play key roles in the epic struggle. The story celebrates courage, diversity, and the fight against darkness."
  },
  {
    "title": "The Witcher: The Last Wish",
    "author": "Andrzej Sapkowski",
    "price": "10.95",
    "image": "img/book42.JPG",
    "description":"A monster hunter travels a dangerous world, facing beasts and moral dilemmas. Through a series of short stories, he battles creatures and confronts his own humanity. The book blends fantasy, action, and complex characters."
  },
  {
    "title": "An Ember in the Ashes",
    "author": "Sabaa Tahir",
    "price": "13.49",
    "image": "img/book43.JPG",
    "description":"In a brutal empire, a slave girl and a soldier’s paths cross as they fight for freedom and justice. They face harsh challenges, rebellion, and secrets that could change their world. The story explores courage, sacrifice, and hope amid oppression."
  },
   {
    "title": "Shadow and Bone",
    "author": "Leigh Bardugo",
    "price": "11.99",
    "image": "img/book44.JPG",
    "description":"A young woman discovers she has a rare magical power that could save her war-torn kingdom. She must navigate danger, politics, and dark forces seeking control. The story blends magic, adventure, and self-discovery."
  },
  {
    "title": "The Cruel Prince",
    "author": "Holly Black",
    "price": "12.59",
    "image": "img/book45.JPG",
     "description":"A mortal girl is drawn into the dangerous and treacherous world of the faerie court. She navigates power struggles, deception, and her own desire for acceptance. The story explores ambition, loyalty, and dark secrets."
  },
  {
    "title": "Circe",
    "author": "Madeline Miller",
    "price": "14.99",
    "image": "img/book46.JPG",
     "description":"A powerful witch in Greek mythology, she transforms her fate through magic and self-discovery. The story reimagines ancient myths with a focus on identity and resilience. It celebrates strength, independence, and transformation."
  }
    ],

    "Contemporary Romance": [
      {
        "title": "The Notebook",
        "author": "Nicholas Sparks",
        "price": "9.50",
        "image": "img/book47.JPG",
         "description":"A heartfelt love story about a couple separated by time and memory. It explores the power of enduring love and the struggles of aging. The book highlights hope, commitment, and the impact of true connection."
      },
      {
        "title": "It Ends With Us",
        "author": "Colleen Hoover",
        "price": "10.50",
        "image": "img/book48.JPG",
         "description":"A powerful novel about love, strength, and difficult choices in the face of abuse. It explores breaking cycles and finding self-worth. The story emphasizes courage and hope for a better future."
      },
      {
    "title": "The Kiss Quotient",
    "author": "Helen Hoang",
    "price": "11.50",
    "image": "img/book49.JPG",
    "description":"A woman with social challenges hires an escort to teach her about love and relationships. Through their connection, she discovers vulnerability and self-acceptance. The story blends romance, growth, and humor."
  },
  {
    "title": "Beach Read",
    "author": "Emily Henry",
    "price": "12.25",
    "image": "img/book50.JPG",
    "description":"Two writers with opposite styles swap genres to overcome their creative blocks. Through unexpected friendship and challenges, they rediscover inspiration and healing. The story mixes romance, humor, and emotional growth."
  },
   {
    "title": "Me Before You",
    "author": "Jojo Moyes",
    "price": "10.75",
    "image": "img/book51.JPG",
     "description":"A young woman becomes a caregiver for a man left paralyzed after an accident. Their unlikely bond changes both their lives and challenges their beliefs about love and choice. The story explores compassion, courage, and difficult decisions."
  },
  {
    "title": "People We Meet on Vacation",
    "author": "Emily Henry",
    "price": "11.30",
    "image": "img/book52.JPG",
    "description":"Two longtime friends take a summer trip hoping to fix their strained relationship. Through laughter and shared memories, they confront feelings they've been avoiding. The story blends romance, friendship, and second chances."
  },
   {
    "title": "November 9",
    "author": "Colleen Hoover",
    "price": "9.99",
    "image": "img/book53.JPG",
     "description":"Two strangers meet on the same day each year, sharing moments that change their lives. Their story unfolds through time, exploring love, fate, and personal growth. It’s a heartfelt tale about connection and destiny."
  },
  {
    "title": "The Hating Game",
    "author": "Sally Thorne",
    "price": "12.00",
    "image": "img/book54.JPG",
     "description":"Two coworkers with a fierce rivalry discover their feelings might be more than just hate. Their witty banter turns into unexpected attraction and self-discovery. The story mixes humor, tension, and romance."
  },
  {
    "title": "Every Summer After",
    "author": "Carley Fortune",
    "price": "13.40",
    "image": "img/book55.JPG",
    "description":"Two childhood friends reunite each summer, exploring love, memories, and growing up together. Their bond deepens as they face change and personal challenges. The story is a nostalgic, heartfelt journey of friendship and romance."
  },
  {
    "title": "One True Loves",
    "author": "Taylor Jenkins Reid",
    "price": "10.25",
    "image": "img/book56.JPG",
     "description":"A woman’s life is upended when her presumed-dead fiancé returns just as she’s engaged to someone new. She must choose between past love and future hope. The story explores heartbreak, healing, and following the heart."
  },
  {
    "title": "Reminders of Him",
    "author": "Colleen Hoover",
    "price": "9.95",
    "image": "img/book57.JPG",
     "description":"A woman returns to her hometown to reconnect with her daughter after years apart. She faces judgment, forgiveness, and the challenge of rebuilding her life. The story is about redemption, love, and second chances."
  },
  {
    "title": "Love and Other Words",
    "author": "Christina Lauren",
    "price": "10.80",
    "image": "img/book58.JPG",
     "description":" Two childhood sweethearts reconnect years later, uncovering memories and feelings long buried. The story explores the power of words, healing, and second chances in love. It’s a heartfelt journey through past and present emotions."
  },
   {
    "title": "Archer’s Voice",
    "author": "Mia Sheridan",
    "price": "11.45",
    "image": "img/book59.JPG",
    "description":"A young woman moves to a small town and meets a quiet, mysterious man with a painful past. Through trust and healing, they find love beyond words. The story explores trauma, connection, and hope."
  },
  {
    "title": "The Spanish Love Deception",
    "author": "Elena Armas",
    "price": "12.60",
    "image": "img/book60.JPG",
    "description":"A woman enlists a charming stranger to pose as her date for a wedding in Spain. Their fake romance sparks real feelings amid family drama and secrets. The story blends humor, passion, and unexpected love."
  },
  {
    "title": "The Love Hypothesis",
    "author": "Ali Hazelwood",
    "price": "13.00",
    "image": "img/book61.JPG",
    "description":"A scientist pretends to date a colleague to convince her friends she’s in a relationship. What starts as a fake romance soon turns into something real and complicated. The story combines humor, chemistry, and heartfelt moments."
  }
    ],
  };

@override
  Widget build(BuildContext context) {
    final allBooks = booksByCategory[widget.category] ?? [];
    final filteredBooks = allBooks.where((book) {
      final title = book["title"]!.toLowerCase();
      return title.contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category),
        backgroundColor: Color.fromARGB(255, 166, 181, 177),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search for a book...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: filteredBooks.isEmpty
                ? const Center(
                    child: Text(
                      'No books found.',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : ListView.builder(
                    itemCount: filteredBooks.length,
                    itemBuilder: (context, index) {
                      var book = filteredBooks[index];
                      final favoritesProvider = Provider.of<FavoritesProvider>(context);
                      final isFav = favoritesProvider.isFavorite(book);

                      return Card(
                        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        elevation: 4,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.asset(
                                  book["image"]!,
                                  width: 60,
                                  height: 80,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) => Container(
                                    width: 60,
                                    height: 80,
                                    color: Colors.grey[300],
                                    child: const Icon(Icons.broken_image),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
    Text(book["title"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
    const SizedBox(height: 4),
    Text("Author: ${book["author"]}"),
    Text("Price: \$${book["price"]}"),
  ],
),


                              ),
                              Column(
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      isFav ? Icons.favorite : Icons.favorite_border,
                                      color: isFav ? Colors.red : null,
                                    ),
                                    onPressed: () {
                                      favoritesProvider.toggleFavorite(book);
                                    },
                                  ),
                                 IconButton(
  icon: const Icon(Icons.add_shopping_cart),
  onPressed: () {
    CartModel().addToCart({
      'title': book["title"]!,
      'author': book["author"]!,
      'price': double.tryParse(book["price"]!) ?? 0.0,
      'image': book["image"]!,
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${book["title"]} added to cart!'),
        duration: const Duration(seconds: 2),
      ),
    );
  },
),
                                  IconButton(
                                    icon: const Icon(Icons.help_outline),
                                    onPressed: () {
                                      // Navigate to the details page
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => BookDetailsPage(book: book),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class BookDetailsPage extends StatelessWidget {
  final Map<String, String> book;

  const BookDetailsPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book["title"]!),
        backgroundColor: Color.fromARGB(255, 166, 181, 177),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  book["image"]!,
                  width: 150,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              book["title"]!,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Author: ${book["author"]}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8),
            Text(
              "Price: \$${book["price"]}",
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              book["description"] ?? 'No description available.',
              style: const TextStyle(fontSize: 15, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
