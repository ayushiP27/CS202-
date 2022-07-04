#!/usr/bin/perl
use strict;
use warnings;
use feature ":5.10";

# The list of words from which we can give the player a word 

my @wordlist = ("computer", "radio", "calculator" , "teacher", "bureau", "police", "geometry" , "president",
"subject", "country", "environment", "classroom", "animals" , "province", "month" , "politics", "puzzle" ,
"instrument" ,"kitchen","language" , "vampire", "ghost" , "solution" ,"service" ,"software" ,"virus25" ,
"security" ,"phonenumber" ,"expert" ,"website" ,"agreement", "support", "compatibility" ,"advanced",
"search" ,"triathlon" ,"immediately" , "encyclopedia" ,"endurance" ,"distance" , "nature","history" , 
"organization" ,"international" ,"championship" , "government" , "popula" ,"rity", "thousand" , "feature" , 
"wetsuit" ,"fitness", "legendary" , "variation" , "equal" , "approximately" ,"segment", "priority", "physics" ,
"branche" ,"science" ,"mathematics" ,"lightning", "dispersion" ,"accelerator" , "detector" , "terminology" ,
"design" ,"operation", "foundation" ,"application" ,"prediction" ,"reference" ,"measurement" ,"concept" ,
"perspective" ,"overview" , "position" ,"airplane" ,"symmetry" ,"dimension" ,"toxic" ,"algebra" , "illust" ,
"ration" ,"classic" ,"verification" ,"citation" ,"unusual" , "resource" ,"analysis" ,"license" ,"comedy" ,
"screenplay" ,"production" ,"release" ,"emphasis" ,"director" ,"trademark" ,"vehicle" ,"aircraft" ,"experiment");

my @guesses = ();

my $solved = 0;

my $tries = 0; #Everytime you guess a word 

&main(); 

sub main {

        # So, first our program will choose a random word itself from the wordlist provided
        
        my $word = @wordlist [int(rand(3)) - 1];
        my $size = length($word);
        
        
        
        #Following loop is used to display the length of word in the form of dashes
        
        for (my $i=0; $i < $size; $i++) {
                $guesses [$i] = '_';
        }
        
        while (!$solved) {
                &hangman();

                print join(" ", @guesses);
                print "\n\nMake a Guess : ";
                my $guess = <>;
                chomp($guess); 
                
                &Letter($word, $guess);

                $solved = &playerWin($word);

        }

    print join(" ", @guesses);
     print"\n\nThe word is: " . $word . "\n";
    print "\n\nYeah! You got it \n";
}
sub hangman() {
    given($tries) {
        when(0) {&hangman1();}
        when(1) {&hangman2();}
        when(2) {&hangman3();}
        when(3) {&hangman4();}
        when(4) {&hangman5();}
        when(5) {&hangman6();}
        when(6) {&hangman7();}
    }
}

# The following subroutine is to check if the letter entered is right or not. 

sub Letter {
    my ($word, $guess) = @_;
    my $letterIndex = index($word, $guess);

    if ($letterIndex == -1) {
        print "Wrong!\n";
        $tries++;
    } 
    
    else {
        for (my $i=0; $i < length($word); $i++) {
            my $c_letter = substr($word, $i, 1);
            if ($guess eq $guesses[$i]) {
                print "Sorry! You already guessed " . $guess . "\n";
            }
            if ($guess eq $c_letter) {
                $guesses [$i] = $c_letter;
            }
        }
    }
}

# Following is the subroutine to check if player has won or not 

sub playerWin {
    my ($word) = @_;
    my $letter;
    for (my $i=0; $i< length($word); $i++) {
        $letter = substr($word, $i, 1);
        if ($letter ne $guesses [$i]) {
            return 0;
        }
    }
    return 1;
}

# The given subroutines are to display the hangman figure when game proceeds further 

sub hangman1
{
        print "  -------\n";
        print "  |     |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "__|___\n";
}

sub hangman2
{
        print "  -------\n";
        print "  |     |\n";
        print "  |     o\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "__|___\n";
}

sub hangman3
{
        print "  -------\n";
        print "  |     |\n";
        print "  |     o\n";
        print "  |     |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "__|___\n";
}

sub hangman4
{
        print "  -------\n";
        print "  |     |\n";
        print "  |     o\n";
        print "  |    \\|\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "__|___\n";
}

sub hangman5
{
        print "  -------\n";
        print "  |     |\n";
        print "  |     o\n";
        print "  |    \\|/\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "__|___\n";
}

sub hangman6
{
        print "  -------\n";
        print "  |     |\n";
        print "  |     o\n";
        print "  |    \\|/\n";
        print "  |     /\n";
        print "  |\n";
        print "  |\n";
        print "__|___\n";
}

sub hangman7
{
        print "  -------\n";
        print "  |     |\n";
        print "  |     o\n";
        print "  |    \\|/\n";
        print "  |     /\\\n";
        print "  |\n";
        print "  |\n";
        print "__|___\n";
    print "ALAS! You lost.\n";
    exit 0;
}
