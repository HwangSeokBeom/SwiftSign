//
//  CoreDataManger.swift
//  SwiftSign
//
//  Created by Hwangseokbeom on 4/19/25.
//

import Foundation
import CoreData
import UIKit

final class CoreDataManager {

    static let shared = CoreDataManager()
    private init() {}

    private var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }

    // 이메일 중복 확인
    func isEmailDuplicated(email: String) -> Bool {
        let request: NSFetchRequest<CoreDataUser> = CoreDataUser.fetchRequest()
        request.predicate = NSPredicate(format: "email == %@", email)

        do {
            let result = try context.fetch(request)
            return !result.isEmpty
        } catch {
            print("이메일 중복 확인 실패: \(error)")
            return false
        }
    }

    // 사용자 저장
    func saveUser(email: String, password: String, nickname: String) -> Bool {
        let user = CoreDataUser(context: context)
        user.email = email
        user.password = password
        user.nickname = nickname

        do {
            try context.save()
            return true
        } catch {
            print("저장 실패: \(error)")
            return false
        }
    }

    // 모든 사용자 가져오기 (디버그용)
    func fetchAllUsers() -> [CoreDataUser] {
        let request: NSFetchRequest<CoreDataUser> = CoreDataUser.fetchRequest()

        do {
            return try context.fetch(request)
        } catch {
            print("사용자 목록 불러오기 실패: \(error)")
            return []
        }
    }

    // 전체 유저 삭제 (테스트용)
    func deleteAllUsers() {
        let request: NSFetchRequest<NSFetchRequestResult> = CoreDataUser.fetchRequest()
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: request)

        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print("전체 삭제 실패: \(error)")
        }
    }
}
