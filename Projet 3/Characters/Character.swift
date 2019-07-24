class Character {
    var name = ""
    var weapon : Weapon
    var life = 0
    init(name : String, life : Int, weapon : Weapon) {
        self.name = name
        self.life = life
        self.weapon = weapon
    }
    
    
/// Function allowing a character to attack another
    func attack( character : Character){
        self.chestAppears()
        character.life = character.life - self.weapon.damage
        print("\(self.name) attaque \(character.name) et lui inflige \(self.weapon.damage) de dégats.")
        if character.life < 0 {
            character.life = 0
        }
        print("\(character.name) a maintenant \(character.life) points de vie.\n")
    }
    
/// Function allowing a character to be cared
    func care(character : Character){
        character.life = character.life +  50
        print("\(self.name) utilise soin sur \(character.name) et lui rend 50 PV.")
        print("\(character.name) a maintenant \(character.life) points de vie.\n")
    }

/// Function to change the weapon of a character randomly with 10% to have a legendary weapon
    func changeWeaponRandom(){
        var number = Int.random(in: 1 ... 10)
        
        if number == 1 {
            self.weapon = LegendaryWeapon()
            self.life = self.life * 2
            print("\(self.name) a recu \(self.weapon.name) comme nouvelle arme et inflige maintenant \(self.weapon.damage) de dégats et vois ses points de vie doublés")
        }else{
            number = Int.random(in: 0 ... 14)
            let weapons = [Axe(),Dagger(),Scepter(),Hammer(),Fist(),Sword(),Knife(),Halberd(),Crossbow(),DoubleSword(),Mass(),Spear(),BasebalBat(),Bow(),Katana()]
            self.weapon = weapons[number]
        }
        print("\(self.name) a recu \(self.weapon.name) comme nouvelle arme et inflige maintenant \(self.weapon.damage) de dégats")
    }
    
/// Function that manages the appearance of a chest with a new weapon, the chance that a chest appears is 1 in 10
    func chestAppears() {
       let number = Int.random(in: 1 ... 10)
        if number == 1 {
            print("Un coffre apparait !!!!!\n•\n••\n•••")
            self.changeWeaponRandom()
        }
    }
    
    
    
    
}
