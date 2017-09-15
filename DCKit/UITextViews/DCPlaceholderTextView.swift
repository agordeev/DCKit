//
//  DCPlaceholderTextView.swift
//  DCKitSample
//
//  Created by Andrey Gordeev on 5/8/15.
//  Copyright (c) 2015 Andrey Gordeev. All rights reserved.
//

import UIKit

/// UITextView subclass that adds placeholder support like UITextField has. Swift version of https://github.com/soffes/SAMTextView/tree/master/SAMTextView
@IBDesignable open class DCPlaceholderTextView: DCBorderedTextView {

    /// The string that is displayed when there is no other text in the text view.
    /// This property reads and writes the attributed variant.
    @IBInspectable open var placeholder: String? {
        set {
            if newValue == self.attributedPlaceholder?.string {
                return
            }

            var attributes = [NSAttributedStringKey: Any]()
            // This was in the original SAMTextView, but I really don't understand, why this is needed.
            // This makes placeholder appear as entered text, which seems wrong, so I commented it out.
//            if isFirstResponder() && (typingAttributes != nil) {
//                attributes.addEntriesFromDictionary(typingAttributes)
//            }
//            else {
                attributes[NSAttributedStringKey.font] = font
                attributes[NSAttributedStringKey.foregroundColor] = UIColor(red: 0, green: 0, blue: 0.0980392, alpha: 0.22)
//            }

            if textAlignment != NSTextAlignment.left {
                let paragraph = NSMutableParagraphStyle()
                paragraph.alignment = textAlignment
                attributes[NSAttributedStringKey.paragraphStyle] = paragraph
            }

            attributedPlaceholder = NSAttributedString(string: newValue ?? "", attributes: attributes)
        }
        get {
            return self.attributedPlaceholder?.string
        }
    }

    /// The attributed string that is displayed when there is no other text in the text view.
    //swiftlint:disable valid_ibinspectable
    @IBInspectable open var attributedPlaceholder: NSAttributedString? {
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

    /**
     Returns a rect for a placeholder

     - parameter bounds: Text view bounds.
     */
    func placeholderRectForBounds(_ bounds: CGRect) -> CGRect {
        var rect = UIEdgeInsetsInsetRect(bounds, contentInset)

        if responds(to: #selector(getter: UITextView.textContainer)) {
            rect = UIEdgeInsetsInsetRect(rect, textContainerInset)
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

        NotificationCenter.default.addObserver(self, selector: #selector(DCPlaceholderTextView.textChanged), name: NSNotification.Name.UITextViewTextDidChange, object: self)
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
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UITextViewTextDidChange, object: self)
    }

}
