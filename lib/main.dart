import 'package:flutter/material.dart';

void main() {

  runApp(const CVFlutterApp());

}

class CVFlutterApp extends StatelessWidget {

  const CVFlutterApp({super.key});

  @override

  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: 'CV - Arlette Kyagala',

      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(

          seedColor: const Color(0xFF142B4A),

        ),

        scaffoldBackgroundColor: const Color(0xFFF4F6F9),

        useMaterial3: true,

      ),

      home: const LoginPage(),

    );

  }

}

// PAGE 1 : CONNEXION

class LoginPage extends StatefulWidget {

  const LoginPage({super.key});

  @override

  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController identifiantController =

      TextEditingController();

  final TextEditingController passwordController =

      TextEditingController();

  bool masquerMotDePasse = true;

  void connecter() {

    if (identifiantController.text == 'arlette' &&

        passwordController.text == '123456') {

      Navigator.pushReplacement(

        context,

        MaterialPageRoute(

          builder: (context) => const HomeNavigation(),

        ),

      );

    } else {

      ScaffoldMessenger.of(context).showSnackBar(

        const SnackBar(

          content: Text('Identifiant ou mot de passe incorrect.'),

        ),

      );

    }

  }

  @override

  void dispose() {

    identifiantController.dispose();

    passwordController.dispose();

    super.dispose();

  }

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      body: Center(

        child: SingleChildScrollView(

          padding: const EdgeInsets.all(25),

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              const Icon(

                Icons.account_circle,

                size: 90,

                color: Color(0xFF142B4A),

              ),

              const SizedBox(height: 20),

              const Text(

                'BIENVENUE',

                style: TextStyle(

                  fontSize: 28,

                  fontWeight: FontWeight.bold,

                  color: Color(0xFF142B4A),

                ),

              ),

              const SizedBox(height: 8),

              const Text('Connectez-vous pour consulter mon CV'),

              const SizedBox(height: 35),

              TextField(

                controller: identifiantController,

                decoration: const InputDecoration(

                  labelText: 'Identifiant',

                  prefixIcon: Icon(Icons.person),

                  border: OutlineInputBorder(),

                ),

              ),

              const SizedBox(height: 20),

              TextField(

                controller: passwordController,

                obscureText: masquerMotDePasse,

                decoration: InputDecoration(

                  labelText: 'Mot de passe',

                  prefixIcon: const Icon(Icons.lock),

                  border: const OutlineInputBorder(),

                  suffixIcon: IconButton(

                    icon: Icon(

                      masquerMotDePasse

                          ? Icons.visibility

                          : Icons.visibility_off,

                    ),

                    onPressed: () {

                      setState(() {

                        masquerMotDePasse = !masquerMotDePasse;

                      });

                    },

                  ),

                ),

              ),

              const SizedBox(height: 25),

              SizedBox(

                width: double.infinity,

                height: 50,

                child: ElevatedButton(

                  onPressed: connecter,

                  style: ElevatedButton.styleFrom(

                    backgroundColor: const Color(0xFF142B4A),

                    foregroundColor: Colors.white,

                  ),

                  child: const Text('Se connecter'),

                ),

              ),

            ],

          ),

        ),

      ),

    );

  }

}

// NAVIGATION ENTRE LES PAGES

class HomeNavigation extends StatefulWidget {

  const HomeNavigation({super.key});

  @override

  State<HomeNavigation> createState() => _HomeNavigationState();

}

class _HomeNavigationState extends State<HomeNavigation> {

  int pageActuelle = 0;

  final List<Widget> pages = const [

    CVPage(),

    FamilyPage(),

    ContactPage(),

  ];

  final List<String> titres = [

    'Mon Curriculum Vitae',

    'Ma famille',

    'Mes contacts',

  ];

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: Text(

          titres[pageActuelle],

          style: const TextStyle(

            color: Colors.white,

            fontWeight: FontWeight.bold,

          ),

        ),

        backgroundColor: const Color(0xFF142B4A),

        iconTheme: const IconThemeData(color: Colors.white),

      ),

      drawer: Drawer(

        child: ListView(

          children: [

            const DrawerHeader(

              decoration: BoxDecoration(

                color: Color(0xFF142B4A),

              ),

              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  Icon(

                    Icons.account_circle,

                    size: 65,

                    color: Colors.white,

                  ),

                  SizedBox(height: 10),

                  Text(

                    'Arlette Kyagala la douce',

                    style: TextStyle(

                      color: Colors.white,

                      fontSize: 17,

                      fontWeight: FontWeight.bold,

                    ),

                  ),

                ],

              ),

            ),

            ListTile(

              leading: const Icon(Icons.person),

              title: const Text('Mon CV'),

              onTap: () {

                setState(() => pageActuelle = 0);

                Navigator.pop(context);

              },

            ),

            ListTile(

              leading: const Icon(Icons.family_restroom),

              title: const Text('Ma famille'),

              onTap: () {

                setState(() => pageActuelle = 1);

                Navigator.pop(context);

              },

            ),

            ListTile(

              leading: const Icon(Icons.contact_phone),

              title: const Text('Mes contacts'),

              onTap: () {

                setState(() => pageActuelle = 2);

                Navigator.pop(context);

              },

            ),

            const Divider(),

            ListTile(

              leading: const Icon(Icons.logout, color: Colors.red),

              title: const Text('Déconnexion'),

              onTap: () {

                Navigator.pushReplacement(

                  context,

                  MaterialPageRoute(

                    builder: (context) => const LoginPage(),

                  ),

                );

              },

            ),

          ],

        ),

      ),

      body: pages[pageActuelle],

      bottomNavigationBar: NavigationBar(

        selectedIndex: pageActuelle,

        onDestinationSelected: (index) {

          setState(() {

            pageActuelle = index;

          });

        },

        destinations: const [

          NavigationDestination(

            icon: Icon(Icons.person),

            label: 'Mon CV',

          ),

          NavigationDestination(

            icon: Icon(Icons.family_restroom),

            label: 'Famille',

          ),

          NavigationDestination(

            icon: Icon(Icons.contact_phone),

            label: 'Contact',

          ),

        ],

      ),

    );

  }

}

// PAGE 2 : MON CV

class CVPage extends StatelessWidget {

  const CVPage({super.key});

  @override

  Widget build(BuildContext context) {

    return ListView(

      padding: const EdgeInsets.all(16),

      children: [

        Center(

          child: Column(

            children: [

               CircleAvatar(

                radius: 65,

                backgroundImage: AssetImage('assets/images/arlette.jpeg'),
               ),

              const Text(

                'ARLETTE KYAGALA LA DOUCE',

                textAlign: TextAlign.center,

                style: TextStyle(

                  fontSize: 21,

                  fontWeight: FontWeight.bold,

                  color: Color(0xFF142B4A),

                ),

              ),

              const SizedBox(height: 6),

              const Text(

                'Ingénieure en informatique',

                style: TextStyle(

                  fontSize: 16,

                  color: Colors.black54,

                ),

              ),

            ],

          ),

        ),

        const SizedBox(height: 20),

        const SectionTitle(title: 'PROFIL PROFESSIONNEL'),

        const InfoCard(

          title: 'Présentation',

          subtitle:

              'Ingénieure en informatique passionnée par '

              'l’optimisation des systèmes et le développement '

              'de solutions innovantes. Expérience en programmation, '

              'cybersécurité et gestion de bases de données. '

              'Curieuse et dynamique, toujours en quête de nouveaux '

              'défis technologiques.',

          icon: Icons.person_outline,

        ),

        const SectionTitle(title: 'INFORMATIONS PERSONNELLES'),

        const InfoCard(

          title: 'Adresse physique',

          subtitle: 'Q/ Katindo ; AV/ Bunagana',

          icon: Icons.location_on,

        ),

        const InfoCard(

          title: 'Téléphone',

          subtitle: '0891565760',

          icon: Icons.phone,

        ),

        const InfoCard(

          title: 'E-mail',

          subtitle: 'Arlydouce7gmail.com',

          icon: Icons.email,

        ),

        const SectionTitle(title: 'FORMATION ACADÉMIQUE'),

        const InfoCard(

          title: 'Niveau académique',

          subtitle: 'Bac +2 en informatique appliquée à la gestion des entreprises.',

          icon: Icons.school,

        ),

        const InfoCard(

          title: 'Établissement',

          subtitle: 'École Institut Notre Dame.',

          icon: Icons.account_balance,

        ),

        const InfoCard(

          title: 'Formation complémentaire',

          subtitle: 'Formation de douane et accise et informatique à l’INPP.',

          icon: Icons.menu_book,

        ),

        const InfoCard(

          title: 'Perfectionnement',

          subtitle: 'Continuité pour la perfection toujours dans la programmation.',

          icon: Icons.computer,

        ),

        const SectionTitle(title: 'EXPÉRIENCES PROFESSIONNELLES'),

        const InfoCard(

          title: 'COOPEC CHANGA-CHANGA',

          subtitle: 'Guichetière — 2023 à août 2024.',

          icon: Icons.work,

        ),

        const InfoCard(

          title: 'TOP FIVE Goma',

          subtitle: 'Responsable des ressources humaines (RRH) — '

              'Depuis le 2 septembre 2024.',

          icon: Icons.business,

        ),

        const SectionTitle(title: 'COMPÉTENCES TECHNIQUES'),

        const InfoCard(

          title: 'Développement et programmation',

          subtitle: 'Python, NetBeans et SQL.',

          icon: Icons.code,

        ),

        const InfoCard(

          title: 'Développement web',

          subtitle: 'HTML et CSS.',

          icon: Icons.web,

        ),

        const InfoCard(

          title: 'Cybersécurité',

          subtitle: 'Protection des systèmes et gestion des risques.',

          icon: Icons.security,

        ),

        const InfoCard(

          title: 'Bases de données',

          subtitle: 'Conception et optimisation : SQL et SQL Server.',

          icon: Icons.storage,

        ),

        const InfoCard(

          title: 'Résolution des problèmes',

          subtitle: 'Approche analytique et esprit critique.',

          icon: Icons.psychology,

        ),

        const InfoCard(

          title: 'Travail en équipe et leadership',

          subtitle: 'Gestion collaborative de projets.',

          icon: Icons.groups,

        ),

        const SectionTitle(title: 'LANGUES'),

        const InfoCard(

          title: 'Français',

          subtitle: 'Courant : lecture, écriture et expression orale.',

          icon: Icons.language,

        ),

        const InfoCard(

          title: 'Anglais',

          subtitle: 'Intermédiaire : lecture, écriture et expression orale.',

          icon: Icons.language,

        ),

        const InfoCard(

          title: 'Swahili',

          subtitle: 'Courant : lecture, écriture et expression orale.',

          icon: Icons.language,

        ),

        const SectionTitle(title: 'RÉFÉRENCES PROFESSIONNELLES'),

        const InfoCard(

          title: 'AMANI MUZALIWA',

          subtitle: 'Directeur de la COOPERATIVE CHANGA-CHANGA\n'

              'E-mail : akeemuzaliwa@gmail.com',

          icon: Icons.person,

        ),

        const InfoCard(

          title: 'LOKA BOKWALA ELIE',

          subtitle: 'CEO de la société TOPFIVE Group LTD\n'

              'E-mail : elieloka@gmail.com',

          icon: Icons.person,

        ),

        const SectionTitle(title: 'DÉCLARATION'),

        const InfoCard(

          title: 'Déclaration sur l’honneur',

          subtitle:

              'Je certifie sur mon honneur que ces renseignements '

              'sont sincères et dignes de foi.',

          icon: Icons.verified,

        ),

      ],

    );

  }

}

// PAGE 3 : MA FAMILLE

class FamilyPage extends StatelessWidget {

  const FamilyPage({super.key});

  final List<String> membres = const [

    'Henrianne',

    'Arlette',

    'Asnath',

    'Adrienne',

    'Apoline',

    'Archimede',

    'Arnolde',

    'Abednego',

    'Archange',

  ];

  @override

  Widget build(BuildContext context) {

    return ListView(

      padding: const EdgeInsets.all(16),

      children: [

        const Text(

          'Les membres de ma famille',

          textAlign: TextAlign.center,

          style: TextStyle(

            fontSize: 21,

            fontWeight: FontWeight.bold,

            color: Color(0xFF142B4A),

          ),

        ),

        const SizedBox(height: 15),

        ...membres.map(

          (nom) => Card(

            margin: const EdgeInsets.only(bottom: 12),

            child: ListTile(

              leading: CircleAvatar(

                backgroundColor: const Color(0xFF142B4A),

                child: Text(

                  nom[0].toUpperCase(),

                  style: const TextStyle(color: Colors.white),

                ),

              ),

              title: Text(

                nom,

                style: const TextStyle(fontWeight: FontWeight.bold),

              ),

              subtitle: const Text('Lien de parenté à préciser'),

            ),

          ),

        ),

      ],

    );

  }

}

// PAGE 4 : CONTACT

class ContactPage extends StatelessWidget {

  const ContactPage({super.key});

  @override

  Widget build(BuildContext context) {

    return ListView(

      padding: const EdgeInsets.all(16),

      children: const [

        SectionTitle(title: 'MES COORDONNÉES'),

        InfoCard(

          title: 'Téléphone',

          subtitle: '0891565760',

          icon: Icons.phone,

        ),

        InfoCard(

          title: 'Adresse physique',

          subtitle: 'Q/ Katindo ; AV/ Bunagana',

          icon: Icons.location_on,

        ),

        InfoCard(

          title: 'Adresse e-mail',

          subtitle: 'Arlydouce7gmail.com',

          icon: Icons.email,

        ),

        SectionTitle(title: 'MES RÉSEAUX SOCIAUX'),

        InfoCard(

          title: 'GitHub',

          subtitle: 'https://github.com/arlydouce7-Douce',

          icon: Icons.code,

        ),

        InfoCard(

          title: 'LinkedIn',

          subtitle: 'Profil bientôt disponible.',

          icon: Icons.work,

        ),

      ],

    );

  }

}

// COMPOSANTS RÉUTILISABLES

class SectionTitle extends StatelessWidget {

  final String title;

  const SectionTitle({

    super.key,

    required this.title,

  });

  @override

  Widget build(BuildContext context) {

    return Padding(

      padding: const EdgeInsets.only(

        top: 22,

        bottom: 10,

      ),

      child: Text(

        title,

        style: const TextStyle(

          fontSize: 17,

          fontWeight: FontWeight.bold,

          color: Color(0xFF142B4A),

        ),

      ),

    );

  }

}

class InfoCard extends StatelessWidget {

  final String title;

  final String subtitle;

  final IconData icon;

  const InfoCard({

    super.key,

    required this.title,

    required this.subtitle,

    required this.icon,

  });

  @override

  Widget build(BuildContext context) {

    return Card(

      elevation: 1,

      margin: const EdgeInsets.only(bottom: 10),

      child: ListTile(

        leading: Icon(

          icon,

          color: const Color(0xFF142B4A),

          size: 27,

        ),

        title: Text(

          title,

          style: const TextStyle(

            fontWeight: FontWeight.bold,

          ),

        ),

        subtitle: Text(subtitle),

      ),

    );

  }

}