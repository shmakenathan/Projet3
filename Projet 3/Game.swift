public class Game {
    
    var player : [Player] = [Player(name: ""),
                             Player(name: "")]
    
    var numbersOfLaps = 0
    var characters : [Character] = [ Character(name: "Le Barbare", life: 280, weapon: Axe()),
                                     Character(name: "Le Chevalier", life: 300, weapon: Sword()),
                                     Character(name: "Le Geant", life: 700, weapon: Fist()),
                                     Character(name: "Le Sorcier", life: 200, weapon: Scepter()),
                                     Character(name: "Le Gobelin", life: 150, weapon: Dagger()),
                                     Character(name: "L'Archer", life: 400, weapon: Bow()),
                                     Character(name: "Le Mafieux", life: 250, weapon: BasebalBat()),
                                     Character(name: "Le Prisonnier", life: 120, weapon: Knife()),
                                     Character(name: "Le Ninja", life: 350, weapon: Katana()),
                                     Character(name: "Le Voleur", life: 170, weapon: Crossbow()),
                                     Character(name: "Le Fantassin", life: 500, weapon: Halberd()),
                                     Character(name: "Le Troll", life: 800, weapon: Mass()),
                                     Character(name: "Le Garde Royal", life: 460, weapon: Spear()),
                                     Character(name: "L'elfe", life: 525, weapon: DoubleSword()),
                                     Character(name: "L'Homme de Main", life: 220, weapon: Hammer())]
    
    
    /// Function allowing the player to choose their nicks
    private func chooseNamePlayer() {
        print("---------- Que la partie commence !!!!! ---------- \n \nJoueur 1 et Joueur 2 , tenez-vous pret !")
        print("joueur 1, Entrez votre Pseudo :")
        let name1 = readLine()
        self.player[0] = Player(name: name1!)
        print("Joueur 2, Entrez votre Pseudo :")
        let name2 = readLine()
        self.player[1] = Player(name: name2!)
        print("\n\n")
    }
    
    /// Function to display all available characters
    private func displayCharactersOfTheGame(){
        for i in 0 ... characters.count-1 {
            print("\(i+1).\(characters[i].name) qui inflige \(characters[i].weapon.damage) de dégats et à \(characters[i].life) de points de vie avec \(characters[i].weapon.name)")
        }
    }
    
    /// Function to convert what is entered by the user in Int
    private func input() -> Int {
        if let strData = readLine(),let intValue = Int(strData){
            return intValue
        }else{
            return 0
        }
    }
    
    /// Function so that each player can choose the characters of his team each turn
    private func chooseCharacterForYourTeam(){
        var i = 0
        var choice : Int
        repeat {
            let y = i%2
            repeat {
                print("Veuillez choisir un personnage \(self.player[y].name)\n")
                self.displayCharactersOfTheGame()
                choice = input()
                if (choice > self.characters.count) || (choice < 1) {
                    print("ERREUR, veuillez entrez un Nombre valide")
                }
            } while (choice > self.characters.count) || (choice < 1)
            self.player[y].character.append(self.characters[choice-1])
            self.characters.remove(at: choice-1)
            i = i + 1
        } while i < 6
        print("\n")
    }
    
    /// Function to display the information of each player (character, life, weapon)
    private func displayCharacters(){
        print("Nom Joueur 1 : \(self.player[0].name)\n")
        print("Perso 1 : \(self.player[0].character[0].name)\t❤️ : \(self.player[0].character[0].life)\t🔪 : \(self.player[0].character[0].weapon.name)\t💥 : \(self.player[0].character[0].weapon.damage)")
        print("Perso 2 : \(self.player[0].character[1].name)\t❤️ : \(self.player[0].character[1].life)\t🔪 : \(self.player[0].character[1].weapon.name)\t💥 : \(self.player[0].character[1].weapon.damage)")
        print("Perso 3 : \(self.player[0].character[2].name)\t❤️ : \(self.player[0].character[2].life)\t🔪 : \(self.player[0].character[2].weapon.name)\t💥 : \(self.player[0].character[2].weapon.damage)\n")
        print("Nom Joueur 2 : \(self.player[1].name)\n")
        print("Perso 1 : \(self.player[1].character[0].name)\t❤️ : \(self.player[1].character[0].life)\t🔪 : \(self.player[1].character[0].weapon.name)\t💥 : \(self.player[1].character[0].weapon.damage)")
        print("Perso 2 : \(self.player[1].character[1].name)\t❤️ : \(self.player[1].character[1].life)\t🔪 : \(self.player[1].character[1].weapon.name)\t💥 : \(self.player[1].character[1].weapon.damage)")
        print("Perso 3 : \(self.player[1].character[2].name)\t❤️ : \(self.player[1].character[2].life)\t🔪 : \(self.player[1].character[2].weapon.name)\t💥 : \(self.player[1].character[2].weapon.damage)\n")
        
    }
    
    /// Function to test if the game is finished or not
    private func endGame() -> Bool{
        if (self.player[0].character[0].life == 0 && self.player[0].character[1].life == 0 && self.player[0].character[2].life == 0) || (self.player[1].character[0].life == 0 && self.player[1].character[1].life == 0 && self.player[1].character[2].life == 0) {
            return false
        }else{
            return true
        }
    }
    
    /// Function returning the winner of the game
    private func whosWin() -> Player {
        if (self.player[0].character[0].life == 0 && self.player[0].character[1].life == 0 && self.player[0].character[2].life == 0) {
            return self.player[1]
        }else{
            return self.player[0]
        }
    }
    
    /// Function to launch the game
    static func launchGame() {
        
        let game = Game()
        
        game.chooseNamePlayer()
        game.chooseCharacterForYourTeam()
        game.displayCharacters()
    
        print("\n\n\nMaintenant que chaque équipe est constitué la partie peux commencer.\nChacun votre tour vous pourrez décider quelle action éxécuter entre attaque et soin.\nLes dégats infligés dépendent de l'arme que posséde votre personnage tandis que le soin sera de 50 PV quelque soit le personnage choisis.\nBon jeu a vous et bonne partie !\n\n\n")
        var i = 0
        repeat {
            let y = i%2
            print("C'est à ton tour de jouer \(game.player[y].name)")
            if game.player[y].chooseAction() == 1 {
                game.player[y].chooseCharacter().attack(character: game.player[(y+1)%2].chooseCharacterUndergo())
            }else{
                game.player[y].chooseCharacter().care(character: game.player[y].chooseCharacterUndergo())
            }
            
            i = i + 1
            game.numbersOfLaps = game.numbersOfLaps + 1
        } while game.endGame()
        
        game.displayCharacters()
        
        print("Fin de la partie le gagnant est \(game.whosWin().name) et il y a eu \(game.numbersOfLaps) Tours")
    }
}
