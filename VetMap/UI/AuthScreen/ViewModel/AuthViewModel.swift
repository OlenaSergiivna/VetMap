//
//  AuthViewModel.swift
//  VetMap
//
//  Created by user on 20.09.2023.
//

import Foundation

protocol AuthViewModel: AnyObject {
    var openTheNextScreeen: (() -> Void)?  { get set }

}

class AuthViewModelImpl: AuthViewModel {
    
    var openTheNextScreeen: (() -> Void)?

}
