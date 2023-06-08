//
//  NeonPageControlV6.swift
//  NeonPageControl  
import UIKit

open class NeonPageControlV6: NeonBasePageControl {

    fileprivate var diameter: CGFloat {
        return radius * 2
    }

    fileprivate var elements = [NeonLayer]()

    fileprivate var frames = [CGRect]()
    fileprivate var min: CGRect?
    fileprivate var max: CGRect?

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override func updateNumberOfPages(_ count: Int) {
        elements.forEach { $0.removeFromSuperlayer() }
        elements = [NeonLayer]()
        elements = (0..<count).map {_ in
            let layer = NeonLayer()
            self.layer.addSublayer(layer)
            return layer
        }

        setNeedsLayout()
        self.invalidateIntrinsicContentSize()
    }

    override open func layoutSubviews() {
        super.layoutSubviews()
        
        let floatCount = CGFloat(elements.count)
        let x = (self.bounds.size.width - self.diameter*floatCount - self.padding*(floatCount-1))*0.5
        let y = (self.bounds.size.height - self.diameter)*0.5
        var frame = CGRect(x: x, y: y, width: self.diameter, height: self.diameter)

        elements.enumerated().forEach() { index, layer in
            layer.backgroundColor = self.tintColor(position: index).withAlphaComponent(self.inactiveTransparency).cgColor
            if self.borderWidth > 0 {
                layer.borderWidth = self.borderWidth
                layer.borderColor = self.tintColor(position: index).cgColor
            }
            layer.cornerRadius = self.radius
            layer.frame = frame
            frame.origin.x += self.diameter + self.padding
        }
        
        if let active = elements.first {
            active.backgroundColor = (self.currentPageTintColor ?? self.tintColor)?.cgColor
            active.borderWidth = 0
        }

        min = elements.first?.frame
        max = elements.last?.frame

        self.frames = elements.map { $0.frame }
        update(for: progress)
    }

    override func update(for progress: Double) {
        guard let min = self.min,
            let max = self.max,
            progress >= 0 && progress <= Double(numberOfPages - 1),
            numberOfPages > 1 else {
                return
        }

        let total = Double(numberOfPages - 1)
        let dist = max.origin.x - min.origin.x
        let percent = CGFloat(progress / total)
        let page = Int(progress)
        
        for (index, _) in self.frames.enumerated() {
            if page > index {
                self.elements[index+1].frame = self.frames[index]
            } else if page < index {
                self.elements[index].frame = self.frames[index]
            }
        }

        let offset = dist * percent
        guard let active = elements.first else { return }
        active.frame.origin.x = min.origin.x + offset

        let index = page + 1

        guard elements.indices.contains(index) else {
            if frames.indices.contains(page) {
                active.frame = frames[page]
            }
            return
        }

        let element = elements[index]
        guard frames.indices.contains(index - 1), frames.indices.contains(index) else { return }

        let prev = frames[index - 1]
        let prevColor = tintColor(position: index - 1)
        let current = frames[index]
        let currentColor = tintColor(position: index)

        let elementTotal: CGFloat = current.origin.x - prev.origin.x
        let elementProgress: CGFloat = current.origin.x - active.frame.origin.x
        let elementPercent = (elementTotal - elementProgress) / elementTotal
        
        // x: input, a: input min, b: input max, c: output min, d: output max
        // returns mapped value x from (a,b) to (c, d)
        let linearTransform = { (x: CGFloat, a: CGFloat, b: CGFloat, c: CGFloat, d: CGFloat) -> CGFloat in
            return (x - a) / (b - a) * (d - c) + c
        }

        element.frame = prev
        element.frame.origin.x = linearTransform(elementPercent, 1.0, 0.0, prev.origin.x, current.origin.x)
        element.backgroundColor = blend(color1: currentColor, color2: prevColor, progress: elementPercent).withAlphaComponent(self.inactiveTransparency).cgColor

        if elementPercent <= 0.5 {
            let originY = linearTransform(elementPercent, 0.0, 0.5, 0, self.radius + self.padding)
            element.frame.origin.y = (page % 2 == 0 ? originY : -originY) + min.origin.y
        } else {
            let originY = linearTransform(elementPercent, 0.5, 1.0, self.radius + self.padding, 0)
            element.frame.origin.y = (page % 2 == 0 ? originY : -originY) + min.origin.y
        }
        active.frame.origin.y = 2*min.origin.y - element.frame.origin.y
    }

    override open var intrinsicContentSize: CGSize {
        return sizeThatFits(CGSize.zero)
    }

    override open func sizeThatFits(_ size: CGSize) -> CGSize {
        return CGSize(width: CGFloat(elements.count) * self.diameter + CGFloat(elements.count - 1) * self.padding,
                      height: self.diameter)
    }
    
    override open func didTouch(gesture: UITapGestureRecognizer) {
        let point = gesture.location(ofTouch: 0, in: self)
        if var touchIndex = elements.enumerated().first(where: { $0.element.hitTest(point) != nil })?.offset {
            let intProgress = Int(progress)
            if intProgress > 0 {
                if touchIndex == 0 {
                    touchIndex = intProgress
                } else if touchIndex <= intProgress {
                    touchIndex -= 1
                }
            }
            delegate?.didTouch(pager: self, index: touchIndex)
        }
    }
}
