import UIKit

@IBDesignable public class DesignableView: UIView {
    
    private var gradientLayer: CAGradientLayer!
    
    @IBInspectable public var firstColor: UIColor = .clear { didSet { setNeedsLayout() } }
    @IBInspectable public var secondColor: UIColor = .clear { didSet { setNeedsLayout() } }
    @IBInspectable public var shadowColor: UIColor = .clear { didSet { setNeedsLayout() } }
    @IBInspectable public var shadowX: CGFloat = 0 { didSet { setNeedsLayout() } }
    @IBInspectable public var shadowY: CGFloat = 0 { didSet { setNeedsLayout() } }
    @IBInspectable public var shadowBlur: CGFloat = 0 { didSet { setNeedsLayout() } }
    @IBInspectable public var startPointX: CGFloat = 0 { didSet { setNeedsLayout() } }
    @IBInspectable public var startPointY: CGFloat = 0 { didSet { setNeedsLayout() } }
    @IBInspectable public var endPointX: CGFloat = 0 { didSet { setNeedsLayout() } }
    @IBInspectable public var endPointY: CGFloat = 0 { didSet { setNeedsLayout() } }
    @IBInspectable public var cornerRadius: CGFloat = 0 { didSet { setNeedsLayout() } }
    @IBInspectable public var borderWidth: CGFloat = 0 { didSet { setNeedsLayout() } }
    @IBInspectable public var borderColor: UIColor = .clear { didSet { setNeedsLayout() } }
    @IBInspectable public var roundTopCorner: Bool = true { didSet { setNeedsLayout() } }
    @IBInspectable public var roundBottomCorner: Bool = true { didSet { setNeedsLayout() } }

    override public class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    
    override public func layoutSubviews() {
        self.gradientLayer = self.layer as? CAGradientLayer
        self.gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        self.gradientLayer.startPoint = CGPoint(x: startPointX, y: startPointY)
        self.gradientLayer.endPoint = CGPoint(x: endPointX, y: endPointY)
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: shadowX, height: shadowY)
        self.layer.shadowRadius = shadowBlur
        self.layer.shadowOpacity = 1
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = borderWidth
        self.roundCorners()
    }
    
    private func roundCorners() {
        if #available(iOS 11.0, *) {
            self.layer.cornerRadius = cornerRadius
            self.layer.maskedCorners = []
            if self.roundTopCorner {
                self.layer.maskedCorners.insert([.layerMinXMinYCorner, .layerMaxXMinYCorner])
            }
            if self.roundBottomCorner {
                self.layer.maskedCorners.insert([.layerMinXMaxYCorner, .layerMaxXMaxYCorner])
            }
        } else {
            let rectShape = CAShapeLayer()
            rectShape.bounds = self.frame
            rectShape.position = self.center
            if self.roundTopCorner {
                rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 20, height: 20)).cgPath
            }
            if self.roundBottomCorner {
                rectShape.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: 20, height: 20)).cgPath
            }
        }
    }
}
