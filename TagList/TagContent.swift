//
//  Tag.swift
//  TagList
//
//  Created by 王继荣 on 13/12/2016.
//  Copyright © 2016 wonderbear. All rights reserved.
//

import UIKit

public protocol TagActionable {
    
    var actionDelegate: TagActionDelegate? { get set }
}

public protocol TagActionDelegate: NSObjectProtocol {
    
    func tagActionTriggered(action: TagAction)
}

public protocol TagStatable {
    
    var stateDelegate: TagStateDelegate? { get set }
}

public protocol TagStateDelegate: NSObjectProtocol {
    
    func tagStateDidChange(state: UIControlState)
}

open class TagContent: UIView, TagActionable, TagStatable {
    
    public weak var actionDelegate: TagActionDelegate?
    public weak var stateDelegate: TagStateDelegate?
    
    private(set) var content: TagPresentable
    
    public required init(content: TagPresentable) {
        self.content = content
        super.init(frame: CGRect.zero)
        
        isUserInteractionEnabled = false
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TagContent: TagActionDelegate {
    
    public func tagActionTriggered(action: TagAction) {
        actionDelegate?.tagActionTriggered(action: action)
    }
}

extension TagContent: TagStateDelegate {

    public func tagStateDidChange(state: UIControlState) {
        stateDelegate?.tagStateDidChange(state: state)
    }
}
