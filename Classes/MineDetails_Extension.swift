//
//  CTMediator+Extension.swift
//  PXCTMediatorExtension
//
//  Created by 侯佳男 on 2019/1/17.
//  Copyright © 2019年 侯佳男. All rights reserved.
//

import CTMediator

public extension CTMediator {
    @objc public func A_showSwift(callback:@escaping (String) -> Void) -> UIViewController? {
        let params = [
            "callback":callback,
            kCTMediatorParamsKeySwiftTargetModuleName:"GAMineDetailsViewController"
            ] as [AnyHashable : Any]
        if let viewController = self.performTarget("MineDetails", action: "Extension_GAMineDetailsViewController", params: params, shouldCacheTarget: false) as? UIViewController {
            return viewController
        }
        return nil
    }
    
    @objc public func A_showObjc(callback:@escaping (String) -> Void) -> UIViewController? {
        let callbackBlock = callback as @convention(block) (String) -> Void
        let callbackBlockObject = unsafeBitCast(callbackBlock, to: AnyObject.self)
        let params = ["callback":callbackBlockObject] as [AnyHashable:Any]
        if let viewController = self.performTarget("MineDetails", action: "Extension_GAMineDetailsViewController", params: params, shouldCacheTarget: false) as? UIViewController {
            return viewController
        }
        return nil
    }
}
