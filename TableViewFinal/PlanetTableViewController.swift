//
//  PlanetTableViewController.swift
//  TableViewFinal
//
//  Created by James Campagno on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class PlanetTableViewController: UITableViewController {
    
    let planetCellIdentifier = "PlanetCell"
    var planets: [Planet] = []
    
    func generatePlanetInfo() {
        
        let earth: Planet = Planet(name: "Earth", numberOfMoons: 1, fullOrbit: 365.26, facts: ["Earth is the only planet not named after a god.", "Earth has a powerful magnetic field.", "Earth was once believed to be the center of the universe."])
        
        let mars: Planet = Planet(name: "Mars", numberOfMoons: 2, fullOrbit: 687.0, facts: ["Mars and Earth have approximately the same landmass.", "Mars is home to the tallest mountain in the solar system.", "Pieces of Mars have fallen to Earth."])
        
        planets.append(earth)
        planets.append(mars)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        generatePlanetInfo()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return planets.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlanetCell") as! PlanetTableViewCell
        
        let individualPlanet = planets[indexPath.row]
        let nameForPlanet = individualPlanet.name
        let orbitForPlanet = individualPlanet.fullOrbit
        let numberOfMoons = individualPlanet.numberOfMoons
        let numberOfPlanetFacts = individualPlanet.facts.count
        
        cell.planetNameLabel.text = nameForPlanet
        cell.numberOfDaysFullOrbitLabel.text = String(orbitForPlanet)
        cell.numberOfMoonsLabel.text = String(numberOfMoons)
        cell.numberOfFacts.text = String(numberOfPlanetFacts)
        
        return cell
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier != "showPlanetFacts" { return }
        
        if let dest = segue.destination as? FactTableViewController, let indexPath = tableView.indexPathForSelectedRow {
            dest.planet = planets[(indexPath as NSIndexPath).row]
        }
    }

}
