//
//  DataSourceRepository.swift
//  TODO
//
//  Created by Kuldeep Solanki on 15/06/26.
//

protocol DataSourceRepository {
    associatedtype DataSource
    func fetchAllData() async throws -> [DataSource]
    func fetchData(with id: String) async throws -> DataSource?
    func addData(_ data: DataSource) async throws -> DataSource?
    func updateData(_ data: DataSource) async throws
    func deleteData(with id: String) async throws
}
