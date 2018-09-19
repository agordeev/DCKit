//
//  DCPlaceholderTextView.swift
//  DCKitSample
//
//  Created by Andrey Gordeev on 5/8/15.
//  Copyright (c) 2015 Andrey Gordeev. All rights reserved.
//

import UIKit

/// UITextView subclass that adds placeholder support like UITextField has. Swift version of https://github.com/soffes/SAMTextView/tree/master/SAMTextView
@IBDesignable
open class DCPlaceholderTextView: DCBorderedTextView {

    /// The string that is displayed when there is no other text in the text view.
    /// This property reads and writes the attributed variant.
    @IBInspectable
    open var placeholder: String? {
        set {
            updateAttributedPlaceholder(value: newValue)
        }
        get {
            return self.attributedPlaceholder?.string
        }
    }

    @IBInspectable
    open var placeholderColor: UIColor = UIColor(red: 0, green: 0, blue: 0.0980392, alpha: 0.22) {
        didSet {
            updateAttributedPlaceholder(value: placeholder)
        }
    }

    /// The attributed string that is displayed when there is no other text in the text view.
    open var attributedPlaceholder: NSAttributedString? {
        didSet {
            setNeedsDisplay()
        }
    }

    override open var text: String! {
        didSet {
            setNeedsDisplay()
        }
    }

    override open var attributedText: NSAttributedString! {
        didSet {
            setNeedsDisplay()
        }
    }

    override open var contentInset: UIEdgeInsets {
        didSet {
            setNeedsDisplay()
        }
    }

    override open var font: UIFont? {
        didSet {
            setNeedsDisplay()
        }
    }

    override open var textAlignment: NSTextAlignment {
        didSet {
            setNeedsDisplay()
        }
    }

    // MARK: - Initialization

    // IBDesignables require both of these inits, otherwise we'll get an error: IBDesignable View Rendering times out.
    // http://stackoverflow.com/questions/26772729/ibdesignable-view-rendering-times-out

    override public init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    // MARK: - Placeholder

    private func updateAttributedPlaceholder(value: String?) {
        var attributes = [NSAttributedString.Key: Any]()
        attributes[.font] = font
        attributes[.foregroundColor] = placeholderColor

        if textAlignment != NSTextAlignment.left {
            let paragraph = NSMutableParagraphStyle()
            paragraph.alignment = textAlignment
            attributes[.paragraphStyle] = paragraph
        }

        attributedPlaceholder = NSAttributedString(string: value ?? "", attributes: attributes)
    }

    /**
     Returns a rect for a placeholder

     - parameter bounds: Text view bounds.
     */
    func placeholderRectForBounds(_ bounds: CGRect) -> CGRect {
        var rect = bounds.inset(by: contentInset)

        if responds(to: #selector(getter: UITextView.textContainer)) {
            rect = rect.inset(by: textContainerInset)
            let padding = textContainer.lineFragmentPadding
            rect.origin.x += padding
            rect.size.width -= padding * 2.0
        } else {
            if contentInset.left == 0.0 {
                rect.origin.x += 8.0
            }
            rect.origin.y += 8.0
        }

        return rect
    }

    // MARK: - Build control

    open override func customInit() {
        super.customInit()

        NotificationCenter.default.addObserver(self, selector: #selector(DCPlaceholderTextView.textChanged), name: UITextView.textDidChangeNotification, object: self)
    }

    // MARK: - Misc

    open override func draw(_ rect: CGRect) {
        super.draw(rect)

        // Draw placeholder if necessary
        guard text.isEmpty else {
            return
        }
        if let attributedPlaceholder = attributedPlaceholder {
            let placeholderRect = placeholderRectForBounds(bounds)
            attributedPlaceholder.draw(in: placeholderRect)
        }
    }

    open override func insertText(_ text: String) {
        super.insertText(text)

        setNeedsDisplay()
    }

    @objc private func textChanged() {
        setNeedsDisplay()
    }

    deinit {
        NotificationCenter.default.removeObserver(self, name: UITextView.textDidChangeNotification, object: self)
    }

}
