//
//  ViewModelBinding.swift
//  CogniwideTask
//
//  Created by Rathish Krish on 19/12/20.
//

import Foundation

protocol ViewModelBinding {
    associatedtype Inputs
    associatedtype Outputs
    var inputs: Inputs { get }
    var outputs: Outputs { get }
}

protocol ViewModelDependency {
    associatedtype Dependency
    init(withDependency dependency:Dependency)
}
