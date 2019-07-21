class Character {
    var name = ""
    var weapon : Weapon
    var life = 0
    init(name : String, life : Int, weapon : Weapon) {
        self.name = name
        self.life = life
        self.weapon = weapon
    }
    
    
//    Fonction permettant un personnage d'en attaqués un autre
    func attack( character : Character){
        self.ChestAppears()
        character.life = character.life - self.weapon.damage
        print("\(self.name) attaque \(character.name) et lui inflige \(self.weapon.damage) de dégats.")
        if character.life < 0 {
            character.life = 0
        }
        print("\(character.name) a maintenant \(character.life) points de vie.\n")
    }
    
    
//    Fonction permettant un personnage d'etre soignés
    func care(character : Character){
        character.life = character.life +  50
        print("\(self.name) utilise soin sur \(character.name) et lui rend 50 PV.")
        print("\(character.name) a maintenant \(character.life) points de vie.\n")

    }
    
    
//    Fonction permettant de change l'arme d'un personnage de facon aleatoire avec 10% d'avoir une arme légendaire
    func changeWeaponRandom(){
        var number = Int.random(in: 0 ..< 10)
        if number == 0 {
            self.weapon = LegendaryWeapon()
            self.life = self.life * 2
            print("\(self.name) a recu \(self.weapon.name) comme nouvelle arme et inflige maintenant \(self.weapon.damage) de dégats et vois ses points de vie doublés")
        }else{
            number = Int.random(in: 1 ... 15)
            switch number {
            case 1:
                self.weapon = Axe()
            case 2:
                self.weapon = Dagger()
            case 3:
                self.weapon = Scepter()
            case 4:
                self.weapon = Hammer()
            case 5:
                self.weapon = Fist()
            case 6:
                self.weapon = Sword()
            case 7:
                self.weapon = Knife()
            case 8:
                self.weapon = Halberd()
            case 9:
                self.weapon = Crossbow()
            case 10:
                self.weapon = DoubleSword()
            case 11:
                self.weapon = Mass()
            case 12:
                self.weapon = Spear()
            case 13:
                self.weapon = BasebalBat()
            case 14:
                self.weapon = Bow()
            case 15:
                self.weapon = Katana()
            default:
                break
            }
            print("\(self.name) a recu \(self.weapon.name) comme nouvelle arme et inflige maintenant \(self.weapon.damage) de dégats")
        }
    }
    
    
    
    
    //fonction qui gere l'apparition d'un coffre avec une nouvelle arme, la chance qu'un coffre apparaisse est de 1 sur 10
    func ChestAppears() {
       let number = Int.random(in: 1 ... 10)
        if number == 1 {
            print("Un coffre apparait !!!!!\n•\n••\n•••")
            self.changeWeaponRandom()
        }
    }
    
    
    
    
}
