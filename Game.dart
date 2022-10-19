import 'dart:io';
import 'dart:math';

enum Durum { rock, paper, scissors }

var pc_point = 5;
var user_point = 5;

void main(List<String> args) {
  print("Welcome to rock paper scissors game");
  print("Press e button for end the game ");
  print("");

  var chooses = ["rock", "paper", "scissors"];
  final rock = chooses[0];
  final paper = chooses[1];
  final scissors = chooses[2];

  while (true) {
    print("USER POİNT : $user_point");
    print("COMPUTER : $pc_point");
    print("");

    print("Rock , paper and scissors. please a choose anything");
    var user_choose = stdin.readLineSync(); // kullanıcıdan bilgi almak için
    print("The Choose of the user : $user_choose");

    if (user_choose == "e" || user_choose == "E") {
      // eğer ki "e" veya "E" harflerine basarsak oyun biter
      print("The game is over");
      break;
    }

    var pc_random = Random().nextInt(3);
    // bilgisiyardan 0-3 arası bir seçim yapmasını istedik
    var pc_choose = chooses[pc_random];
    // seçilen sayı ile chooses listesinde denk gelen indexi aldık

    game2(user_choose, pc_choose, rock, paper, scissors);
    // tüm oyunun oynandığı yer

    if (user_point == 0 || pc_point == 0) {
      if (user_point == 0) {
        var point = 20 * pc_point;
        print("User Lost The Game");
        print("Computer won , it is point : $point");
        print("The game is over");
        break;
      } else {
        var point = 20 * user_point;
        print("Computer Lost The Game");
        print("user won , it is point : $point");
        print("The game is over");
        break;
      }
    }
  }
}

void game(var user_choose, var pc_choose, var draw, var pc_won, var user_won) {
  // user genellikle else denk geliyor
  if (pc_choose == draw) {
    print("The choose of the computer : $pc_choose");
    print("Game round draw \n"); // beraber
  } else if (pc_choose == pc_won) {
    print("The choose of the computer : $pc_choose");
    print("The computer won \n"); // bilgisayar kazandı
    user_point--;
  } else {
    print("The choose of the computer : $pc_choose");
    print("The user won \n"); // kullanıcı kazandı
    pc_point--;
  }
}

void game2(var user_choose, var pc_choose, var rock, var paper, var scissors) {
  // continue game method

  if (user_choose == rock) {
    game(user_choose, pc_choose, rock, paper, scissors);
  } else if (user_choose == paper) {
    game(user_choose, pc_choose, paper, scissors, rock);
  } else if (user_choose == scissors) {
    game(user_choose, pc_choose, scissors, rock, paper);
  } else {
    print("Wrong choice, try again\n");
  }
}
