//
//  TransactionsContainerRemoteEntityMapper.swift
//  WalletPlus
//
//  Created by William Ching on 2021-06-02.
//

import Foundation

class TransactionsContainerRemoteEntityMapper {
    func toTransactionContainer(remoteEntity: TransactionsContainerRemoteEntity) -> TransactionsContainer {
        return TransactionsContainer(id: remoteEntity.id ?? UUID().uuidString, transactions: nil, name: remoteEntity.name)
    }
}


