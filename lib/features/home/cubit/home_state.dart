class HomeState {

   final String? userName,email;

   HomeState({this.userName,this.email});

   // generate equality here

   @override
   bool operator ==(Object other) {
     return other is HomeState && other.userName == userName && other.email==email;
   }


   @override
   int get hashCode => userName.hashCode ^ email.hashCode;




}