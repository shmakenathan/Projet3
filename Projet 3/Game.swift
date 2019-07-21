public class Game {
    
    var player : [Player] = [Player(name: ""),
                             Player(name: "")]
    
    var numbersOfLaps = 0
    var character : [Character] = [  Character(name: "Le Barbare", life: 100, weapon: Axe()),
                                     Character(name: "Le Chevalier", life: 1, weapon: Sword()),
                                     Character(name: "Le Geant", life: 10, weapon: Fist()),
                                     Character(name: "Le Sorcier", life: 1, weapon: Scepter()),
                                     Character(name: "Le Gobelin", life: 1, weapon: Dagger()),
                                     Character(name: "L'Archer", life: 1, weapon: Bow()),
                                     Character(name: "Le Mafieux", life: 100, weapon: BasebalBat()),
                                     Character(name: "Le Prisonnier", life: 0, weapon: Knife()),
                                     Character(name: "Le Ninja", life: 100, weapon: Katana()),
                                     Character(name: "Le Voleur", life: 100, weapon: Crossbow()),
                                     Character(name: "Le Fantassin", life: 100, weapon: Halberd()),
                                     Character(name: "Le Troll", life: 100, weapon: Mass()),
                                     Character(name: "Le Garde Royal", life: 100, weapon: Spear()),
                                     Character(name: "L'elfe", life: 100, weapon: DoubleSword()),
                                     Character(name: "L'Homme de Main", life: 100, weapon: Hammer())]
    
    
    // Fonction permettant au joueur de choisir leurs pseudo
    func chooseNamePlayer() {
        print("---------- Que la partie commence !!!!! ---------- \n \nJoueur 1 et Joueur 2 , tenez-vous pret !")
        print("joueur 1, Entrez votre Pseudo :")
        let nom1 = readLine()
        self.player[0] = Player(name: nom1!)
        print("Joueur 2, Entrez votre Pseudo :")
        let nom2 = readLine()
        self.player[1] = Player(name: nom2!)
        print("\n\n")
    }
    
    
    
    
    // Fonction permettant d'afficher tout les personnages disponible
    func listerPerso(){
        for i in 0 ... character.count-1 {
            print("\(i+1).\(character[i].name) qui inflige \(character[i].weapon.damage) de dégats et à \(character[i].life) de points de vie avec \(character[i].weapon.name)")
        }
    }
    
    
    // Fonction pour convertir ce qui est entré par l'utilisateur en Int
    func input() -> Int {
        if let strData = readLine(),let intValue = Int(strData){
            return intValue
        }else{
            return 0
        }
    }
    
    
    
    // Fonction pour que chaque joueur puisse choisir les personnage de son equipe chacun son tour
    func ChooseCharacterForYourTeam(){
        var i = 0
        var choix : Int
        repeat {
            let y = i%2
            repeat {
                print("Veuillez choisir un personnage \(self.player[y].name)\n")
                self.listerPerso()
                choix = input()
                if (choix > self.character.count) || (choix < 1) {
                    print("ERREUR, veuillez entrez un Nombre valide")
                }
            } while (choix > self.character.count) || (choix < 1)
            self.player[y].character.append(self.character[choix-1])
            self.character.remove(at: choix-1)
            i = i + 1
        } while i < 6
        print("\n")
    }
    
    
    
    
    func displayCharacters(){
        print("Nom Joueur 1 : \(self.player[0].name)\n")
        print("Perso 1 : \(self.player[0].character[0].name)\tPoints de vie : \(self.player[0].character[0].life)\tArme : \(self.player[0].character[0].weapon.name)\tDégats : \(self.player[0].character[0].weapon.damage)")
        print("Perso 2 : \(self.player[0].character[1].name)\tPoints de vie : \(self.player[0].character[1].life)\tArme : \(self.player[0].character[1].weapon.name)\tDégats : \(self.player[0].character[1].weapon.damage)")
        print("Perso 3 : \(self.player[0].character[2].name)\tPoints de vie : \(self.player[0].character[2].life)\tArme : \(self.player[0].character[2].weapon.name)\tDégats : \(self.player[0].character[2].weapon.damage)\n")
        print("Nom Joueur 2 : \(self.player[1].name)\n")
        print("Perso 1 : \(self.player[1].character[0].name)\tPoints de vie : \(self.player[1].character[0].life)\tArme : \(self.player[1].character[0].weapon.name)\tDégats : \(self.player[1].character[0].weapon.damage)")
        print("Perso 2 : \(self.player[1].character[1].name)\tPoints de vie : \(self.player[1].character[1].life)\tArme : \(self.player[1].character[1].weapon.name)\tDégats : \(self.player[1].character[1].weapon.damage)")
        print("Perso 3 : \(self.player[1].character[2].name)\tPoints de vie : \(self.player[1].character[2].life)\tArme : \(self.player[1].character[2].weapon.name)\tDégats : \(self.player[1].character[2].weapon.damage)\n")
        
    }
    
    //Fonction pour Affichez toutes les informations 
    /*func displayAll(){
        var phrase1 = "Nom Joueur 1 : \(self.player[0].name)"
        var phrase2 = "Perso 1 : \(self.player[0].character[0].name)\tPoints de vie : \(self.player[0].character[0].life)\tArme : \(self.player[0].character[0].weapon.name)"
        var phrase3 = "Perso 2 : \(self.player[0].character[1].name)\tPoints de vie : \(self.player[0].character[1].life)\tArme : \(self.player[0].character[1].weapon.name)"
        var phrase4 = "Perso 3 : \(self.player[0].character[2].name)\tPoints de vie : \(self.player[0].character[2].life)\tArme : \(self.player[0].character[2].weapon.name)"
        let longueur : Int
        
        if phrase1.count>=phrase2.count && phrase1.count>=phrase3.count && phrase1.count>=phrase4.count {
            longueur=phrase1.count
        }else {
            if phrase2.count>=phrase3.count && phrase2.count>=phrase4.count && phrase2.count>=phrase1.count{
                longueur=phrase2.count
            }else{
                if phrase3.count>=phrase4.count && phrase3.count>=phrase2.count && phrase3.count>=phrase1.count{
                    longueur=phrase3.count
                }else{
                    longueur=phrase4.count
                }
            }
        }
            
        
        var count = longueur-phrase1.count
//        if count > 0 {
//            for _ in 0 ... count {
//                phrase1 = phrase1 + "\t"
//            }
//        }
//        count = longueur-phrase2.count
//        if count > 0 {
//            for _ in 0 ... count {
//                phrase2 = phrase2 + "\t"
//            }
//        }
//        count = longueur-phrase3.count
//        if count > 0 {
//            for _ in 0 ... count {
//                phrase3 = phrase3 + "\t"
//            }
//        }
//        count = longueur-phrase4.count
//        if count > 0 {
//            for _ in 0 ... count {
//                phrase4 = phrase4 + "\t"
//            }
//        }
        print("\(phrase1)\t\t\t\t\t\t\t\t||\tNom Joueur 2 : \(self.player[1].name)")
        print("\(phrase2)\t||\tPerso 1 : \(self.player[1].character[0].name)\tPoints de vie : \(self.player[1].character[0].life)")
        print("\(phrase3)\t||\tPerso 2 : \(self.player[1].character[1].name)\tPoints de vie : \(self.player[1].character[1].life)")
        print("\(phrase4)\t||\tPerso 3 : \(self.player[1].character[2].name)\tPoints de vie : \(self.player[1].character[2].life)")
    

    }*/
    
    
    // Fonction pour tester si la partie est fini ou non
    func endGame() -> Bool{
        if (self.player[0].character[0].life == 0 && self.player[0].character[1].life == 0 && self.player[0].character[2].life == 0) || (self.player[1].character[0].life == 0 && self.player[1].character[1].life == 0 && self.player[1].character[2].life == 0) {
            return false
        }else{
            return true
        }
    }
    
    // Fonction retournant le vainqueur de la partie
    func whosWin() -> Player {
        if (self.player[0].character[0].life == 0 && self.player[0].character[1].life == 0 && self.player[0].character[2].life == 0) {
            return self.player[1]
        }else{
            return self.player[0]
        }
    }
    
    
    
    
    
    static func launchGame() {
        
        let game = Game()
        
        game.chooseNamePlayer()
        game.ChooseCharacterForYourTeam()
        game.displayCharacters()
    
        print("\n\n\nMaintenant que chaque équipe est constitué la partie peux commencer.\nChacun votre tour vous pourrez décider quelle action éxécuter entre attaque et soin.\nLes dégats infligés dépendent de l'arme que posséde votre personnage tandis que le soin sera de 50 PV quelque soit le personnage choisis.\nBon jeu a vous et bonne partie !\n\n\n")
        var i = 0
        repeat {
            let y = i%2
            print("C'est à ton tour de jouer \(game.player[y].name)")
            if game.player[y].ChooseAction() == 1 {
                game.player[y].ChooseCharacter().attack(character: game.player[(y+1)%2].ChooseCharacterUndergo())
            }else{
                game.player[y].ChooseCharacter().care(character: game.player[y].ChooseCharacterUndergo())
            }
            
            i = i + 1
            game.numbersOfLaps = game.numbersOfLaps + 1
        } while game.endGame()
        
        game.displayCharacters()
        
        print("Fin de la partie le gagnant est \(game.whosWin().name) et il y a eu \(game.numbersOfLaps) Tours")
    }
}
