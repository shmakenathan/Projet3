class Player {
    
    var name = ""
    var character = [Character]()
    
    
    init(name : String){
        self.name = name
    }
    
    
    
    
    
    func input() -> Int {
        if let strData = readLine(),let intValue = Int(strData){
            return intValue
        }else{
            return 0
        }
    }
    
    
    
    // Fonction pour choisir l'action a éfféctuer
    func ChooseAction() -> Int{
        var i : Int
        repeat{
            print("Que veux tu faire \(self.name):\n1.Attaque\n2.Soin")
            i = input()
            if i > 2 || i < 1{
                print("Erreur !! Tapez 1 ou 2 uniquement")
            }
        }while i > 2 || i < 1
        return i
    }
    
    
    
    
    
    // Fonction pour choisir le personnage qui va effectuer l'action
    func ChooseCharacter() -> Character {
        var i : Int
        repeat {
            print("\(self.name) choisis ton Personnage :")
            for j in 0...2 {
                if self.character[j].life > 0 {
                    print("\(j+1).\(self.character[j].name)")
                }
            }
            i = input()
            
            if i <= 3 && i >= 1 {
                if self.character[i-1].life <= 0 {
                    print("Personnage Mort")
                    i = 0
                }
            }else{
                print("Erreur !! Rentrez un nombre valide uniquement")
            }
        } while i < 1 || i > 3
        return self.character[i-1]
    }
    
    
    
    
    // Fonction pour choisir le personnage qui subit l'action
    func ChooseCharacterUndergo() -> Character {
        var i : Int
        repeat {
            print("Choisis le personnage qui va subir l'action :")
            for j in 0...2 {
                if self.character[j].life > 0 {
                    print("\(j+1).\(self.character[j].name)")
                }
            }
            i = input()
            if i <= 3 && i >= 1 {
                if self.character[i-1].life <= 0 {
                    print("Personnage Mort")
                    i = 0
                }
            }else{
                print("Erreur !! Rentrez un nombre valide uniquement")
            }
        } while i < 1 || i > 3
        return self.character[i-1]
    }
    
    
    
    
    
    
    
    
}
