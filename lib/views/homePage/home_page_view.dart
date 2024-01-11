import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pretestpts/views/homePage/providers/home_page_provider.dart';
import 'package:pretestpts/views/profileViewPage/profile_view_page.dart';
import 'package:pretestpts/views/signinPage/providers/signin_page_provider.dart';
import 'package:provider/provider.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final signinPageProvider = Provider.of<SigninPageProvider>(context);
    final homePageProvider = Provider.of<HomePageProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: screenSize.height * .4,
                width: screenSize.width,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      height: screenSize.height * .27,
                      width: screenSize.width,
                      color: Colors.blue,
                    ),
                    Positioned(
                      top: screenSize.height * .05,
                      child: Container(
                        width: screenSize.width,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              child: const CircleAvatar(
                                radius: 20,
                                backgroundColor: Colors.white,
                                child: Icon(Icons.person),
                              ),
                            ),
                            const Spacer(),
                            IconButton(
                              icon: const Icon(
                                Icons.notifications_none,
                                size: 30,
                                color: Colors.white,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: screenSize.height * .15,
                      child: Container(
                        height: screenSize.height * .25,
                        width: screenSize.width * .9,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30.0,
                                vertical: 5,
                              ),
                              child: Image.asset(
                                'assets/images/img_mblLogo.png',
                              ),
                            ),
                            const Spacer(),
                            const Text(
                              'Welcome Back!',
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              signinPageProvider.loginResponse.data!.name!,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenSize.height * .03),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    const Text(
                      'Quick Access',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      child: const Text(
                        'See All',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenSize.height * .02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/icons/ic_profile.png',
                          height: 36,
                          width: 36,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text('My Profile')
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/icons/ic_forms.png',
                          height: 36,
                          width: 36,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text('Forms')
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        child: Image.asset(
                          'assets/icons/ic_pulication.png',
                          height: 36,
                          width: 36,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text('Publications')
                    ],
                  )
                ],
              ),
              SizedBox(height: screenSize.height * .03),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  children: [
                    Text(
                      'Users',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'See All',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: homePageProvider.userDetails!.data!.length,
                  itemBuilder: (context, index) {
                    final name =
                        homePageProvider.userDetails!.data![index].name;
                    final location =
                        homePageProvider.userDetails!.data![index].location;
                    final image = homePageProvider
                        .userDetails!.data![index].profilepicture;
                    final email =
                        homePageProvider.userDetails!.data![index].email;
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProfilePageView(
                                    userData: homePageProvider
                                        .userDetails!.data![index])));
                      },
                      child: Container(
                        height: screenSize.height * .2,
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              spreadRadius: 2,
                              blurRadius: 10,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Image.asset('assets/icons/ic_rectbar.png'),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Email',
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                            const SizedBox(height: 7),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  'assets/icons/ic_mail.png',
                                                  height: 20,
                                                  width: 20,
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  email!,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        IconButton(
                                          icon: Image.asset(
                                            'assets/icons/ic_more.png',
                                            height: 24,
                                          ),
                                          onPressed: () {},
                                        ),
                                      ],
                                    ),
                                    const Divider(),
                                    ListTile(
                                      contentPadding: EdgeInsets.zero,
                                      leading: CircleAvatar(
                                        radius: 30,
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(100)),
                                          child: Image.network(image!),
                                        ),
                                      ),
                                      title: Text(
                                        name.toString(),
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      subtitle: Text(
                                        location.toString(),
                                        style: const TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
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
        ),
      ),
    );
  }
}
