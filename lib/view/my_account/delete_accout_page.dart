import 'package:flutter/material.dart';

class DeleteAccountPage extends StatefulWidget {
  const DeleteAccountPage({super.key});

  @override
  State<DeleteAccountPage> createState() => _DeleteAccountPageState();
}

class _DeleteAccountPageState extends State<DeleteAccountPage> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          const Text('Delete Account',
          style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.bold
          ),),
            const SizedBox(height: 20,),
            const Text('Are you sure you want to delete your account?\n'
                'Deleting your account will lost all your Data.'),
            SizedBox(
              height: size.height/1.5,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                      height: 45,
                      width: 150,
                      child: OutlinedButton(

                          style: OutlinedButton.styleFrom(
                              shadowColor: const Color(0xFF0d1e2a),
                              //               backgroundColor: Color(0xFF0d1e2a),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),
                              side: const BorderSide(
                                color: Color(0xFF0d1e2a),
                              )
                          ),
                          onPressed: (){
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) =>  const LoginScreen()),
                            // );
                          }, child: const Text('Cancel',
                        style: TextStyle(
                          color: Color(0xFF0d1e2a),
                        ),))
                  ),
                  SizedBox(
                      height: 45,
                      width: 150,
                      child: ElevatedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: const Color(0xFF0d1e2a),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35.0)),

                          ),onPressed: (){
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) =>    const SignUpScreen()),
                        // );
                      }, child: const Text('Allow'))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
